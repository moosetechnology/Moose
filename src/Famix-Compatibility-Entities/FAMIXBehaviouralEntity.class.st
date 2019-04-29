Class {
	#name : #FAMIXBehaviouralEntity,
	#superclass : #FAMIXContainerEntity,
	#traits : 'FamixTInvocable + FamixTTypedStructure + FamixTWithAccesses + FamixTWithDereferencedInvocations + FamixTWithImplicitVariables + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FamixTWithSignature + FamixTWithStatements',
	#classTraits : 'FamixTInvocable classTrait + FamixTTypedStructure classTrait + FamixTWithAccesses classTrait + FamixTWithDereferencedInvocations classTrait + FamixTWithImplicitVariables classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FamixTWithSignature classTrait + FamixTWithStatements classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXBehaviouralEntity class >> annotation [

	<MSEClass: #BehaviouralEntity super: #FAMIXContainerEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXBehaviouralEntity class >> generatedSlotNames [
	<generated>
	'FAMIXBehaviouralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXBehaviouralEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocable FamixTTypedStructure FamixTWithAccesses FamixTWithDereferencedInvocations FamixTWithImplicitVariables FamixTWithInvocations FamixTWithLocalVariables FamixTWithParameters FamixTWithReferences FamixTWithSignature FamixTWithStatements)
]

{ #category : #meta }
FAMIXBehaviouralEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> accept: aVisitor [

	aVisitor visitBehaviouralEntity: self
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> clientBehaviours [
	<MSEProperty: #clientBehaviours type: #FAMIXBehaviouralEntity> <multivalued> <derived>
	<MSEComment: 'All behaviours that depend on the receiver'>
	^ self invokingBehaviours 
]

{ #category : #'Famix-Extensions-private' }
FAMIXBehaviouralEntity >> computeNumberOfLinesOfCode [
	self hasSourceAnchor 
		ifTrue: [ ^ self sourceAnchor lineCount ].
	^ (self sourceText = '')
			ifTrue: [ self notExistentMetricValue ]
			ifFalse: [ self sourceText lineCount ]
]

{ #category : #'Famix-Extensions-private' }
FAMIXBehaviouralEntity >> computeNumberOfLinesOfCodeIfSmalltalk [
	| parser |
	
	parser := RBVisitorForFAMIXMetrics new.
	parser processMethod: self usingImporter: nil inModel: nil.
	^ parser numberOfLinesOfCode
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self signature: anEntity signature copy.
	self declaredType: (aVisitor visit: anEntity declaredType).
	
	anEntity localVariables do: [ :var | 
		self addLocalVariable: (aVisitor visit: var) ].
	anEntity parameters do: [ :par | 
		self addParameter: (aVisitor visit: par) ].
	anEntity outgoingInvocations do: [ :inv | 
		aVisitor visit: inv ].
	anEntity accesses do: [ :acc | 
		aVisitor visit: acc ].
	anEntity outgoingReferences do: [:r|
		aVisitor visit: r ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> cyclomaticComplexity [
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

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> cyclomaticComplexity: aNumber [

	self privateState propertyAt: #cyclomaticComplexity put: aNumber
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXBehaviouralEntity >> entityHasOutgoingTypeDeclarations [
	^ self declaredType isNotNil
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> hasEmptyBody [
	"Copied from FAMIX2.
	 The closest we can get in FAMIX2 to determine if a body is empty is to check if the method
	 performs no invocations and/or accesses. The only thing left to do would be the declaration
	 of local variables (that are not accesses afterwards).

	Note that an abstract method with only 'self subclassResponsibility' is not regarded as an 
	empty method in this scheme (which is questionable)."
	"note that the presence of statements should be checked too for that..."
	^ self numberOfAccesses = 0 and: [ self numberOfOutgoingInvocations = 0 ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> invokingBehaviours [
	^ self queryAllIncomingInvocations opposites
]

{ #category : #'Famix-Implementation' }
FAMIXBehaviouralEntity >> isBehaviouralEntity [
	^ true
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfComments [
	<MSEProperty: #numberOfComments type: #Number>
	<MSEComment: 'The number of comment fragments'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfComments: aNumber [

	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfConditionals [
	<MSEProperty: #numberOfConditionals type: #Number>
	<MSEComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ 
			self mooseModel isSmalltalk
				ifTrue: [ 
					| parser |
					parser := RBVisitorForFAMIXMetrics new.
					parser processMethod: self usingImporter: nil inModel: nil.
					parser numberOfConditionals ]
				ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfConditionals: aNumber [

	self privateState propertyAt: #numberOfConditionals put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<MSEComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfMessageSends [
	<MSEProperty: #numberOfMessageSends type: #Number>
	<derived>
	<MSEComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ 
			self mooseModel isSmalltalk
				ifTrue: [ 
					| parser |
					parser := RBVisitorForFAMIXMetrics new.
					parser processMethod: self usingImporter: nil inModel: nil.
					parser numberOfMessageSends ]
				ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfOutgoingInvocations [
	<MSEProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<MSEComment: 'The number of invocations in a method'>
	
	^self
		lookUpPropertyNamed: #numberOfOutgoingInvocations
		computedAs: [self outgoingInvocations size]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> numberOfStatements [
	<MSEProperty: #numberOfStatements type: #Number>
	<MSEComment: 'The number of statements in a method'>
	^ self
		lookUpPropertyNamed: #numberOfStatements
		computedAs: [ self mooseModel isSmalltalk
				ifTrue: [ | parser |
					parser := RBVisitorForFAMIXMetrics new.
					parser processMethod: self usingImporter: nil inModel: nil.
					parser numberOfStatements ]
				ifFalse: [ self notExistentMetricValue ] ]
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXBehaviouralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'Famix-Extensions' }
FAMIXBehaviouralEntity >> providerBehaviours [
	<MSEProperty: #providerBehaviours type: #FAMIXBehaviouralEntity> <derived> <multivalued>
	<MSEComment: 'All behaviours that the receiver depends on'>

	^ self invokedBehaviours 
]
