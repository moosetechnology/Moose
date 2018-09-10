"
Enhances the Smalltalk grammar with production actions to build parse-tree nodes of the refactoring browser.
"
Class {
	#name : #PPSmalltalkParser,
	#superclass : #PPSmalltalkGrammar,
	#category : #'PetitSmalltalk-Core'
}

{ #category : #private }
PPSmalltalkParser >> addStatements: aCollection into: aNode [
	aCollection isNil 
		ifTrue: [ ^ aNode ].
	aCollection do: [ :each |
		each class == PPSmalltalkToken
			ifFalse: [ aNode addNode:  each ]
			ifTrue: [
				aNode statements isEmpty
					ifTrue: [ aNode addComments: each comments ]
					ifFalse: [ aNode statements last addComments: each comments ].
				aNode periods: (aNode periods asOrderedCollection
					addLast: each start;
					yourself) ] ].
	^ aNode
]

{ #category : #grammar }
PPSmalltalkParser >> array [
	^ super array map: [ :openNode :statementNodes :closeNode |
		(self buildArray: statementNodes)
			left: openNode start;
			right: closeNode start;
			yourself ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> arrayLiteral [
	^ super arrayLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> arrayLiteralArray [
	^ super arrayLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]
]

{ #category : #'grammar-messages' }
PPSmalltalkParser >> binaryExpression [
	^ super binaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]
]

{ #category : #token }
PPSmalltalkParser >> binaryToken [
	^ super binaryToken
		==> [ :token | 
			(RBBinarySelectorToken value: token inputValue start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-blocks' }
PPSmalltalkParser >> block [
	^ super block map: [ :leftToken :blockNode :rightToken | blockNode left: leftToken start; right: rightToken start ]
]

{ #category : #'grammar-blocks' }
PPSmalltalkParser >> blockArgument [
	^ super blockArgument ==> #second
]

{ #category : #'grammar-blocks' }
PPSmalltalkParser >> blockBody [
	^ super blockBody
		==> [ :nodes | 
			| result |
			result := RBBlockNode arguments: nodes first first body: nodes last.
			nodes first last ifNotNil: [ result bar: nodes first last start ].
			result ]
]

{ #category : #private }
PPSmalltalkParser >> build: aNode assignment: anArray [
	^ anArray isEmpty
		ifTrue: [ aNode ]
		ifFalse: [
			anArray reverse 
				inject: aNode
				into: [ :result :each |
					RBAssignmentNode 
						variable: each first
						value: result
						position: each second start ] ]
]

{ #category : #private }
PPSmalltalkParser >> build: aNode cascade: anArray [ 
	| messages semicolons |
	^ (anArray isNil or: [ anArray isEmpty ]) 
		ifTrue: [ aNode ]
		ifFalse: [
			messages := OrderedCollection new: anArray size + 1.
			messages addLast: aNode.
			semicolons := OrderedCollection new.
			anArray do: [ :each | 
				messages addLast: (self 
					build: aNode receiver
					messages: (Array with: each second)).
				semicolons addLast: each first start ].
			RBCascadeNode messages: messages semicolons: semicolons ]
]

{ #category : #private }
PPSmalltalkParser >> build: aNode messages: anArray [
	^ (anArray isNil or: [ anArray isEmpty ])
		ifTrue: [ aNode ]
		ifFalse: [ 
			anArray
				inject: aNode
				into: [ :rec :msg | 
					msg isNil
						ifTrue: [ rec ]
						ifFalse: [ 
							RBMessageNode
								receiver: rec
								selector: (self buildSelector: msg first)
								keywordsPositions: (msg first collect: [ :each | each start ])
								arguments: msg second ] ] ]
]

{ #category : #private }
PPSmalltalkParser >> build: aTempCollection sequence: aStatementCollection [
	| result |
	result := self
		addStatements: aStatementCollection
		into: RBSequenceNode new.
	aTempCollection isEmpty ifFalse: [
		result
			leftBar: aTempCollection first start
			temporaries: aTempCollection second
			rightBar: aTempCollection last start ].
	^ result
]

{ #category : #private }
PPSmalltalkParser >> buildArray: aStatementCollection [
	^ self addStatements: aStatementCollection into: RBArrayNode new
]

{ #category : #private }
PPSmalltalkParser >> buildMethod: aMethodNode [
	self flag: 'check this one thoroughly as it is unclear if the changes preserve 
	the original behavior from before the AST refactoring '.
"	aMethodNode selectorParts 
		do: [ :each | aMethodNode addComments: each comments ].
"	aMethodNode arguments
		do: [ :each | aMethodNode addComments: each comments ].
	aMethodNode pragmas do: [ :aPragma |
		aMethodNode addComments: aPragma comments.
		aMethodNode addComments: aPragma comments.
		aPragma arguments do: [ :each | 
			each isLiteralArray
				ifFalse: [ aMethodNode addComments: each comments ] ].
		aPragma comments: #() ].
	^ aMethodNode
]

{ #category : #private }
PPSmalltalkParser >> buildSelector: anArray [
	^ (String streamContents: [ :stream | anArray do: [ :each | stream nextPutAll: each value ] ]) asSymbol
]

{ #category : #private }
PPSmalltalkParser >> buildString: aString [ 
	(aString isEmpty or: [ aString first ~= $' or: [ aString last ~= $' ] ])
		ifTrue: [ ^ aString ].
	^ (aString 
		copyFrom: 2
		to: aString size - 1) 
		copyReplaceAll: ''''''
		with: ''''
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> byteLiteral [
	^ super byteLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> byteLiteralArray [
	^ super byteLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]
]

{ #category : #'grammar-messages' }
PPSmalltalkParser >> cascadeExpression [
	^ super cascadeExpression map: [ :receiverNode :messageNodes | self build: receiverNode cascade: messageNodes ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> charLiteral [
	^ super charLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: token inputValue second 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PPSmalltalkParser >> expression [
	^ super expression map: [ :variableNodes :expressionNodes | self build: expressionNodes assignment: variableNodes ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> falseLiteral [
	^ super falseLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: false 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #token }
PPSmalltalkParser >> identifierToken [
	^ super identifierToken
		==> [ :token | 
			(RBIdentifierToken value: token inputValue start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-messages' }
PPSmalltalkParser >> keywordExpression [
	^ super keywordExpression map: [ :receiveNode :messageNode | self build: receiveNode messages: (Array with: messageNode) ]
]

{ #category : #token }
PPSmalltalkParser >> keywordToken [
	^ super keywordToken
		==> [ :token | 
			(RBKeywordToken value: token inputValue start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PPSmalltalkParser >> method [
	^ super method map: [ :methodNode :bodyNode | 
		methodNode pragmas: bodyNode first.
		methodNode body: bodyNode second.
		self buildMethod: methodNode ]
]

{ #category : #grammar }
PPSmalltalkParser >> methodDeclaration [
	^ super methodDeclaration
		==> [ :nodes | 
			RBMethodNode
				selector: (self buildSelector: nodes first)
				keywordsPositions: (nodes first collect: [ :each | each start ])
				arguments: nodes second ]
]

{ #category : #grammar }
PPSmalltalkParser >> methodSequence [
	^ super methodSequence map: [ :periodNodes1 :pragmaNodes1 :periodNodes2 :tempNodes :periodNodes3 :pragmaNodes2 :periodNodes4 :statementNodes |
		Array
			with: pragmaNodes1 , pragmaNodes2
			with: (self build: tempNodes sequence: periodNodes1 , periodNodes2 , periodNodes3 , periodNodes4 , statementNodes) ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> nilLiteral [
	^ super nilLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: nil 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> numberLiteral [
	^ super numberLiteral
		==> [ :token | 
			(RBLiteralValueNode
				value: (Number readFrom: token inputValue)
				start: token start
				stop: token stop
				source: token inputValue)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PPSmalltalkParser >> parens [
	^ super parens map: [ :openToken :expressionNode :closeToken | expressionNode addParenthesis: (openToken start to: closeToken start) ]
]

{ #category : #grammar }
PPSmalltalkParser >> pragma [
	^ super pragma
		==> [ :nodes | 
			(RBPragmaNode
				selector: (self buildSelector: nodes second first)
				keywordsPositions: (nodes second first collect: [ :each | each start ])
				arguments: nodes second second)
				addComments: nodes first comments;
				addComments: nodes last comments;
				left: nodes first start;
				right: nodes last start;
				yourself ]
]

{ #category : #grammar }
PPSmalltalkParser >> return [
	^ super return map: [ :token :expressionNode | RBReturnNode return: token start value: expressionNode ]
]

{ #category : #grammar }
PPSmalltalkParser >> sequence [
	^ super sequence map: [ :tempNodes :periodNodes :statementNodes | self build: tempNodes sequence: periodNodes , statementNodes ]
]

{ #category : #accessing }
PPSmalltalkParser >> startExpression [
	"Make the sequence node has a method node as its parent and that the source is set."

	^ ([ :stream | stream collection ] asParser and , super startExpression) map: [ :source :node | 
		(RBMethodNode selector: #doIt body: node)
			source: source.
		(node statements size = 1 and: [ node temporaries isEmpty ])
			ifTrue: [ node statements first ]
			ifFalse: [ node ] ]
]

{ #category : #accessing }
PPSmalltalkParser >> startMethod [
	"Make sure the method node has the source code properly set."
	
	^ ([ :stream | stream collection ] asParser and , super startMethod)
		map: [ :source :node | node source: source ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> stringLiteral [
	^ super stringLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: (self buildString: token inputValue) 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> symbolLiteral [
	^ super symbolLiteral
		==> [ :tokens | 
			(RBLiteralValueNode
				value: (self buildString: tokens last inputValue) asSymbol
				start: tokens first start
				stop: tokens last stop)
				comments: tokens last comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> symbolLiteralArray [
	^ super symbolLiteralArray
		==> [ :token | 
			(RBLiteralValueNode 
				value: (self buildString: token inputValue) asSymbol 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PPSmalltalkParser >> trueLiteral [
	^ super trueLiteral
		==> [ :token | 
			(RBLiteralValueNode value: true start: token start stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-messages' }
PPSmalltalkParser >> unaryExpression [
	^ super unaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]
]

{ #category : #token }
PPSmalltalkParser >> unaryToken [
	^ super unaryToken
		==> [ :token | 
			(RBIdentifierToken value: token inputValue start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PPSmalltalkParser >> variable [
	^ super variable ==> [ :token | RBVariableNode identifierNamed: token value  at: token start ]
]
