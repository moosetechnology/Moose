Class {
	#name : #PPMiniPythonGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'emptyLine',
		'align',
		'newline',
		'indent',
		'dedent',
		'blank',
		'ifStmt',
		'whileStmt',
		'forStmt',
		'tryStmt',
		'withStmt',
		'assignmentStmt',
		'identifier',
		'expression',
		'exprOperator',
		'targetList',
		'expressionList',
		'suite',
		'number',
		'statement',
		'printStmt',
		'compoundStmt',
		'try1Stmt',
		'try2Stmt',
		'suiteTrimmed',
		'space',
		'semicolon',
		'colon',
		'whatever',
		'else',
		'elseOpt',
		'unknownStmt',
		'lineEnd',
		'funcDef',
		'classDef',
		'eol',
		'brackets',
		'multilineComment',
		'comment',
		'lineContinues',
		'string',
		'emptyStatement',
		'ifKw',
		'onelineString'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'indent-dedent' }
PPMiniPythonGrammar >> align [
	^ #prefix asParser flatten
]

{ #category : #grammar }
PPMiniPythonGrammar >> assignmentStmt [
	^ identifier, $= asParser trimBlanks, expression ==> [ :e | #() ]
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> blank [
	^ #blank asParser
]

{ #category : #others }
PPMiniPythonGrammar >> brackets [
	^ 
	($( asParser, (multilineComment / onelineString / brackets / $) asParser negate) star, $) asParser) / 
	($[ asParser, (multilineComment / onelineString / brackets / $] asParser negate) star, $] asParser) / 
	(${ asParser, (onelineString / brackets / $} asParser negate) star, $} asParser)
]

{ #category : #grammar }
PPMiniPythonGrammar >> classDef [
	^ 'class' asParser, blank, identifier trimBlanks, whatever, suiteTrimmed
	map: [ :_def :_sep :_name :_we :_body |
		{ 'class:' . _name . _body . ':class' }
	]
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> colon [
	^ $: asParser
]

{ #category : #others }
PPMiniPythonGrammar >> comment [
	^ '#' asParser, newline negate star
]

{ #category : #grammar }
PPMiniPythonGrammar >> compoundStmt [
	^ ifStmt
         / whileStmt
         / forStmt
         / tryStmt
         / withStmt
         / funcDef
			/ classDef
]

{ #category : #'indent-dedent' }
PPMiniPythonGrammar >> dedent [
	^ ((([ :context | context indentStack pop ] asParser, 
		(emptyLine, newline) star, 
		((align, blank not ==> #first) / (align not, blank star flatten ==> #second))
	  )
	
	map: [ :_pop :_empty :_align  | 
		_align
	]) and, #pop asParser ==> #first)

		"JK: Hackish, because of imperfect push-pop analysis"
		propertyAt: #indentPop put: true;
		yourself

]

{ #category : #grammar }
PPMiniPythonGrammar >> else [
	^ (align, 'else' asParser,  whatever, suiteTrimmed) ==> #fourth

]

{ #category : #grammar }
PPMiniPythonGrammar >> elseOpt [
	^ else optional
 
	==> [ :_else | _else ifNil: [ #() ] ]
]

{ #category : #'indent-dedent' }
PPMiniPythonGrammar >> emptyLine [
	^  (#blank asParser / comment) star
]

{ #category : #grammar }
PPMiniPythonGrammar >> emptyStatement [
	^ ( newline / 
		(comment trimBlanks, newline)
	) ==> [ :e | #() ]
]

{ #category : #grammar }
PPMiniPythonGrammar >> eol [
	^ #endOfLine asParser
]

{ #category : #grammar }
PPMiniPythonGrammar >> exprOperator [
	^ $+ asParser /
	   $< asParser /
	   '==' asParser
]

{ #category : #grammar }
PPMiniPythonGrammar >> expression [
	^ 
	(identifier, (exprOperator trimBlanks, expression) star)
	/
	($( asParser, expression trim, $) asParser)
	
	
	==> [ :tokens | #expr ] 
]

{ #category : #grammar }
PPMiniPythonGrammar >> expressionList [          
	^  (expression trim , ( ',' asParser trim , expression trim ) star , (',' asParser trim optional)) ==> [ :tokens | #exprList ]
]

{ #category : #grammar }
PPMiniPythonGrammar >> forStmt [
	^ 'for' asParser, blank, whatever,
		suiteTrimmed,
		elseOpt
"	==> [ :tokens | Array with:tokens second with:tokens sixth with:tokens seventh ]"
	map: [ :_for :_sep :_whatever :_body :_else |
		{ 'for:' . _body . _else . ':for' }
	]
]

{ #category : #grammar }
PPMiniPythonGrammar >> funcDef [
	^ 'def' asParser, blank, identifier trimBlanks, whatever, suiteTrimmed
	map: [ :_def :_sep :_name :_we :_body |
		{ 'fundef:' . _name . _body . ':fundef' }
	]
]

{ #category : #grammar }
PPMiniPythonGrammar >> identifier [
	| id letter digit |
	letter := #letter asParser.
	digit := #digit asParser.
	
	id := ((letter / '_' asParser), ( letter / digit / '_' asParser )  star).
	
	^ id flatten
]

{ #category : #keywords }
PPMiniPythonGrammar >> ifKw [
	^ 'if' asParser, (blank / '(' asParser) and
]

{ #category : #grammar }
PPMiniPythonGrammar >> ifStmt [
	^ ifKw, whatever,  suiteTrimmed,
       ( (align, 'elif' asParser,  whatever, suiteTrimmed) ==> #last ) star, 
       elseOpt 
	map: [ :_if :_whatever :_then :__elifs :_else |
		| _elifs _retval |
		_elifs := __elifs.

		_retval := OrderedCollection new.
		_retval add: 'if:'.
		_retval add:_then.

		_elifs do: [ :e | 
			_retval add: 'if:'.
			_retval add: e 
		].
		_retval add: _else.
		_elifs do: [ :e | 
			_retval add: ':if'
		].
		_retval add: ':if'.
		_retval
	]
]

{ #category : #'indent-dedent' }
PPMiniPythonGrammar >> indent [
	^ (((emptyLine, newline) star, align, ((#blank asParser plus) flatten)
	
	map: [ :emptylines :_align :_indent |
		_indent
	]) and pushAsParser)
		"JK: Hackish, because of imperfect push-pop analysis"
		propertyAt: #indentPush put: true;
		yourself

	
]

{ #category : #others }
PPMiniPythonGrammar >> lineContinues [
	^ $\asParser, newline
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> lineEnd [
	^ newline / #eof asParser
]

{ #category : #others }
PPMiniPythonGrammar >> multilineComment [
	| doubleQuot singleQuot |
	doubleQuot := 	'"""' asParser.
	singleQuot := 	'''''''' asParser.
		
		
 	^ (
		(doubleQuot, doubleQuot negate star, doubleQuot) /
		(singleQuot, singleQuot negate star, singleQuot)
	) ==> [ :e | #() ]
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> newline [
	^ #newline asParser
]

{ #category : #grammar }
PPMiniPythonGrammar >> number [
	^ #digit asParser plus
]

{ #category : #others }
PPMiniPythonGrammar >> onelineString [
	| singleQuote doubleQuote sqString dqString |
	"this is far from complete,..."
	
	singleQuote := $' asParser.
	doubleQuote := $" asParser.
	
	sqString := singleQuote, (newline not, ('\''' asParser / singleQuote negate)) star, singleQuote.
	dqString := doubleQuote, (newline not, ('\"' asParser / doubleQuote negate)) star, doubleQuote.
	
	^ sqString / dqString 
]

{ #category : #grammar }
PPMiniPythonGrammar >> printStmt [
"	^ 'print' asParser, (identifier / number) trimBlanks ==> [ :tokens | #print ]"
	^ 'print' asParser, "(newline / semicolon) negate star" unknownStmt trimBlanks
	
	map: [ :print :rest |
 		#'print'	
	]
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> semicolon [
	^ $; asParser
]

{ #category : #whitespaces }
PPMiniPythonGrammar >> space [
	^ #space asParser
]

{ #category : #grammar }
PPMiniPythonGrammar >> start [
	^ (statement trimBlanks / ((emptyLine, lineEnd) ==> [:e | #() ])) nonEmpty star
	
	==> [ :e | 
		e deepFlatten
	]
]

{ #category : #grammar }
PPMiniPythonGrammar >> statement [
	^ printStmt   /  compoundStmt / unknownStmt / emptyStatement
]

{ #category : #others }
PPMiniPythonGrammar >> string [
	| singleQuote doubleQuote sqString dqString |
	"this is far from complete,..."
	
	singleQuote := $' asParser.
	doubleQuote := $" asParser.
	
	sqString := singleQuote, ('\''' asParser / '\\' asParser / singleQuote negate) star, singleQuote.
	dqString := doubleQuote, ('\"' asParser / '\\' asParser / doubleQuote negate) star, doubleQuote.
	
	^ sqString / dqString 
]

{ #category : #grammar }
PPMiniPythonGrammar >> suite [
	^ 
	 
	(indent, 
		(((align not, space) star, align, (statement) ==> #third)) plus, 
	dedent 
	==> [ :tokens | tokens second ])
	/ unknownStmt
]

{ #category : #grammar }
PPMiniPythonGrammar >> suiteTrimmed [
	^  
	(indent not, (space / comment)) star,
		suite,
	(emptyLine, newline) star
		
	==> #second

]

{ #category : #grammar }
PPMiniPythonGrammar >> targetList [
	^ nil asParser
]

{ #category : #grammar }
PPMiniPythonGrammar >> tripleQuotString [
	| quot |
	quot := 	'''''''' asParser.
		
		
 	^ quot, quot negate star, quot ==> [ :e | #() ]
]

{ #category : #grammar }
PPMiniPythonGrammar >> try1Stmt [
	^ 'try' asParser, whatever, suiteTrimmed,
		((align, 'except' asParser, whatever, suiteTrimmed) ==> #last ) plus,
		elseOpt,
		((align, 'finally' asParser, colon trimBlanks, suiteTrimmed) ==> #last) optional 
		
	map: [ :_try :_col :_body :_excepts :_else :_finally |
		| retval |
		
		
		retval := { 'try:' . _body . _excepts . _else . ':try' }.
		
		_finally isNil ifFalse: [ 
			retval := { 'try:' . retval .  _finally . ':try' }.
		].
		retval
	]
      
]

{ #category : #grammar }
PPMiniPythonGrammar >> try2Stmt [
	^ 'try' asParser, colon trimBlanks, suiteTrimmed,
		(align, 'finally' asParser, ':' asParser trimBlanks, suiteTrimmed  ==> #fourth)
	map: [ :_try :_colon :_body :_finally |
		{ 'try:' ._body . _finally . ':try' }
	]
]

{ #category : #grammar }
PPMiniPythonGrammar >> tryStmt [
	^ try1Stmt / try2Stmt
]

{ #category : #grammar }
PPMiniPythonGrammar >> unknownStmt [
	^ blank not, 
		(	brackets /
			comment /
			multilineComment /
			string /
			lineContinues /
			newline asParser negate) 
		star nonEmpty flatten ==> [ :e | #() ]
]

{ #category : #others }
PPMiniPythonGrammar >> whatever [
	^ 
	  ( 
		brackets /
		string /
		(colon negate)
	  )	
	star, colon, (blank star), comment optional
]

{ #category : #grammar }
PPMiniPythonGrammar >> whileStmt [
	^ 'while' asParser, (blank / colon), whatever, 
		suiteTrimmed,
		elseOpt
	map: [ :_while :sep :_we :_body :_else |
		{ 'while:' . _body . _else . ':while' }
	]

]

{ #category : #grammar }
PPMiniPythonGrammar >> withStmt [
	^ 'with' asParser, (blank / colon) and, whatever, 
		suiteTrimmed
   map: [ :_with :sep :_we :_body |
		{ 'with:' . _body . ':with' }
	]
]
