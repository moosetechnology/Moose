"
A MiniFSharpGrammar is proof of concept of FSharp indentation sensitive rules.

Instance Variables

"
Class {
	#name : #PPMiniFSharpGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'let',
		'valueDefinition',
		'expr',
		'if',
		'if_ElseBranch',
		'let_val',
		'const',
		'number',
		'pat',
		'identifier',
		'infixOp',
		'spaces',
		'blanks',
		'kwLet',
		'_in',
		'string',
		'expr_sequence',
		'expr_terminal',
		'kwFor',
		'kwTo',
		'kwDo',
		'kwDone',
		'for',
		'expr_print',
		'semicolon',
		'_semicolon',
		'seqBlock',
		'kw',
		'kwIn',
		'sep',
		'forBlock',
		'_done',
		'align',
		'blank',
		'aligns',
		'aligned',
		'seqBlockStart',
		'seqBlockEnd',
		'setIl',
		'restoreIl',
		'space',
		'any',
		'aligns__2',
		'align__2',
		'infixOpOnline',
		'infixOpNewline',
		'trim',
		'semicolon_trimmed',
		'eof'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #for }
PPMiniFSharpGrammar >> _done [
	"PPFailingParser message: 'todo: _done'"
	^ aligned / eof ==> [ :e | #'_done' ]
"
	^ spaces, kwDone not, (nil asParser alignedTo: seqBlockOffsideLine) not"
]

{ #category : #let }
PPMiniFSharpGrammar >> _in [
	"...the pre-parser inserts an implicit separating in token between each definition t
		hat begins at the same column as that token..."
		
	^ align, aligned ==> [ :e | #'_in' ]

]

{ #category : #expressions }
PPMiniFSharpGrammar >> _semicolon [
	^ align, aligned ==> [ :e | #'_semicolon' ]
"	^ spaces, (nil asParser alignedTo: seqBlockOffsideLine)"
]

{ #category : #indentation }
PPMiniFSharpGrammar >> align [
	^ #align asParser
]

{ #category : #indentation }
PPMiniFSharpGrammar >> align__2 [
	^ (aligns not, space) star, aligns__2
]

{ #category : #indentation }
PPMiniFSharpGrammar >> aligned [
	^ aligns, blank not
]

{ #category : #indentation }
PPMiniFSharpGrammar >> aligns [
	^ #aligns asParser
]

{ #category : #indentation }
PPMiniFSharpGrammar >> aligns__2 [
	^ ((aligns not, any asParser) optional,
	   (aligns not, any asParser) optional,
	    aligns) and
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> any [
	^ #any asParser
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> blank [
	^ #blank asParser
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> blanks [
	^ #blank asParser star ==> [ :tokens | #whitespaces ]
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> block [
	^ 'begin' asParser trim, expr, 'end' asParser trim
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> const [
	^ number / string
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> eof [
	^ #eof asParser
]

{ #category : #expressions }
PPMiniFSharpGrammar >> expr [
	^ 
	  expr_sequence
]

{ #category : #expressions }
PPMiniFSharpGrammar >> expr_print [
	^ blanks, 'printf' asParser, blanks, expr_terminal ==> [:tokens | OrderedCollection with: #printf with: tokens fourth ]
]

{ #category : #expressions }
PPMiniFSharpGrammar >> expr_sequence [
	^ expr_terminal, 
	 (
		((_semicolon, expr_terminal) ==> #last) /
		(semicolon_trimmed, expr_terminal optional ==> #last) /
		(((infixOpOnline / infixOpNewline), expr_terminal) ==> #last)
	) star
	
	map: [ :first :rest |
		rest asOrderedCollection addFirst: first; yourself
	]
	
",		(
		 ((semicolon trim, (expr_terminal onsideTo: seqBlockOffsideLine) optional) ==> #second)
		/ 
		 ((_semicolon trim, expr_terminal) ==> #second)
		/ 
		 (((infixOp onsideTo: seqBlockOffsideLine tolerance: 2) trim, expr_terminal) ==> #second)
		) star ==> [ :tokens | (OrderedCollection with: tokens first) addAll: tokens second; yourself ]"
]

{ #category : #expressions }
PPMiniFSharpGrammar >> expr_terminal [
	
	^ let / for / if / expr_print / const / identifier
]

{ #category : #for }
PPMiniFSharpGrammar >> for [
	^ kwFor trim, identifier, '=' asParser trim, expr, kwTo trim, expr, kwDo trim, forBlock
]

{ #category : #for }
PPMiniFSharpGrammar >> forBlock [
	^ seqBlock, (kwDone trim / _done) ==> #first
"	^ spaces, seqBlockOffsideLine, expr, spaces, (_done / kwDone), seqBlockOffsideLine pop ==> #third"
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> identifier [
	^ kw not, #letter asParser plus flatten ==> #second
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> if [
	^ 'if' asParser trim, expr, 'then' asParser trim, expr, if_ElseBranch optional
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> if_ElseBranch [
	^ 'else' asParser trim, expr
]

{ #category : #expressions }
PPMiniFSharpGrammar >> infixOp [
	^ '+' asParser / '-' asParser / '*' asParser
]

{ #category : #expressions }
PPMiniFSharpGrammar >> infixOpNewline [
	^ align__2, infixOp trimBlanks
]

{ #category : #expressions }
PPMiniFSharpGrammar >> infixOpOnline [
	^ infixOp trimBlanks
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kw [
	^ kwDo / kwDone / kwFor / kwIn / kwLet / kwTo
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwDo [
	^ 'do' asParser
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwDone [
	^ 'done' asParser
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwFor [
	^ 'for' asParser
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwIn [
	^ 'in' asParser
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwLet [
	^ 'let' asParser
]

{ #category : #keywords }
PPMiniFSharpGrammar >> kwTo [
	^ 'to' asParser
]

{ #category : #let }
PPMiniFSharpGrammar >> let [
	^ let_val
]

{ #category : #let }
PPMiniFSharpGrammar >> let_val [
	^ 
	setIl,
		kwLet, blanks, valueDefinition, ((kwIn trimBlanks / _in), restoreIl), trim, expr
	
	map: [ :__set :__let :__ws1 :__val :__in :__ws2 :__expr  |
		{ __val .  __expr }	
	]
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> number [
	^ #digit asParser plus flatten ==> [:token | token asNumber]
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> pat [
	^ identifier / const
]

{ #category : #indentation }
PPMiniFSharpGrammar >> restoreIl [
	^ #restoreIl asParser
]

{ #category : #expressions }
PPMiniFSharpGrammar >> semicolon [
	^ $; asParser
]

{ #category : #expressions }
PPMiniFSharpGrammar >> semicolon_trimmed [
	^ trim, $; asParser, trim ==> #second
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> sep [
	^ semicolon / _semicolon
]

{ #category : #seqBlock }
PPMiniFSharpGrammar >> seqBlock [
	^ 
	seqBlockStart,
		expr,
	seqBlockEnd
	
	==> #second
"	^ spaces, seqBlockOffsideLine, expr, seqBlockOffsideLine pop ==> #third"
]

{ #category : #seqBlock }
PPMiniFSharpGrammar >> seqBlockEnd [
	^ restoreIl
]

{ #category : #seqBlock }
PPMiniFSharpGrammar >> seqBlockStart [
	^ spaces, setIl
]

{ #category : #indentation }
PPMiniFSharpGrammar >> setIl [
	^ #setIl asParser
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> space [
	^ #space asParser
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> spaces [
	^ #space asParser star ==> [ :tokens | #whitespaces ]
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> start [
	^ seqBlock trim
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammar >> string [
	^ $" asParser, (#any asParser starLazy: $" asParser) flatten, $" asParser ==> [ :tokens | tokens second  ]
]

{ #category : #whitespace }
PPMiniFSharpGrammar >> trim [
	"onside or blanks"
	^ (align, blanks) / blanks
]

{ #category : #let }
PPMiniFSharpGrammar >> valueDefinition [
	^ pat, spaces, '=' asParser, seqBlock
		 
	map: [ :__pat :__space :__eq :__seqBlock |
 		{ __pat . __seqBlock }	
	]	
]
