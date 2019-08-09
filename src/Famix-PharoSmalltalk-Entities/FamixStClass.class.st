Class {
	#name : #FamixStClass,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTWithExceptions + FamixTWithTypedStructures',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTWithExceptions classTrait + FamixTWithTypedStructures classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<MSEClass: #Class super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #accessing }
FamixStClass >> classSide [
	^ self isClassSide
		ifFalse: [ self mooseModel allClasses entityNamed: (self mooseName , '_class') asSymbol ]
		ifTrue: [ self ]
]

{ #category : #accessing }
FamixStClass >> extendedInPackages [
	^ self extendedMethods flatCollectAsSet: [ :m | m atScope: FamixStPackage ]
]

{ #category : #accessing }
FamixStClass >> extendedMethods [
	<MSEProperty: #extendedMethods type: #FamixStMethod>
	<MSEComment: 'Methods which are class extensions in this class.'>
	<derived>
	^ self methods select: #isExtension
]

{ #category : #testing }
FamixStClass >> implements: aString [
	"Was changed from match: for performances and because signature is case sensitive"

	^ self methods anySatisfy: [ :each | aString = each signature ]
]

{ #category : #accessing }
FamixStClass >> instanceSide [
	^ self isClassSide
		ifTrue: [ self mooseModel allClasses entityNamed: (self mooseName removeSuffix: '_class') asSymbol ]
		ifFalse: [ self ]
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixStClass >> clientPackages [

	"returns a set of all the packages that depend on the receiver"
	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'Famix-Implementation' }
FamixStClass >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'as yet unclassified' }
FamixStClass >> instanceSide [
	^self isClassSide
		ifTrue:
			[self mooseModel allClasses
				entityNamed: (self mooseName removeSuffix: '_class') asSymbol]
		ifFalse: [self]
]

{ #category : #'as yet unclassified' }
FamixStClass >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #testing }
FamixStClass >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^'*_class' match: self name
]

{ #category : #'as yet unclassified' }
FamixStClass >> isExtended [

	^ self methods anySatisfy: [ :m| m isExtension ]
]

{ #category : #testing }
FamixStClass >> isExtended [
	^ self methods anySatisfy: #isExtension
]

{ #category : #testing }
FamixStClass >> isInstanceSide [
	^ self isClassSide not
]

{ #category : #testing }
FamixStClass >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	self allSuperclassesDo: [ :each | each name = 'TestCase' ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
FamixStClass >> localMethods [
	<MSEProperty: #extendedMethods type: #FamixStMethod>
	<MSEComment: 'Methods which are local methods of the class and not extensions in this class.'>
	<derived>
	^ self methods reject: #isExtension
]

{ #category : #'as yet unclassified' }
FamixStClass >> localMethods [
	"select all locally defined methods"

	^ self privateState cacheAt: #localMethods
							ifAbsentPut: [ self methods reject: [ :m| m isExtension ] ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [
	"Removing stub and contructor methods. Used to support the calculation of LCOM."

	^ (self methods select: [ :each | each isStub not and: [ each isConstructor not ] ]) asSet
]

{ #category : #'Famix-Implementation' }
FamixStClass >> mooseNameOn: aStream [ 
	| parent |
	parent := self typeContainer.
	parent ifNotNil: 
		[ 
			parent mooseNameOn: aStream.
			aStream
				nextPut: $:;
				nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'moosechef-scoping-filtering' }
FamixStClass >> namespaceScope [ 
"we ask the container for the namespaceScope
	because we can have classes in methods or in other classes.
	Thus, we need to traverse recursively until we reach a namespace"
	
	^ self parentPackage 
		ifNotNil: [ self parentPackage namespaceScope ]
]

{ #category : #'as yet unclassified' }
FamixStClass >> providerPackages [
	"returns a set of all the packages that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #accessing }
FamixStClass >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixTType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on (inherites, staticly accesses, or uses some of their methods)'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'Famix-Implementation' }
FamixStClass >> smalltalkClass [
	"Returns the associated smalltalk class if it exist in the system."

	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: self name ifAbsent: [ nil ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	 ^ self smalltalkClass 
        ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ] 
        ifNil: [ super sourceText ]
]

{ #category : #testing }
FamixStClass >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [ :each | (each implements: signature) ifTrue: [ ^ true ] ].
	^ false
]
