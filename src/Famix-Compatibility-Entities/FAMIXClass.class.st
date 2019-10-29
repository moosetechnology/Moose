Class {
	#name : #FAMIXClass,
	#superclass : #FAMIXType,
	#traits : 'FamixTClass + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTWithExceptions classTrait',
	#instVars : [
		'#isInterface'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXClass class >> annotation [

	<FMClass: #Class super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> containsTheReceiverOf: anInvocation [ 
	 
	^anInvocation receivingVariable notNil 
		ifTrue: 
			[anInvocation receivingVariable class name = #FAMIXClass 
				ifTrue: [anInvocation receivingVariable == self] 
				ifFalse: 
					[anInvocation receivingVariable class name = #FAMIXImplicitVariable 
						ifTrue: [anInvocation receivingVariable belongsTo == self] 
						ifFalse: [false]]] 
		ifFalse: [false]
]

{ #category : #initialization }
FAMIXClass >> initialize [

	super initialize.
	isInterface := false
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isADirectSubclassOf: aClass [ 
	 
	aClass class = FAMIXClass 
		ifTrue: [^aClass directSubclasses includes: self] 
		ifFalse: [^false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isADirectSuperclassOf: aClass [ 
	 
	aClass class = FAMIXClass 
		ifTrue: [^aClass superclass = self] 
		ifFalse: [^false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FAMIXClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FAMIXClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #'Famix-Java' }
FAMIXClass >> isIgnored [
	<FMProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<FMComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #accessing }
FAMIXClass >> isInterface [
	<FMProperty: #isInterface type: #Boolean>
	<FMComment: 'This is a boolean flag used to distinguish between classes with implementation and interfaces. It is particularly relevant for Java systems.'>
	^ isInterface ifNil: [ false ]
]

{ #category : #accessing }
FAMIXClass >> isInterface: boolean [
	isInterface := boolean
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isInvokedBy: anInvocation [ 
	 
	^(anInvocation candidateList notNil 
		and: [anInvocation candidateList notEmpty]) 
		ifTrue: 
			[anInvocation candidateList 
				anySatisfy: 
					[:mtd | mtd class name = #FmxStMethod and: [mtd belongsTo == self]]] 
		ifFalse: [false]
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #'Famix-Implementation' }
FAMIXClass >> smalltalkClass [ 
	"Returns the associated smalltalk class if it exist in the system."
	
	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: 
			self name  ifAbsent: [nil] 
]

{ #category : #'Famix-Smalltalk' }
FAMIXClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ self sourceLanguage isSmalltalk
			ifTrue: [  self smalltalkClass 
				ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ] 
				ifNil: [ super sourceText ]]
			ifFalse: [ super sourceText ]
]

{ #category : #'Famix-Extensions' }
FAMIXClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]
