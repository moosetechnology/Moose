Class {
	#name : #FAMIXMethod,
	#superclass : #FAMIXBehaviouralEntity,
	#traits : 'FamixTMethod + FamixTWithCaughtExceptions + FamixTWithClassScope + FamixTWithDeclaredExceptions + FamixTWithThrownExceptions',
	#classTraits : 'FamixTMethod classTrait + FamixTWithCaughtExceptions classTrait + FamixTWithClassScope classTrait + FamixTWithDeclaredExceptions classTrait + FamixTWithThrownExceptions classTrait',
	#classVars : [
		'#ShouldSearchForSmalltalkCodeInImage'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXMethod class >> annotation [

	<MSEClass: #Method super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXMethod class >> generatedSlotNames [
	<generated>
	'FAMIXMethod class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXMethod class >> generatedTraitNames [
	<generated>
	^ #(FamixTMethod FamixTWithCaughtExceptions FamixTWithClassScope FamixTWithDeclaredExceptions FamixTWithThrownExceptions)
]

{ #category : #meta }
FAMIXMethod class >> requirements [

	<generated>
	^ { FAMIXType }
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage [
	^ ShouldSearchForSmalltalkCodeInImage ifNil: [ ShouldSearchForSmalltalkCodeInImage := true ]
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage: anObject [
	ShouldSearchForSmalltalkCodeInImage := anObject
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> accept: aVisitor [

	aVisitor visitMethod: self
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ self queryOutgoingAccesses opposites withinMyClass asSet select: #isAttribute
]

{ #category : #accessing }
FAMIXMethod >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FAMIXMethod >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> category [
	<MSEProperty: #category type: #String>
	<MSEComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> category: aString [

	self privateState attributeAt: #category put: aString

	
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> clientClasses [
	self deprecated: 'use clientTypes instead'.
	^ self clientTypes
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> clientMethods [
	^ self clientBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> clientNamespaces [
	"returns a set of all the namespaces that depend on the receiver"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> clientPackages [
	"returns a set of all the packages that depend on the receiver"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> compiledMethod [
	"Return the compiled method associated to the receiver or nil"
	
	^ self smalltalkClass  compiledMethodAt: self name asSymbol
	
	
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self kind: anEntity kind copy.
	self category: anEntity category copy.


]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> cyclomaticComplexity [

	"redefine this method because we need to override an implementation provided by FamixTMethod"

	<MSEProperty: #cyclomaticComplexity type: #Number>
	<MSEComment: 'The number of linear-independent paths through a method.'>
	^ self
		lookUpPropertyNamed: #cyclomaticComplexity
		computedAs: [ self mooseModel isSmalltalk
				ifTrue: [ | parser |
					parser := RBVisitorForFAMIXMetrics new.
					parser processMethod: self usingImporter: nil inModel: nil.
					parser cyclomaticNumber2 ]
				ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'Famix-Java' }
FAMIXMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'Famix-Java' }
FAMIXMethod >> implementMethod [
	^ self belongsTo implementedInterfaces
		collect: [ :each | each implementationOf: self signature ]
]

{ #category : #initialization }
FAMIXMethod >> initialize [
	super initialize.
	hasClassScope := false
]

{ #category : #'Famix-Java' }
FAMIXMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> invokedMethods [
	<MSEProperty: #invokedMethods type: #FAMIXMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> invokingMethods [
	<MSEProperty: #invokingMethods type: #FAMIXMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoking the receiver'>

	^ self invokingBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> isClassInitializer [
	<MSEProperty: #isClassInitializer type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
	^ #initializer = self kind
		or: [ self privateState propertyAt: #isClassInitializer ifAbsent: [ false ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isDetectedGetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite not ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isDetectedSetter [
	^ self outgoingInvocations isEmpty and: [ 
		self accesses size = 1 and: [ 
			self accesses first isWrite ] ]
]

{ #category : #'Famix-Java' }
FAMIXMethod >> isImplementing [
	<MSEProperty: #isImplementing type: #Boolean>
	<derived>
	<MSEComment: 'The method is implementing a method defined in an interface'>
	^ self belongsTo directSuperclasses
		anySatisfy: [ :each | each isInterface and: [ each understands: self signature ] ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> isInitializer [
	^ self mooseModel isSmalltalk
		ifTrue: [ (('*initialize*' match: self category) or: [ '*initialize*' match: self name ]) or: [ self isConstructor ] ]
		ifFalse: [ self isConstructor ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> isInternalImplementation [
	<MSEProperty: #isInternalImplementation type: #Boolean>
	<derived>
	<MSEComment: 'Public Interface Layer Method'>
	<package: 'Smalltalk'>
	^ (self isInitializer not and: [ self isCalledInternally ])
		and: [ self isPureAccessor not ]
]

{ #category : #'Famix-Java' }
FAMIXMethod >> isJUnit4Test [
	<MSEProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isOverriden [
	<MSEProperty: #isOverriden type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrided in a sub class'>
	"If we have a stub and we don't have the container, we can't have the information"
	(self belongsTo isNil and: [ self isStub ]) ifTrue: [ ^ false ].
	
	^ self belongsTo subclassHierarchyGroup anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isOverriding [
	<MSEProperty: #isOverriding type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrinding a method defined in a super class'>
	
	^self belongsTo directSuperclasses anySatisfy: [:each | 
		each isInterface not and: [each understands: self signature]]
]

{ #category : #'Famix-Extensions-InvocationTesting' }
FAMIXMethod >> isSurelyInvokedBy: aFAMIXMethod [ 
	 
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> methodScope [
"This is a special case, only meaningful when using #withoutSelfLoops. Rejecting self loops with a method means rejecting recursive calls."

	^ self
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> mooseNameOn: stream [ 
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> numberOfAnnotationInstances [
	<MSEProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<MSEComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> numberOfInvokedMethods [
	<MSEProperty: #numberOfInvokedMethods type: #Number>
	<MSEComment: 'Return a number corresponding to the number of invoked methods'>
	<derived>
	
	^ self privateState propertyAt: #numberOfInvokedMethods ifAbsentPut: [self invokedMethods size]
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> overridesMethod [
	^ self belongsTo superclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> packageScope [

	^ self parentPackage ifNil:[ 
		|cl|
		cl := self parentType.
		cl isNil 
			ifTrue:[nil]
			ifFalse:[cl packageScope]
	]
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self parentType parentScope
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> printOn: aStream [
	parentType ifNotNil: [ aStream nextPutAll: parentType name ].
	aStream nextPutAll: '>>'.
	signature ifNotNil: [ aStream nextPutAll: signature ].
	aStream nextPutAll: ' (Method)'
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> providerClasses [
	self deprecated: 'use providerTypes'.
	^ self providerTypes
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> providerMethods [
	^ self providerBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on the receiver"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> providerPackages [
	"returns a set of all the packages that the receiver depends on the receiver"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXMethod >> providerTypes [
	<MSEProperty: #providerTypes type: #FAMIXType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> smalltalkClass [ 
	"Return the smalltalk class associated with the receiver. Note that it may be different than doing self parentType because the class and metaclass can be merged."
	
	^   ('*_class' match: self parentType name)
			ifTrue: [self parentType smalltalkClass]
			ifFalse: [self hasClassScope 
							ifTrue: [self parentType smalltalkClass class]
							ifFalse: [self parentType smalltalkClass]]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ (self sourceLanguage isNotNil and: [self sourceLanguage isSmalltalk and: [ self class shouldSearchForSmalltalkCodeInImage ]])
		ifTrue: [ [ | class |
			"take the normal class"
			class := Smalltalk at: self parentType instanceSide name asSymbol.
			self hasClassScope
				ifFalse: [ class sourceCodeAt: self name asSymbol ]
				ifTrue: [ class class sourceCodeAt: self name asSymbol ]	"dispatch on class or metaclass depending on method scope" ]
				on: Error
				do: [ super sourceText ]	"probably class is not in the system" ]
		ifFalse: [ super sourceText ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> timeStamp [
	<MSEProperty: #timeStamp type: #String>
	<MSEComment: 'TimeStamp of the method with author and time of the last change'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #timeStamp ifAbsentPut: ['']
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> timeStamp: aTimeStamp [

	self privateState attributeAt: #timeStamp put: aTimeStamp
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> typeScope [

	^ self parentType 
]
