Class {
	#name : #PPMiniHaskellGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'number',
		'print',
		'do',
		'let',
		'if',
		'statementBlock',
		'identifier',
		'ifSingleline',
		'ifMultiline',
		'space',
		'spaces',
		'ifPart',
		'ifThenPart',
		'ifElsePart',
		'expression',
		'statement',
		'statementBlockStart',
		'statementBlockEnd',
		'blanks',
		'pushIndent',
		'popIndent',
		'ifThenStart',
		'emptyLines',
		'newline',
		'blank',
		'ifThenEnd',
		'expressionBlock'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #whitespaces }
PPMiniHaskellGrammar >> blank [
	^ #blank asParser
]

{ #category : #whitespaces }
PPMiniHaskellGrammar >> blanks [
	^ #blank asParser star
]

{ #category : #grammar }
PPMiniHaskellGrammar >> do [
	^ 'do' asParser trim, statementBlock
	==> #second
]

{ #category : #whitespaces }
PPMiniHaskellGrammar >> emptyLines [
	^ (#blank asParser star, newline) star
]

{ #category : #grammar }
PPMiniHaskellGrammar >> expression [
	^ (identifier, $= asParser trimBlanks, number trimBlanks) ==> [ :tokens | #expr ]
]

{ #category : #grammar }
PPMiniHaskellGrammar >> expressionBlock [
	^ 
	pushIndent,
		(expression trimAlign, emptyLines ==> #second) plus,
	popIndent
	
	==> #second
]

{ #category : #grammar }
PPMiniHaskellGrammar >> identifier [
	^ #letter asParser plus flatten
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> if [
	^ ifSingleline / ifMultiline
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifElsePart [
	^ 'else' asParser, (blanks, emptyLines), statementBlock
	==> #third
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifMultiline [
	^ ifPart trim,
		ifThenStart, ifThenPart, emptyLines,
		(ifElsePart trimAlign) optional,
		ifThenEnd
	map: [ :_if :_ts :_then :_el :_else :_end |
		{ _if . _then . _else }
	]
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifPart [
	^ 'if' asParser, space, identifier ==> #third
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifSingleline [
	^ ifPart trimBlanks, ifThenPart trimBlanks, ifElsePart trimBlanks
]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifThenEnd [
	^ popIndent

]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifThenPart [
	^ 'then' asParser, space, statementBlock ==> #last

]

{ #category : #'grammar - if-then-else' }
PPMiniHaskellGrammar >> ifThenStart [
	^ pushIndent

]

{ #category : #grammar }
PPMiniHaskellGrammar >> let [
	^ 'let' asParser trim, expressionBlock
	
	==> #second
]

{ #category : #whitespaces }
PPMiniHaskellGrammar >> newline [
	^ #newline asParser
]

{ #category : #grammar }
PPMiniHaskellGrammar >> number [
	^ #digit asParser plus flatten
]

{ #category : #'indent-dedent' }
PPMiniHaskellGrammar >> popIndent [
	^ #restoreIl asParser
]

{ #category : #grammar }
PPMiniHaskellGrammar >> print [
	^ ('print' asParser, number trimBlanks) ==> [ :tokens | #print ]
]

{ #category : #'indent-dedent' }
PPMiniHaskellGrammar >> pushIndent [
	^ #setIl asParser
]

{ #category : #whitespaces }
PPMiniHaskellGrammar >> space [
	^ #space asParser
]

{ #category : #whitespaces }
PPMiniHaskellGrammar >> spaces [
	^ #space asParser star
]

{ #category : #grammar }
PPMiniHaskellGrammar >> start [
	^ statement trim star 
]

{ #category : #grammar }
PPMiniHaskellGrammar >> statement [
	^ print / do / let / if
]

{ #category : #grammar }
PPMiniHaskellGrammar >> statementBlock [
	^ 
	statementBlockStart,
		(statement trimAlign, emptyLines ==> #first) plus,
	statementBlockEnd
	
	==> #second
]

{ #category : #grammar }
PPMiniHaskellGrammar >> statementBlockEnd [
	^ popIndent
]

{ #category : #grammar }
PPMiniHaskellGrammar >> statementBlockStart [
	^ pushIndent
]
