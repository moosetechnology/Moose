Class {
	#name : #FamixStClass,
	#superclass : #FamixStType,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<MSEClass: #Class super: #FamixStType>
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
FamixStClass >> hasMethodWithSignature: aSignature [
	self deprecated: 'Use #implements: instead' transformWith: '`@receiver hasMethodWithSignature: `@statements1' -> '`@receiver implements: `@statements1'.
	^ self implements: aSignature
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

{ #category : #testing }
FamixStClass >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^ '*_class' match: self name
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
FamixStClass >> isSUnitTestCase [
	self deprecated: 'Use #isTestCase instead' transformWith: '`@receiver isSUnitTestCase' -> '`@receiver isTestCase'.
	^ self isTestCase
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
