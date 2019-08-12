Class {
	#name : #FamixStClass,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<MSEClass: #Class super: #FamixStContainerEntity>
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
FamixStClass >> belongsTo [
	^ self typeContainer
]

{ #category : #accessing }
FamixStClass >> belongsTo: anObject [
	self typeContainer: anObject
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

{ #category : #testing }
FamixStClass >> isAnonymousClass [
	self flag: #todo.	"We need to check how to do that in Pharo smalltalk because I think some of the conditions are for Java"
	^ self container notNil and: [ self container isMethod or: [ self name isAllDigits or: [ '*_anonymous_*' match: self name ] ] ]
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
FamixStClass >> isLonelyWithin: aClassGroup [
	^ (self subclassHierarchyGroup intersection: aClassGroup) isEmpty and: [ (self superclassHierarchyGroup intersection: aClassGroup) isEmpty ]
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

{ #category : #accessing }
FamixStClass >> lookUp: signature [
	self withSuperclassesDo: [ :class | class methods detect: [ :method | method signature = signature ] ifFound: [ :found | ^ found ] ].
	^ nil
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [
	"Removing stub and contructor methods. Used to support the calculation of LCOM."

	^ (self methods select: [ :each | each isStub not and: [ each isConstructor not ] ]) asSet
]

{ #category : #'Famix-Implementation' }
FamixStClass >> smalltalkClass [
	"Returns the associated smalltalk class if it exist in the system."

	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: self name ifAbsent: [ nil ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ self instanceSide smalltalkClass
		ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ]
		ifNil: [ super sourceText ]
]

{ #category : #testing }
FamixStClass >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [ :each | (each implements: signature) ifTrue: [ ^ true ] ].
	^ false
]
