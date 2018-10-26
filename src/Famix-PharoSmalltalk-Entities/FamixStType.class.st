Class {
	#name : #FamixStType,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTReferenceable + FamixTType + FamixTWithAttributes + FamixTWithTypedStructures',
	#classTraits : 'FamixTReferenceable classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithTypedStructures classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStType class >> annotation [

	<MSEClass: #Type super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStType class >> generatedSlotNames [
	<generated>
	'FamixStType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStType class >> generatedTraitNames [
	<generated>
	^ #(FamixTReferenceable FamixTType FamixTWithAttributes FamixTWithTypedStructures)
]

{ #category : #meta }
FamixStType class >> requirements [

	<generated>
	^ { FamixStContainerEntity }
]

{ #category : #adding }
FamixStType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixStType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #adding }
FamixStType >> classSide [
	^self isClassSide
		ifFalse:
			[self mooseModel allClasses
				entityNamed: (self mooseName , '_class') asSymbol]
		ifTrue: [self]
]

{ #category : #adding }
FamixStType >> clientNamespaces [
	"returns a set of all the namespaces that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByNamespaces union: self invokingNamespaces"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #adding }
FamixStType >> clientPackages [
	"returns a set of all the packages that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #adding }
FamixStType >> container [

	<MSEProperty: #container type: #FamixStContainerEntity>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #adding }
FamixStType >> extendedInPackages [

	^ self privateState cacheAt: #extendedInPackages
							ifAbsentPut: [ self extendedMethods collectAsSet: [ :m| m packageScope ] ]


]

{ #category : #adding }
FamixStType >> extendedMethods [
	"select methods which are class extensions in this class"

	^  self privateState cacheAt: #extendedMethods
							ifAbsentPut: [ self methods select: [ :m| m isExtension ] ]
]

{ #category : #adding }
FamixStType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #adding }
FamixStType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #adding }
FamixStType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #'Famix-Extensions' }
FamixStType >> incomingAccesses [
	^ self privateState 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #adding }
FamixStType >> incomingTypeDeclarations [
	^ self structuresWithDeclaredType , self behavioursWithDeclaredType collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #adding }
FamixStType >> instanceSide [
	^self isClassSide
		ifTrue:
			[self mooseModel allClasses
				entityNamed: (self mooseName removeSuffix: '_class') asSymbol]
		ifFalse: [self]
]

{ #category : #adding }
FamixStType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #testing }
FamixStType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #adding }
FamixStType >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^'*_class' match: self name
]

{ #category : #adding }
FamixStType >> isExtended [

	^ self methods anySatisfy: [ :m| m isExtension ]
]

{ #category : #adding }
FamixStType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #adding }
FamixStType >> isInstanceSide [
	^self isClassSide not
]

{ #category : #adding }
FamixStType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #adding }
FamixStType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #adding }
FamixStType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #adding }
FamixStType >> isSUnitTestCase [
	self allSuperclassesDo: [:each | each name = 'TestCase' ifTrue: [^ true] ].
	^ false
]

{ #category : #adding }
FamixStType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]

{ #category : #adding }
FamixStType >> localMethods [
	"select all locally defined methods"

	^ self privateState cacheAt: #localMethods
							ifAbsentPut: [ self methods reject: [ :m| m isExtension ] ]
]

{ #category : #adding }
FamixStType >> lookUp: aMethodSignature [ 
	"Returns the first method that has as signature #aMethodSignature. 
	The search starts from the receiver's methods and traveses the inherited methods from the receiver's superclasses heirarchy.
	If such a method has not been found, it returns nil"

	| c toSearchIt searchedM |
	c := self.
	searchedM := nil.
	toSearchIt := true.
	[c notNil and: [toSearchIt]] whileTrue: 
			[searchedM := c methods 
						detect: [:m | m signature = aMethodSignature]
						ifNone: [nil].
			searchedM
				ifNil: [c := c superclass]
				ifNotNil: [toSearchIt := false]
			].
	^searchedM
]

{ #category : #adding }
FamixStType >> mooseNameOn: aStream [ 
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

{ #category : #adding }
FamixStType >> namespaceScope [
	"we ask the container for the namespaceScope
	because we can have classes in methods or in other classes.
	Thus, we need to traverse recursively until we reach a namespace"
	
	^ self container 
		ifNotNil: [ self container namespaceScope ]
]

{ #category : #'Famix-Extensions' }
FamixStType >> packageScope [

	^ self parentPackage
]

{ #category : #'Famix-Extensions' }
FamixStType >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedNamespaces union: self invokedNamespaces"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions' }
FamixStType >> providerPackages [
	"returns a set of all the packages that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'Famix-Extensions' }
FamixStType >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixStType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on (inherites, staticly accesses, or uses some of their methods)'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'Famix-Extensions' }
FamixStType >> typeScope [
	"all types are not classes. Redefined in FamixClass"

	^ self
]

{ #category : #'Famix-Extensions' }
FamixStType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]
