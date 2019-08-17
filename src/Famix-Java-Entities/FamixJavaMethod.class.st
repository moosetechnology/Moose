Class {
	#name : #FamixJavaMethod,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixTMethod + FamixTWithCaughtExceptions + FamixTWithDeclaredExceptions + FamixTWithStatements + FamixTWithThrownExceptions',
	#classTraits : 'FamixTMethod classTrait + FamixTWithCaughtExceptions classTrait + FamixTWithDeclaredExceptions classTrait + FamixTWithStatements classTrait + FamixTWithThrownExceptions classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaMethod class >> annotation [

	<MSEClass: #Method super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ (self queryOutgoingAccesses opposites withinParentUsing: FamixTClass) asSet select: #isAttribute
]

{ #category : #accessing }
FamixJavaMethod >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixJavaMethod >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #accessing }
FamixJavaMethod >> category [
	<MSEProperty: #category type: #String>
	<MSEComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> clientBehaviours [
	<MSEProperty: #clientBehaviours type: #FamixJavaMethod> <multivalued> <derived>
	<MSEComment: 'All behaviours that depend on the receiver'>
	^ self invokingBehaviours 
]

{ #category : #testing }
FamixJavaMethod >> hasEmptyBody [
	"Copied from FAMIX2.
	 The closest we can get in FAMIX2 to determine if a body is empty is to check if the method
	 performs no invocations and/or accesses. The only thing left to do would be the declaration
	 of local variables (that are not accesses afterwards).

	Note that an abstract method with only 'self subclassResponsibility' is not regarded as an 
	empty method in this scheme (which is questionable)."
	"note that the presence of statements should be checked too for that..."
	^ self numberOfAccesses = 0 and: [ self numberOfOutgoingInvocations = 0 ]
]

{ #category : #testing }
FamixJavaMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #metrics }
FamixJavaMethod >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #metrics }
FamixJavaMethod >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'Famix-Java' }
FamixJavaMethod >> implementMethod [
	^ self belongsTo implementedInterfaces
		collect: [ :each | each implementationOf: self signature ]
]

{ #category : #'Famix-Java' }
FamixJavaMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokedMethods [
	<MSEProperty: #invokedMethods type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokingBehaviours [
	^ self queryAllIncomingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokingMethods [
	<MSEProperty: #invokingMethods type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoking the receiver'>

	^ self invokingBehaviours select: [ :each | each isMethod ]
]

{ #category : #testing }
FamixJavaMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #testing }
FamixJavaMethod >> isClassInitializer [
	<MSEProperty: #isClassInitializer type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
	^ #initializer = self kind
		or: [ self privateState propertyAt: #isClassInitializer ifAbsent: [ false ] ]
]

{ #category : #testing }
FamixJavaMethod >> isDetectedGetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite not ] ]
]

{ #category : #testing }
FamixJavaMethod >> isDetectedSetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite ] ]
]

{ #category : #testing }
FamixJavaMethod >> isImplementing [
	<MSEProperty: #isImplementing type: #Boolean>
	<derived>
	<MSEComment: 'The method is implementing a method defined in an interface'>
	^ self belongsTo directSuperclasses
		anySatisfy: [ :each | each isInterface and: [ each understands: self signature ] ]
]

{ #category : #testing }
FamixJavaMethod >> isJUnit4Test [
	<MSEProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #testing }
FamixJavaMethod >> isOverriden [
	<MSEProperty: #isOverriden type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrided in a sub class'>
	"If we have a stub and we don't have the container, we can't have the information"
	(self belongsTo isNil and: [ self isStub ]) ifTrue: [ ^ false ].
	
	^ self belongsTo subclassHierarchyGroup anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #testing }
FamixJavaMethod >> isOverriding [
	<MSEProperty: #isOverriding type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrinding a method defined in a super class'>
	
	^self belongsTo directSuperclasses anySatisfy: [:each | 
		each isInterface not and: [each understands: self signature]]
]

{ #category : #testing }
FamixJavaMethod >> isSurelyInvokedBy: aFAMIXMethod [ 
	 
	| outgoingInvo |

	((self isAbstract or: [aFAMIXMethod isAbstract]) 
		or: [(outgoingInvo := aFAMIXMethod queryAllOutgoingInvocations) isEmpty])
		ifFalse: 
			[
			(outgoingInvo do:[:invo |
				(invo signature = self signature and: [invo isASureInvocation]) ifTrue:[
					| invocationRVar | 
					invocationRVar := invo getReceivingFAMIXClass. 
					(invocationRVar notNil 
						and: [(invocationRVar lookUp: self signature) = self]) 
							ifTrue:[^true]
				]
			]).
		].
	^false
]

{ #category : #printing }
FamixJavaMethod >> mooseNameOn: stream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self signature
		ifNotNil: [ stream nextPutAll: self signature ]
		ifNil: [ 
			self name ifNotNil: [ stream nextPutAll: self name] ]
]

{ #category : #accessing }
FamixJavaMethod >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #metrics }
FamixJavaMethod >> numberOfAnnotationInstances [
	<MSEProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<MSEComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]

{ #category : #accessing }
FamixJavaMethod >> numberOfComments [
	<MSEProperty: #numberOfComments type: #Number>
	<MSEComment: 'The number of comment fragments'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #accessing }
FamixJavaMethod >> numberOfComments: aNumber [

	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixJavaMethod >> numberOfConditionals [
	<MSEProperty: #numberOfConditionals type: #Number>
	<MSEComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ 
			self notExistentMetricValue ] 
]

{ #category : #'Famix-Extensions-private' }
FamixJavaMethod >> numberOfConditionals: aNumber [

	self privateState propertyAt: #numberOfConditionals put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> numberOfInvokedMethods [
	<MSEProperty: #numberOfInvokedMethods type: #Number>
	<MSEComment: 'Return a number corresponding to the number of invoked methods'>
	<derived>
	
	^ self privateState propertyAt: #numberOfInvokedMethods ifAbsentPut: [self invokedMethods size]
]

{ #category : #'Famix-Extensions-private' }
FamixJavaMethod >> numberOfOutgoingInvocations [
	<MSEProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<MSEComment: 'The number of invocations in a method'>
	
	^self
		lookUpPropertyNamed: #numberOfOutgoingInvocations
		computedAs: [self outgoingInvocations size]
]

{ #category : #'Famix-Implementation' }
FamixJavaMethod >> overridesMethod [
	^ self belongsTo superclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]

{ #category : #accessing }
FamixJavaMethod >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self parentType parentScope
]

{ #category : #printing }
FamixJavaMethod >> printOn: aStream [
	parentType ifNotNil: [ aStream nextPutAll: parentType name ].
	aStream nextPutAll: '>>'.
	signature ifNotNil: [ aStream nextPutAll: signature ].
	aStream nextPutAll: ' (Method)'
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> providerBehaviours [
	<MSEProperty: #providerBehaviours type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'All behaviours that the receiver depends on'>

	^ self invokedBehaviours 
]
