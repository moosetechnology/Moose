"
A parser for Smalltalk methods and expressions.
"
Class {
	#name : #PPSmalltalkGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'array',
		'arrayItem',
		'arrayLiteral',
		'arrayLiteralArray',
		'assignment',
		'assignmentToken',
		'binary',
		'binaryExpression',
		'binaryMessage',
		'binaryMethod',
		'binaryPragma',
		'binaryToken',
		'block',
		'blockArgument',
		'blockArguments',
		'blockArgumentsWith',
		'blockArgumentsWithout',
		'blockBody',
		'byteLiteral',
		'byteLiteralArray',
		'cascadeExpression',
		'cascadeMessage',
		'char',
		'charLiteral',
		'charToken',
		'expression',
		'falseLiteral',
		'falseToken',
		'identifier',
		'identifierToken',
		'keyword',
		'keywordExpression',
		'keywordMessage',
		'keywordMethod',
		'keywordPragma',
		'keywordToken',
		'literal',
		'message',
		'method',
		'methodDeclaration',
		'methodSequence',
		'multiword',
		'nilLiteral',
		'nilToken',
		'number',
		'numberLiteral',
		'numberToken',
		'parens',
		'period',
		'periodToken',
		'pragma',
		'pragmaMessage',
		'pragmas',
		'primary',
		'return',
		'sequence',
		'startExpression',
		'startMethod',
		'statements',
		'string',
		'stringLiteral',
		'stringToken',
		'symbol',
		'symbolLiteral',
		'symbolLiteralArray',
		'temporaries',
		'trueLiteral',
		'trueToken',
		'unary',
		'unaryExpression',
		'unaryMessage',
		'unaryMethod',
		'unaryPragma',
		'unaryToken',
		'variable'
	],
	#category : #'PetitSmalltalk-Core'
}

{ #category : #testing }
PPSmalltalkGrammar class >> allowUnderscoreAssignment [
	^ (Scanner respondsTo: #allowUnderscoreAsAssignment) and: [ Scanner allowUnderscoreAsAssignment ]
]

{ #category : #accessing }
PPSmalltalkGrammar class >> parseExpression: aString [
	^ self new parseExpression: aString
]

{ #category : #accessing }
PPSmalltalkGrammar class >> parseExpression: aString onError: aBlock [
	^ self new parseExpression: aString onError: aBlock
]

{ #category : #accessing }
PPSmalltalkGrammar class >> parseMethod: aString [
	^ self new parseMethod: aString
]

{ #category : #accessing }
PPSmalltalkGrammar class >> parseMethod: aString onError: aBlock [
	^ self new parseMethod: aString onError: aBlock
]

{ #category : #grammar }
PPSmalltalkGrammar >> array [
	^ ${ asParser smalltalkToken , (expression delimitedBy: periodToken) optional , $} asParser smalltalkToken
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> arrayItem [
	^ literal / symbolLiteralArray / arrayLiteralArray / byteLiteralArray
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> arrayLiteral [
	^ '#(' asParser smalltalkToken , arrayItem star , $) asParser smalltalkToken
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> arrayLiteralArray [
	^ $( asParser smalltalkToken , arrayItem star , $) asParser smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> assignment [
	^ variable , assignmentToken
]

{ #category : #token }
PPSmalltalkGrammar >> assignmentToken [
	^ self class allowUnderscoreAssignment
		ifTrue: [ (':=' asParser / '_' asParser) smalltalkToken ]
		ifFalse: [ ':=' asParser smalltalkToken ]
]

{ #category : #primitives }
PPSmalltalkGrammar >> binary [
	^ (PPPredicateObjectParser anyOf: '!%&*+,-/<=>?@\|~') plus
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> binaryExpression [
	^ unaryExpression , binaryMessage star
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> binaryMessage [
	^ (binaryToken , unaryExpression) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #'grammar-methods' }
PPSmalltalkGrammar >> binaryMethod [
	^ (binaryToken , variable) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #'grammar-pragmas' }
PPSmalltalkGrammar >> binaryPragma [
	^ (binaryToken , arrayItem) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #token }
PPSmalltalkGrammar >> binaryToken [
	^ binary smalltalkToken
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> block [
	^ $[ asParser smalltalkToken , blockBody , $] asParser smalltalkToken
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> blockArgument [
	^ $: asParser smalltalkToken , variable
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> blockArguments [
	^ blockArgumentsWith / blockArgumentsWithout
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> blockArgumentsWith [
	^ blockArgument plus , ($| asParser smalltalkToken / ($] asParser smalltalkToken and ==> [ :node | nil ]))
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> blockArgumentsWithout [
	^ nil asParser ==> [ :nodes | Array with: #() with: nil ]
]

{ #category : #'grammar-blocks' }
PPSmalltalkGrammar >> blockBody [
	^ blockArguments , sequence
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> byteLiteral [
	^ '#[' asParser smalltalkToken , numberLiteral star , $] asParser smalltalkToken
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> byteLiteralArray [
	^ $[ asParser smalltalkToken , numberLiteral star , $] asParser smalltalkToken
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> cascadeExpression [
	^ keywordExpression , cascadeMessage star
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> cascadeMessage [
	^ $; asParser smalltalkToken , message
]

{ #category : #primitives }
PPSmalltalkGrammar >> char [
	^ $$ asParser , #any asParser
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> charLiteral [
	^ charToken
]

{ #category : #token }
PPSmalltalkGrammar >> charToken [
	^ char smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> expression [
	^ assignment star , cascadeExpression
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> falseLiteral [
	^ falseToken
]

{ #category : #token }
PPSmalltalkGrammar >> falseToken [
	^ ('false' asParser , #word asParser not) smalltalkToken
]

{ #category : #primitives }
PPSmalltalkGrammar >> identifier [
	^ self class allowUnderscoreAssignment
		ifTrue: [ #letter asParser , #word asParser star ]
		ifFalse: [
			(PPPredicateObjectParser
				on: [ :each | each isLetter or: [ each = $_ ] ]
				message: 'letter expected') ,
			(PPPredicateObjectParser
				on: [ :each | each isAlphaNumeric or: [ each = $_ ] ]
				message: 'letter or digit expected') star ]
]

{ #category : #token }
PPSmalltalkGrammar >> identifierToken [
	^ identifier smalltalkToken
]

{ #category : #primitives }
PPSmalltalkGrammar >> keyword [
	^ identifier , $: asParser
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> keywordExpression [
	^ binaryExpression , keywordMessage optional
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> keywordMessage [
	^ (keywordToken , binaryExpression) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #'grammar-methods' }
PPSmalltalkGrammar >> keywordMethod [
	^ (keywordToken , variable) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #'grammar-pragmas' }
PPSmalltalkGrammar >> keywordPragma [
	^ (keywordToken , arrayItem) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #token }
PPSmalltalkGrammar >> keywordToken [
	^ keyword smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> literal [
	^ numberLiteral / stringLiteral / charLiteral / arrayLiteral / byteLiteral / symbolLiteral / nilLiteral / trueLiteral / falseLiteral
]

{ #category : #grammar }
PPSmalltalkGrammar >> message [
	^ keywordMessage / binaryMessage / unaryMessage
]

{ #category : #grammar }
PPSmalltalkGrammar >> method [
	^ methodDeclaration , methodSequence
]

{ #category : #grammar }
PPSmalltalkGrammar >> methodDeclaration [
	^ keywordMethod / unaryMethod / binaryMethod
]

{ #category : #grammar }
PPSmalltalkGrammar >> methodSequence [
	^ periodToken star , pragmas , periodToken star , temporaries , periodToken star , pragmas , periodToken star , statements
]

{ #category : #primitives }
PPSmalltalkGrammar >> multiword [
	^ keyword plus
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> nilLiteral [
	^ nilToken
]

{ #category : #token }
PPSmalltalkGrammar >> nilToken [
	^ ('nil' asParser , #word asParser not) smalltalkToken
]

{ #category : #primitives }
PPSmalltalkGrammar >> number [
	^ ($- asParser optional , #digit asParser) and , [ :context | 
		[ (NumberParser on: context stream) nextNumber ] 
			on: Error
			do: [ :err | PPFailure message: err messageText at: context position ] ] 
				asParser
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> numberLiteral [
	^ numberToken
]

{ #category : #token }
PPSmalltalkGrammar >> numberToken [
	^ number smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> parens [
	^ $( asParser smalltalkToken , expression , $) asParser smalltalkToken
]

{ #category : #parsing }
PPSmalltalkGrammar >> parseExpression: aString [ 
	^ self parseExpression: aString onError: [ :msg :pos | self error: msg ]
]

{ #category : #parsing }
PPSmalltalkGrammar >> parseExpression: aString onError: aBlock [
	^ startExpression parse: aString onError: aBlock
]

{ #category : #parsing }
PPSmalltalkGrammar >> parseMethod: aString [ 
	^ self parseMethod: aString onError: [ :msg :pos | self error: msg ]
]

{ #category : #parsing }
PPSmalltalkGrammar >> parseMethod: aString onError: aBlock [
	^ startMethod parse: aString onError: aBlock
]

{ #category : #primitives }
PPSmalltalkGrammar >> period [
	^ $. asParser
]

{ #category : #token }
PPSmalltalkGrammar >> periodToken [
	^ period smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> pragma [
	^ $< asParser smalltalkToken , pragmaMessage , $> asParser smalltalkToken
]

{ #category : #'grammar-pragmas' }
PPSmalltalkGrammar >> pragmaMessage [
	^ keywordPragma / unaryPragma / binaryPragma
]

{ #category : #grammar }
PPSmalltalkGrammar >> pragmas [
	^ pragma star
]

{ #category : #grammar }
PPSmalltalkGrammar >> primary [
	^ literal / variable / block / parens / array
]

{ #category : #grammar }
PPSmalltalkGrammar >> return [
	^ $^ asParser smalltalkToken , expression
]

{ #category : #grammar }
PPSmalltalkGrammar >> sequence [
	^ temporaries , periodToken star , statements
]

{ #category : #accessing }
PPSmalltalkGrammar >> start [
	"Default start production."

	^ startMethod
]

{ #category : #accessing }
PPSmalltalkGrammar >> startExpression [
	"Start production for the expression."

	^ sequence end
]

{ #category : #accessing }
PPSmalltalkGrammar >> startMethod [
	"Start production for the method."

	^ method end
]

{ #category : #grammar }
PPSmalltalkGrammar >> statements [
	^ 	(expression wrapped , ((periodToken plus , statements ==> [ :nodes | nodes first , nodes last ])
								/ periodToken star)
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(return , periodToken star
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(periodToken star)
]

{ #category : #primitives }
PPSmalltalkGrammar >> string [
	^ $' asParser , ('''''' asParser / $' asParser negate) star , $' asParser
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> stringLiteral [
	^ stringToken
]

{ #category : #token }
PPSmalltalkGrammar >> stringToken [
	^ string smalltalkToken
]

{ #category : #primitives }
PPSmalltalkGrammar >> symbol [
	^ unary / binary / multiword / string
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> symbolLiteral [
	"This is totally fucked up: The Pharo compiler allows multiple #, arbitrary spaces between the # and the symbol, as well as comments inbetween. And yes, it is used."

	^ $# asParser smalltalkToken plus , symbol smalltalkToken ==> [ :tokens | tokens first copyWith: tokens last ]
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> symbolLiteralArray [
	^ symbol smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> temporaries [
	^ ($| asParser smalltalkToken , variable star , $| asParser smalltalkToken) optional ==> [ :nodes | nodes ifNil: [ #() ] ]
]

{ #category : #'grammar-literals' }
PPSmalltalkGrammar >> trueLiteral [
	^ trueToken
]

{ #category : #token }
PPSmalltalkGrammar >> trueToken [
	^ ('true' asParser , #word asParser not) smalltalkToken
]

{ #category : #primitives }
PPSmalltalkGrammar >> unary [
	^ identifier , $: asParser not
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> unaryExpression [
	^ primary , unaryMessage star
]

{ #category : #'grammar-messages' }
PPSmalltalkGrammar >> unaryMessage [
	^ unaryToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]
]

{ #category : #'grammar-methods' }
PPSmalltalkGrammar >> unaryMethod [
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]
]

{ #category : #'grammar-pragmas' }
PPSmalltalkGrammar >> unaryPragma [
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: (Array new) ]
]

{ #category : #token }
PPSmalltalkGrammar >> unaryToken [
	^ unary smalltalkToken
]

{ #category : #grammar }
PPSmalltalkGrammar >> variable [
	^ identifierToken
]
