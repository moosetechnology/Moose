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
	#superclass : #RBVisitorForFAMIX,
	#instVars : [
		'methodComplexity',
		'numberOfMessageSends',
		'numberOfStatements',
		'numberOfLinesOfCode',
		'parameterComplexityMultiplier',
		'numberOfConditionals',
		'cyclomaticNumber',
		'booleanOperators',
		'cyclomaticNumber2'
	],
	#category : #'Famix-Smalltalk-Utils'
}

{ #category : #'private-accessing' }
RBVisitorForFAMIXMetrics >> classNameFromMethod [
	"this is a hack but it's working - doru :)"

	"cls :=  self methodEntity belongsTo.
	^ cls isInstanceSide
		ifTrue: [self methodEntity belongsTo name]
		ifFalse: [self methodEntity belongsTo name , ' class']."

	^  self methodEntity belongsTo name.
	
		
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
	(branches includes: sel)
		ifTrue: [cyclomaticNumber2 := cyclomaticNumber2 + 1].
	(loops includes: sel) ifTrue: [cyclomaticNumber2 := cyclomaticNumber2 + 1].	"-- HERE STARTS THE OLD ERRORFUL IMPL --"
	(#(#or: #and: #xor: #& #|) includes: sel)
		ifTrue:
			[booleanOperators := booleanOperators + 1.
			^self].
	(#(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #whileTrue #whileTrue: #whileFalse #whileFalse:)
		includes: sel)
		ifTrue:
			[| cyclo |
			cyclo := self cyclomaticNumber + 1 + booleanOperators.
			self cyclomaticNumber: cyclo.
			booleanOperators := 0].
	(#(#to:do: #timesRepeat:) includes: sel)
		ifTrue: [self cyclomaticNumber: self cyclomaticNumber + 1]
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

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> cyclomaticNumber2 [
	
	^cyclomaticNumber2
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> cyclomaticNumber: anObject [
	
	cyclomaticNumber := anObject
]

{ #category : #'initialize-release' }
RBVisitorForFAMIXMetrics >> initialize [
	
	super initialize.
	self resetMetricValues
]

{ #category : #'source access' }
RBVisitorForFAMIXMetrics >> methodBodyOn: aReadStream [
	
	numberOfLinesOfCode := aReadStream contents occurrencesOf: Character cr.
	aReadStream contents last = Character cr
		ifFalse: [numberOfLinesOfCode := numberOfLinesOfCode + 1].	"the last line ay not contain a final cr"	"-- take care: some platforms use line-feeds instead of cr--"
	numberOfLinesOfCode == 1
		ifTrue:
			[| aux |
			aux := aReadStream contents occurrencesOf: Character lf.
			aReadStream contents last = Character cr
				ifFalse: [numberOfLinesOfCode := numberOfLinesOfCode + 1].
			numberOfLinesOfCode := numberOfLinesOfCode max: aux]
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> methodComplexity [
	
	^methodComplexity
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> methodComplexity: anObject [
	
	methodComplexity := anObject
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

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> parameterComplexityMultiplier [
	
	^parameterComplexityMultiplier
]

{ #category : #accessing }
RBVisitorForFAMIXMetrics >> parameterComplexityMultiplier: anObject [
	
	parameterComplexityMultiplier := anObject
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> processMethod: aMethodEntity usingImporter: anImporter inModel: anObject [
	| parseTree |
	self targetModel: anObject.
	self importer: anImporter.
	self methodEntity: aMethodEntity.
	self compiledMethod ifNil: [ ^ self ].
	parseTree := self compiledMethod methodClass parseTreeFor: self compiledMethod selector.
	parseTree
		ifNotNil: [ "parseTreeOrNil := self stParseTree.
	parseTreeOrNil isNil ifFalse: [self visitNode: parseTreeOrNil]" self visitMethodNode: parseTree ]
]

{ #category : #'initialize-release' }
RBVisitorForFAMIXMetrics >> resetMetricValues [
	
	self numberOfMessageSends: 0.
	self numberOfStatements: 0.
	self methodComplexity: 0.
	self parameterComplexityMultiplier: 0.
	self numberOfConditionals: 0.
	self cyclomaticNumber: 1.
	booleanOperators := 0.
	cyclomaticNumber2 := 1
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitArgument: each [
	
	methodComplexity := methodComplexity + parameterComplexityMultiplier.
	^super visitArgument: each
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitAssignmentNode: anAssignmentNode [ 
	
	super visitAssignmentNode: anAssignmentNode.
	methodComplexity := methodComplexity + 0.5
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitBlockNode: aBlockNode [ 
	
	super visitBlockNode: aBlockNode.
	numberOfStatements := numberOfStatements + aBlockNode body size.
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitCascadeNode: aCascadeNode [ 
	
	numberOfStatements := numberOfStatements + aCascadeNode messages size.
	^super visitCascadeNode: aCascadeNode 
]

{ #category : #enumerating }
RBVisitorForFAMIXMetrics >> visitMessageNode: aMessageNode [ 
	
	| rcvr sel args |
	rcvr := aMessageNode receiver.
	sel := aMessageNode selector.
	args := aMessageNode arguments.
	super visitMessageNode: aMessageNode.
	numberOfMessageSends := numberOfMessageSends + 1.
	self countConditionals: sel.
	self computeCyclomaticNumber: sel.	"sel = #printOn: 
		ifTrue: [self halt]."	"duplicated in VisualWorksAnnotator because we ay want to run them separately"
	(self isSuperInMethod: sel withReceiver: rcvr)
		ifTrue: [self methodEntity propertyNamed: #cleanSuperSend put: true].
	(self isDirtySuperInMethod: sel withReceiver: rcvr)
		ifTrue: [self methodEntity propertyNamed: #dirtySuperSend put: true].
	methodComplexity := sel isInfix
		ifTrue: [methodComplexity + 2]
		ifFalse:
			[sel numArgs > 1
				ifTrue: [methodComplexity + 3]
				ifFalse: [methodComplexity + 1]]	"(self isAPICall: sel) ifTrue: [
			methodComplexity + 5] ifFalse: [
		(self isPrimitiveCall: sel) ifTrue: [
			methodComplexity + 7] ifFalse: ["
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
	numberOfStatements := numberOfStatements + aSequenceNode statements size.
	self methodComplexity: self methodComplexity + (0.5 * aSequenceNode temporaries size)
]
