"
VisualWorksParseTreeMetricCalculator is a visitor computing AST based metrics. It also computes LOC. 
Right now only Number of MessageSends is computed in a correct manner.

Instance Variables:
	extendsSuper	<Boolean>	description of extendsSuper
	methodComplexity	<ArithmeticValue | CPointer>	description of methodComplexity
	numberOfLinesOfCode	<Magnitude | WindowSpec>	description of numberOfLinesOfCode
	numberOfMessageSends	<ArithmeticValue | CPointer>	description of numberOfMessageSends
	numberOfStatements	<ArithmeticValue | CPointer>	description of numberOfStatements
	parameterComplexityMultiplier	<Object>	description of parameterComplexityMultiplier


"
Class {
	#name : #RBVisitorForFAMIXMetrics,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'numberOfMessageSends',
		'numberOfStatements',
		'numberOfLinesOfCode',
		'numberOfConditionals',
		'booleanOperators',
		'importer',
		'methodEntity',
		'cyclomaticNumber'
	],
	#category : #'Famix-Smalltalk-Utils'
}

{ #category : #'instance creation' }
RBVisitorForFAMIXMetrics class >> for: aMethod [
	^ self new
		processMethod: aMethod;
		yourself
]

{ #category : #'private-accessing' }
RBVisitorForFAMIXMetrics >> classNameFromMethod [
	^ self methodEntity parentType name
]

{ #category : #'private-accessing' }
RBVisitorForFAMIXMetrics >> compiledMethod [
	| realSTClass stClass |
	stClass := FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: self classNameFromMethod ifAbsent: [ nil ].
	realSTClass := (self methodEntity isClassSide and: [ stClass class ~= TraitedMetaclass ]) ifTrue: [ stClass class ] ifFalse: [ stClass ].
	^ realSTClass compiledMethodAt: self methodEntity name ifAbsent: [  ]
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> computeCyclomaticNumber: sel [
	"The following equations defined McCabe Cyclomatic Complexity:

	     1.The number of regions in a flow graph. 
     		2.V(G) = E - N + 2, where E are the edges and N are the nodes. 
     		3.V(G) = P + 1, where P are the predicate nodes. 

	The score is basically the number of decision points in a routine + 1. Decision points 
	are taken to be	conditionals and loops."

	| branches loops |
	branches := #(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #ifNil: #ifNil:ifNotNil: #ifNotNil:ifNil: #ifNotNil: #at:ifAbsent: #at:ifAbsentPut: #detect:ifNone: #on:do: #and: #or: #xor:).
	loops := #(#whileTrue: #whileTrue #whileFalse #whileFalse: #timesRepeat: #to:do: #do:separatedBy: #do: #collect: #select: #reject: #inject:into: #detect: #detect:ifNone: #anySatisfy: #allSatisfy: #piecesCutWhere:).	"-- please not that #detect:ifNone: is listed twice because it is both loop and branch!!! -- akuhn"
	(branches includes: sel) ifTrue: [ cyclomaticNumber := cyclomaticNumber + 1 ].
	(loops includes: sel) ifTrue: [ cyclomaticNumber := cyclomaticNumber + 1 ].
	"-- HERE STARTS THE OLD ERRORFUL IMPL --"
	(#(#or: #and: #xor: #& #|) includes: sel)
		ifTrue: [ booleanOperators := booleanOperators + 1.
			^ self ].
	(#(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #whileTrue #whileTrue: #whileFalse #whileFalse:) includes: sel) ifTrue: [ booleanOperators := 0 ]
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> countConditionals: sel [
	
	(#(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #whileTrue #whileTrue: #whileFalse #whileFalse:)
		includes: sel)
		ifTrue: [self numberOfConditionals: self numberOfConditionals + 1]
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> cyclomaticNumber [
	
	^cyclomaticNumber
]

{ #category : #initialization }
RBVisitorForFAMIXMetrics >> initialize [
	
	super initialize.
	self resetMetricValues
]

{ #category : #private }
RBVisitorForFAMIXMetrics >> isDirtySuperInMethod: selector withReceiver: receiver [
	^ selector ~~ self methodEntity name and: [ receiver isSuper ]
]

{ #category : #private }
RBVisitorForFAMIXMetrics >> isSuperInMethod: selector withReceiver: receiver [
	^ selector == self methodEntity name and: [ receiver isSuper ]
]

{ #category : #'source access' }
RBVisitorForFAMIXMetrics >> methodBodyOn: aReadStream [
	| aux |
	numberOfLinesOfCode := aReadStream contents occurrencesOf: Character cr.
	aReadStream contents last = Character cr ifFalse: [ numberOfLinesOfCode := numberOfLinesOfCode + 1 ].
	numberOfLinesOfCode = 1 ifFalse: [ ^ self ].
	aux := aReadStream contents occurrencesOf: Character lf.
	aReadStream contents last = Character cr ifFalse: [ numberOfLinesOfCode := numberOfLinesOfCode + 1 ].
	numberOfLinesOfCode := numberOfLinesOfCode max: aux
]

{ #category : #'private-accessing' }
RBVisitorForFAMIXMetrics >> methodEntity [
	^ methodEntity
]

{ #category : #'private-accessing' }
RBVisitorForFAMIXMetrics >> methodEntity: aMethodEntity [
	methodEntity := aMethodEntity
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfConditionals [
	
	^numberOfConditionals
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfConditionals: anObject [
	
	numberOfConditionals := anObject
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfLinesOfCode [
	
	^numberOfLinesOfCode
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfLinesOfCode: anObject [
	
	numberOfLinesOfCode := anObject
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfMessageSends [
	
	^numberOfMessageSends
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfMessageSends: anObject [
	
	numberOfMessageSends := anObject
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfStatements [
	
	^numberOfStatements
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> numberOfStatements: anObject [
	
	numberOfStatements := anObject
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> processMethod: aMethodEntity [
	self methodEntity: aMethodEntity.
	self compiledMethod ifNil: [ ^ self ].
	(self compiledMethod methodClass parseTreeFor: self compiledMethod selector) ifNotNil: [ :parseTree | self visitMethodNode: parseTree ]
]

{ #category : #initialization }
RBVisitorForFAMIXMetrics >> resetMetricValues [
	numberOfMessageSends := 0.
	numberOfStatements := 0.
	numberOfConditionals := 0.
	booleanOperators := 0.
	cyclomaticNumber := 1
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitBlockNode: aBlockNode [
	super visitBlockNode: aBlockNode.
	numberOfStatements := numberOfStatements + aBlockNode body size
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitCascadeNode: aCascadeNode [
	numberOfStatements := numberOfStatements + aCascadeNode messages size.
	^ super visitCascadeNode: aCascadeNode
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitMessageNode: aMessageNode [
	| receiver selector |
	receiver := aMessageNode receiver.
	selector := aMessageNode selector.
	super visitMessageNode: aMessageNode.
	numberOfMessageSends := numberOfMessageSends + 1.
	self countConditionals: selector.
	self computeCyclomaticNumber: selector.
	(self isSuperInMethod: selector withReceiver: receiver) ifTrue: [ self methodEntity propertyNamed: #cleanSuperSend put: true ].
	(self isDirtySuperInMethod: selector withReceiver: receiver) ifTrue: [ self methodEntity propertyNamed: #dirtySuperSend put: true ]
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitMethodNode: aMethodNode [
	
	" I do not know where this block came from"
	"methodComplexity := methodComplexity + (0.3 * block arguments size)."

	self methodBodyOn: aMethodNode source readStream.
	^ super visitMethodNode: aMethodNode
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitSequenceNode: aSequenceNode [
	super visitSequenceNode: aSequenceNode.
	numberOfStatements := numberOfStatements + aSequenceNode statements size
]
