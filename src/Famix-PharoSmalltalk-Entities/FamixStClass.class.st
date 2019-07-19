Class {
	#name : #FamixStClass,
	#superclass : #MooseEntity,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<MSEClass: #Class super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStClass class >> metamodel [

	<generated>
	^ (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]

{ #category : #meta }
FamixStClass class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
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

{ #category : #testing }
FamixStClass >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^'*_class' match: self name
]

{ #category : #testing }
FamixStClass >> isFunction [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FamixStClass >> isIgnored [
	<MSEProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<MSEComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #testing }
FamixStClass >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isInstanceSide [
	^self isClassSide not
]

{ #category : #testing }
FamixStClass >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixStClass >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
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
	
	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: 
			self name  ifAbsent: [nil] 
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	 ^ self smalltalkClass 
        ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ] 
        ifNil: [ super sourceText ]
]
