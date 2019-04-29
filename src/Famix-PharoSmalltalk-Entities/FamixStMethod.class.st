Class {
	#name : #FamixStMethod,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTInvocable + FamixTMethod + FamixTTypedStructure + FamixTWithAccesses + FamixTWithClassScope + FamixTWithImplicitVariables + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FamixTWithSignature',
	#classTraits : 'FamixTInvocable classTrait + FamixTMethod classTrait + FamixTTypedStructure classTrait + FamixTWithAccesses classTrait + FamixTWithClassScope classTrait + FamixTWithImplicitVariables classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FamixTWithSignature classTrait',
	#instVars : [
		'#protocol'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStMethod class >> annotation [

	<MSEClass: #Method super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStMethod class >> generatedSlotNames [
	<generated>
	'FamixStMethod class>>#generatedSlotNames'.
	^ #(protocol)
]

{ #category : #generator }
FamixStMethod class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocable FamixTMethod FamixTTypedStructure FamixTWithAccesses FamixTWithClassScope FamixTWithImplicitVariables FamixTWithInvocations FamixTWithLocalVariables FamixTWithParameters FamixTWithReferences FamixTWithSignature)
]

{ #category : #meta }
FamixStMethod class >> requirements [

	<generated>
	^ { FamixStClass }
]

{ #category : #meta }
FamixStMethod class >> shouldSearchForSmalltalkCodeInImage [
	^ true
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ self queryOutgoingAccesses opposites withinMyClass asSet select: #isAttribute
]

{ #category : #accessing }
FamixStMethod >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixStMethod >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> category [
	<MSEProperty: #category type: #String>
	<MSEComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> category: aString [

	self privateState attributeAt: #category put: aString

	
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> compiledMethod [
	"Return the compiled method associated to the receiver or nil"
	
	^ self smalltalkClass compiledMethodAt: self name asSymbol
	
	
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> computeNumberOfLinesOfCodeIfSmalltalk [
	| parser |
	
	parser := RBVisitorForFAMIXMetrics new.
	parser processMethod: self usingImporter: nil inModel: nil.
	^ parser numberOfLinesOfCode
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> cyclomaticComplexity [
	<MSEProperty: #cyclomaticComplexity type: #Number>
	<MSEComment: 'The number of linear-independent paths through a method.'>
	^ self
		lookUpPropertyNamed: #cyclomaticComplexity
		computedAs: [ 
			| parser |
			parser := RBVisitorForFAMIXMetrics new.
			parser processMethod: self usingImporter: nil inModel: nil.
			parser cyclomaticNumber2 ]
			
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> entityHasOutgoingTypeDeclarations [
	^ self declaredType isNotNil
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> hasEmptyBody [
	"Copied from FAMIX2.
	 The closest we can get in FAMIX2 to determine if a body is empty is to check if the method
	 performs no invocations and/or accesses. The only thing left to do would be the declaration
	 of local variables (that are not accesses afterwards).

	Note that an abstract method with only 'self subclassResponsibility' is not regarded as an 
	empty method in this scheme (which is questionable)."
	"note that the presence of statements should be checked too for that..."
	^ self numberOfAccesses = 0 and: [ self numberOfOutgoingInvocations = 0 ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> initialize [
	super initialize.
	hasClassScope := false
]

{ #category : #'Famix-Extensions' }
FamixStMethod >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixStMethod >> invokedMethods [
	<MSEProperty: #invokedMethods type: #FamixStMethod> <derived> <multivalued>
	<MSEComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isInitializer [
	^ (('*initialize*' match: self category) or: [ '*initialize*' match: self name ]) or: [ self isConstructor ] 
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isInternalImplementation [
	<MSEProperty: #isInternalImplementation type: #Boolean>
	<derived>
	<MSEComment: 'Public Interface Layer Method'>
	<package: 'Smalltalk'>
	^ (self isInitializer not and: [ self isCalledInternally ])
		and: [ self isPureAccessor not ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isJUnit4Test [
	<MSEProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isOverriden [
	<MSEProperty: #isOverriden type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrided in a sub class'>
	"If we have a stub and we don't have the container, we can't have the information"
	(self belongsTo isNil and: [ self isStub ]) ifTrue: [ ^ false ].
	
	^ self belongsTo subclassHierarchyGroup anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isOverriding [
	<MSEProperty: #isOverriding type: #Boolean>
	<derived>
	<MSEComment: 'The method is overrinding a method defined in a super class'>
	
	^self belongsTo directSuperclasses anySatisfy: [:each | 
		each isInterface not and: [each understands: self signature]]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isSurelyInvokedBy: aFAMIXMethod [ 
	 
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

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> mooseNameOn: stream [ 
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

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> numberOfAnnotationInstances [
	<MSEProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<MSEComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfComments [
	<MSEProperty: #numberOfComments type: #Number>
	<MSEComment: 'The number of comment fragments'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfComments: aNumber [

	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfConditionals [
	<MSEProperty: #numberOfConditionals type: #Number>
	<MSEComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ 
			| parser |
			parser := RBVisitorForFAMIXMetrics new.
			parser processMethod: self usingImporter: nil inModel: nil.
			parser numberOfConditionals ]
			
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfConditionals: aNumber [

	self privateState propertyAt: #numberOfConditionals put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<MSEComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCodeIfSmalltalk ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfMessageSends [
	<MSEProperty: #numberOfMessageSends type: #Number>
	<derived>
	<MSEComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ 
			| parser |
			parser := RBVisitorForFAMIXMetrics new.
			parser processMethod: self usingImporter: nil inModel: nil.
			parser numberOfMessageSends ]
				
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfOutgoingInvocations [
	<MSEProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<MSEComment: 'The number of invocations in a method'>
	
	^self
		lookUpPropertyNamed: #numberOfOutgoingInvocations
		computedAs: [self outgoingInvocations size]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfStatements [
	<MSEProperty: #numberOfStatements type: #Number>
	<MSEComment: 'The number of statements in a method'>
	^ self
		lookUpPropertyNamed: #numberOfStatements
		computedAs: [
			| parser |
			parser := RBVisitorForFAMIXMetrics new.
			parser processMethod: self usingImporter: nil inModel: nil.
			parser numberOfStatements ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfStatements: aNumber [

	self privateState propertyAt: #numberOfStatements put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> packageScope [

	^ self parentPackage ifNil:[ 
		|cl|
		cl := self parentType.
		cl isNil 
			ifTrue:[nil]
			ifFalse:[cl packageScope]
	]
]

{ #category : #accessing }
FamixStMethod >> protocol [

	<MSEProperty: #protocol type: #String>
	<generated>
	<MSEComment: 'Protocol of the method'>
	^ protocol
]

{ #category : #accessing }
FamixStMethod >> protocol: anObject [

	<generated>
	protocol := anObject

]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> smalltalkClass [ 
	"Return the smalltalk class associated with the receiver. Note that it may be different than doing self parentType because the class and metaclass can be merged."
	
	^   ('*_class' match: self parentType name)
			ifTrue: [self parentType smalltalkClass]
			ifFalse: [self isClassSide 
							ifTrue: [self parentType smalltalkClass class]
							ifFalse: [self parentType smalltalkClass]]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ self class shouldSearchForSmalltalkCodeInImage
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

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> timeStamp [
	<MSEProperty: #timeStamp type: #String>
	<MSEComment: 'TimeStamp of the method with author and time of the last change'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #timeStamp ifAbsentPut: ['']
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> timeStamp: aTimeStamp [

	self privateState attributeAt: #timeStamp put: aTimeStamp
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> typeScope [

	^ self parentType 
]
