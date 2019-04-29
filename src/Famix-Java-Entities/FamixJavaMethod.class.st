Class {
	#name : #FamixJavaMethod,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixTInvocable + FamixTMethod + FamixTTypedStructure + FamixTWithAccesses + FamixTWithCaughtExceptions + FamixTWithClassScope + FamixTWithDeclaredExceptions + FamixTWithImplicitVariables + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FamixTWithSignature + FamixTWithStatements + FamixTWithThrownExceptions',
	#classTraits : 'FamixTInvocable classTrait + FamixTMethod classTrait + FamixTTypedStructure classTrait + FamixTWithAccesses classTrait + FamixTWithCaughtExceptions classTrait + FamixTWithClassScope classTrait + FamixTWithDeclaredExceptions classTrait + FamixTWithImplicitVariables classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FamixTWithSignature classTrait + FamixTWithStatements classTrait + FamixTWithThrownExceptions classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaMethod class >> annotation [

	<MSEClass: #Method super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaMethod class >> generatedSlotNames [
	<generated>
	'FamixJavaMethod class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaMethod class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocable FamixTMethod FamixTTypedStructure FamixTWithAccesses FamixTWithCaughtExceptions FamixTWithClassScope FamixTWithDeclaredExceptions FamixTWithImplicitVariables FamixTWithInvocations FamixTWithLocalVariables FamixTWithParameters FamixTWithReferences FamixTWithSignature FamixTWithStatements FamixTWithThrownExceptions)
]

{ #category : #meta }
FamixJavaMethod class >> requirements [

	<generated>
	^ { FamixJavaType }
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> accept: aVisitor [

	aVisitor visitMethod: self
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ self queryOutgoingAccesses opposites withinMyClass asSet select: #isAttribute
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

{ #category : #'as yet unclassified' }
FamixJavaMethod >> category [
	<MSEProperty: #category type: #String>
	<MSEComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> clientBehaviours [
	<MSEProperty: #clientBehaviours type: #FamixJavaMethod> <multivalued> <derived>
	<MSEComment: 'All behaviours that depend on the receiver'>
	^ self invokingBehaviours 
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> clientClasses [
	self deprecated: 'use clientTypes instead'.
	^ self clientTypes
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> clientMethods [
	^ self clientBehaviours select: [ :each | each isMethod ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> clientNamespaces [
	"returns a set of all the namespaces that depend on the receiver"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> clientPackages [
	"returns a set of all the packages that depend on the receiver"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self kind: anEntity kind copy.
	self category: anEntity category copy.


]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> entityHasOutgoingTypeDeclarations [
	^ self declaredType isNotNil
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
FamixJavaMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> implementMethod [
	^ self belongsTo implementedInterfaces
		collect: [ :each | each implementationOf: self signature ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> initialize [
	super initialize.
	hasClassScope := false
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> invokedMethods [
	<MSEProperty: #invokedMethods type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> invokingBehaviours [
	^ self queryAllIncomingInvocations opposites
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> invokingMethods [
	<MSEProperty: #invokingMethods type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoking the receiver'>

	^ self invokingBehaviours select: [ :each | each isMethod ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isClassInitializer [
	<MSEProperty: #isClassInitializer type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
	^ #initializer = self kind
		or: [ self privateState propertyAt: #isClassInitializer ifAbsent: [ false ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isDetectedGetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite not ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isDetectedSetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite ] ]
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isOverriden [
	<MSEProperty: #isOverriden type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrided in a sub class'>
	"If we have a stub and we don't have the container, we can't have the information"
	(self belongsTo isNil and: [ self isStub ]) ifTrue: [ ^ false ].
	
	^ self belongsTo subclassHierarchyGroup anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> isOverriding [
	<MSEProperty: #isOverriding type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrinding a method defined in a super class'>
	
	^self belongsTo directSuperclasses anySatisfy: [:each | 
		each isInterface not and: [each understands: self signature]]
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
FamixJavaMethod >> methodScope [
"This is a special case, only meaningful when using #withoutSelfLoops. Rejecting self loops with a method means rejecting recursive calls."

	^ self
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
FamixJavaMethod >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfAnnotationInstances [
	<MSEProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<MSEComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfComments [
	<MSEProperty: #numberOfComments type: #Number>
	<MSEComment: 'The number of comment fragments'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfComments: aNumber [

	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfConditionals [
	<MSEProperty: #numberOfConditionals type: #Number>
	<MSEComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ 
			self notExistentMetricValue ] 
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfConditionals: aNumber [

	self privateState propertyAt: #numberOfConditionals put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfInvokedMethods [
	<MSEProperty: #numberOfInvokedMethods type: #Number>
	<MSEComment: 'Return a number corresponding to the number of invoked methods'>
	<derived>
	
	^ self privateState propertyAt: #numberOfInvokedMethods ifAbsentPut: [self invokedMethods size]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> numberOfOutgoingInvocations [
	<MSEProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<MSEComment: 'The number of invocations in a method'>
	
	^self
		lookUpPropertyNamed: #numberOfOutgoingInvocations
		computedAs: [self outgoingInvocations size]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> overridesMethod [
	^ self belongsTo superclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> packageScope [

	^ self parentPackage ifNil:[ 
		|cl|
		cl := self parentType.
		cl isNil 
			ifTrue:[nil]
			ifFalse:[cl packageScope]
	]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self parentType parentScope
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> printOn: aStream [
	parentType ifNotNil: [ aStream nextPutAll: parentType name ].
	aStream nextPutAll: '>>'.
	signature ifNotNil: [ aStream nextPutAll: signature ].
	aStream nextPutAll: ' (Method)'
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerBehaviours [
	<MSEProperty: #providerBehaviours type: #FamixJavaMethod> <derived> <multivalued>
	<MSEComment: 'All behaviours that the receiver depends on'>

	^ self invokedBehaviours 
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerClasses [
	self deprecated: 'use providerTypes'.
	^ self providerTypes
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerMethods [
	^ self providerBehaviours select: [ :each | each isMethod ]
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on the receiver"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerPackages [
	"returns a set of all the packages that the receiver depends on the receiver"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixJavaType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaMethod >> typeScope [

	^ self parentType 
]
