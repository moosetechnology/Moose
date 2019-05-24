Class {
	#name : #FamixJavaClass,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTLCOMMetrics + FamixTClass + FamixTWithExceptions',
	#classTraits : 'FamixJavaTLCOMMetrics classTrait + FamixTClass classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaClass class >> annotation [

	<MSEClass: #Class super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaClass class >> generatedSlotNames [
	<generated>
	'FamixJavaClass class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaClass class >> generatedTraitNames [
	<generated>
	^ #(FamixJavaTLCOMMetrics FamixTClass FamixTWithExceptions)
]

{ #category : #meta }
FamixJavaClass class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> accept: aVisitor [

	aVisitor visitClass: self
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> containsTheReceiverOf: anInvocation [ 
	 
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

{ #category : #'as yet unclassified' }
FamixJavaClass >> isADirectSubclassOf: aClass [ 
	 
	aClass class = FamixJavaClass 
		ifTrue: [^aClass directSubclasses includes: self] 
		ifFalse: [^false]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isADirectSuperclassOf: aClass [ 
	 
	aClass class = FamixJavaClass 
		ifTrue: [^aClass superclass = self] 
		ifFalse: [^false]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isIgnored [
	<MSEProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<MSEComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> isInvokedBy: anInvocation [ 
	 
	^(anInvocation candidateList notNil 
		and: [anInvocation candidateList notEmpty]) 
		ifTrue: 
			[anInvocation candidateList 
				anySatisfy: 
					[:mtd | mtd class name = #FmxStMethod and: [mtd belongsTo == self]]] 
		ifFalse: [false]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> selectWithinYourScope: aMooseQueryResult [
	^ aMooseQueryResult withinClass: self
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]
