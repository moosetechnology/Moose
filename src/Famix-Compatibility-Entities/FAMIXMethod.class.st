Class {
	#name : #FAMIXMethod,
	#superclass : #FAMIXBehaviouralEntity,
	#traits : 'FamixTMethod + FamixTWithCaughtExceptions + FamixTWithDeclaredExceptions + FamixTWithThrownExceptions',
	#classTraits : 'FamixTMethod classTrait + FamixTWithCaughtExceptions classTrait + FamixTWithDeclaredExceptions classTrait + FamixTWithThrownExceptions classTrait',
	#classVars : [
		'#ShouldSearchForSmalltalkCodeInImage'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXMethod class >> annotation [

	<FMClass: #Method super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage [
	^ ShouldSearchForSmalltalkCodeInImage ifNil: [ ShouldSearchForSmalltalkCodeInImage := true ]
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage: anObject [
	ShouldSearchForSmalltalkCodeInImage := anObject
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ (self queryOutgoingAccesses opposites withinParentUsing: FamixTClass) asSet select: #isAttribute
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> category [
	<FMProperty: #category type: #String>
	<FMComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> category: aString [

	self privateState attributeAt: #category put: aString

	
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> compiledMethod [
	"Return the compiled method associated to the receiver or nil"
	
	^ self smalltalkClass  compiledMethodAt: self name asSymbol
	
	
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> cyclomaticComplexity [
	"redefine this method because we need to override an implementation provided by FamixTMethod"

	<FMProperty: #cyclomaticComplexity type: #Number>
	<FMComment: 'The number of linear-independent paths through a method.'>
	^ self
		lookUpPropertyNamed: #cyclomaticComplexity
		computedAs: [ self mooseModel isSmalltalk ifTrue: [ (RBVisitorForFAMIXMetrics for: self) cyclomaticNumber ] ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'Famix-Java' }
FAMIXMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting level in the hierarchy'>
	
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
	isClassSide := false
]

{ #category : #'Famix-Java' }
FAMIXMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> invokedMethods [
	<FMProperty: #invokedMethods type: #FAMIXMethod> <derived> <multivalued>
	<FMComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> invokingMethods [
	<FMProperty: #invokingMethods type: #FAMIXMethod> <derived> <multivalued>
	<FMComment: 'The methods invoking the receiver'>

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
	<FMProperty: #isClassInitializer type: #Boolean>
	<derived>
	<FMComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
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
	<FMProperty: #isImplementing type: #Boolean>
	<derived>
	<FMComment: 'The method is implementing a method defined in an interface'>
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
	<FMProperty: #isInternalImplementation type: #Boolean>
	<derived>
	<FMComment: 'Public Interface Layer Method'>
	<package: 'Smalltalk'>
	^ (self isInitializer not and: [ self isCalledInternally ])
		and: [ self isPureAccessor not ]
]

{ #category : #'Famix-Java' }
FAMIXMethod >> isJUnit4Test [
	<FMProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isOverriden [
	<FMProperty: #isOverriden type: #Boolean>
	<derived>
	<FMComment: 'The method is overrided in a sub class'>
	"If we have a stub and we don't have the container, we can't have the information"
	(self belongsTo isNil and: [ self isStub ]) ifTrue: [ ^ false ].
	
	^ self belongsTo subclassHierarchyGroup anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> isOverriding [
	<FMProperty: #isOverriding type: #Boolean>
	<derived>
	<FMComment: 'The method is overrinding a method defined in a super class'>
	
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

{ #category : #'Famix-Extensions' }
FAMIXMethod >> numberOfAnnotationInstances [
	<FMProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<FMComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> numberOfInvokedMethods [
	<FMProperty: #numberOfInvokedMethods type: #Number>
	<FMComment: 'Return a number corresponding to the number of invoked methods'>
	<derived>
	
	^ self privateState propertyAt: #numberOfInvokedMethods ifAbsentPut: [self invokedMethods size]
]

{ #category : #'Famix-Extensions' }
FAMIXMethod >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ self mooseModel isSmalltalk ifTrue: [ (RBVisitorForFAMIXMetrics for: self) numberOfMessageSends ] ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'Famix-Implementation' }
FAMIXMethod >> overridesMethod [
	^ self belongsTo superclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
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

{ #category : #'Famix-Implementation' }
FAMIXMethod >> smalltalkClass [ 
	"Return the smalltalk class associated with the receiver. Note that it may be different than doing self parentType because the class and metaclass can be merged."
	
	^   ('*_class' match: self parentType name)
			ifTrue: [self parentType smalltalkClass]
			ifFalse: [self isClassSide 
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
	<FMProperty: #timeStamp type: #String>
	<FMComment: 'TimeStamp of the method with author and time of the last change'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #timeStamp ifAbsentPut: ['']
]

{ #category : #'Famix-Smalltalk' }
FAMIXMethod >> timeStamp: aTimeStamp [

	self privateState attributeAt: #timeStamp put: aTimeStamp
]
