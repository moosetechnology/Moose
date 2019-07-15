Class {
	#name : #SmaCCRewriteRuleFileParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'filename'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'generated-accessing' }
SmaCCRewriteRuleFileParser class >> cacheId [
	^'2018-03-19T12:41:11.603329-05:00'
]

{ #category : #generated }
SmaCCRewriteRuleFileParser class >> definitionComment [
"<singleName>
	: (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	;
<name>
	: <singleName> (\. <singleName>)*
	;
<string>
	: (\' [^\']* \') +
	;
<cmt>
	: (\""[^\""]*\"")+
	;
<method>
	: \#([^!]|!!)+ !
	;
<whitespace>
	: <isSeparator>+
	;
File
	: Rules {'1'}
	;
Rules
	: {SmaCCRewriteFile new filename: filename; yourself}
	| Rules Rule {'1' addTransformation: '2'; yourself}
	| Rules ParserClass {'1' parserClass: '2'; yourself}
	| Rules Import {'1' import: '2'; yourself}
	;
ParserClass
	: ""Parser"" "":"" <name> 'name' {self lookupClass: name}
	;
Import
	: ""Import"" "":"" <string> 'name' {(name value copyFrom: 2 to: name value size - 1) copyReplaceAll: '''''' with: ''''}
	;
Rule
	: Comment 'comment' Match 'match' ""->"" Transformation 'transformation' {SmaCCRewrite comment: comment match: match transformation: transformation}
	| Comment 'comment' <method> 'method' {SmaCCRewriteMethodDefinition comment: comment source: ((method value copyFrom: 2 to: method value size - 1) copyReplaceAll: '!!' with: '!')}
	| Comment 'comment' Variables 'variables' {SmaCCRewritePropertyDefinition comment: comment locals: ((variables reject: [:each | each first]) collect: [:each | each last]) globals: ((variables select: [:each | each first]) collect: [:each | each last])}
	;
Comment
	: {nil}
	| <cmt> {('1' value copyFrom: 2 to: '1' value size - 1) copyReplaceAll: '""""' with: '""'}
	;
Variables
	: ""("" VariableList 'vars' "")"" {vars}
	;
VariableList
	: {OrderedCollection new}
	| VariableList 'vars' Variable 'var' {vars add: var; yourself}
	;
Variable
	: ""-"" <name> 'name' {Array with: false with: name value}
	| ""+"" <name> 'name' {Array with: true with: name value}
	;
Match
	: StringExpression {SmaCCRewriteTreeMatch new source: '1'; yourself}
	| <name> 'state' StringExpression 'exp' {SmaCCRewriteTreeMatch new source: exp; startingState: state value; yourself}
	| <name> {SmaCCRewriteTypeMatch on: (self lookupClass: '1')}
	| <name> Block {(SmaCCRewriteTypeMatch on: (self lookupClass: '1')) code: '2'; yourself}
	;
StringExpression
	: StartStringExpression 'string' "">>>"" ""<<<"" {string}
	;
Transformation
	: StringExpression {SmaCCRewriteStringTransformation on: '1'}
	| Block {SmaCCRewriteCodeTransformation on: '1'}
	;
Block
	: StartSmalltalkExpression 'string' ""[""  ""]"" {string}
	;
StartStringExpression
	: {self scanStringExpression}
	;
StartSmalltalkExpression
	: {self scanSmalltalkExpression}
	;"
]

{ #category : #'file types' }
SmaCCRewriteRuleFileParser class >> fileExtension [
	^ '.rw'
]

{ #category : #'file types' }
SmaCCRewriteRuleFileParser class >> fileExtensionType [
	^ 'SmaCC Rewrite files'
]

{ #category : #accessing }
SmaCCRewriteRuleFileParser class >> parseFile: aString [
	| stream |
	stream := FileStream readOnlyFileNamed: aString.
	^ [ | parser |
	parser := self on: stream.
	parser filename: aString.
	parser parse
		filename: aString;
		finishedLoading;
		yourself ]
		ensure: [ stream close ]
]

{ #category : #'generated-accessing' }
SmaCCRewriteRuleFileParser class >> scannerClass [
	^SmaCCRewriteRuleFileScanner
]

{ #category : #generated }
SmaCCRewriteRuleFileParser class >> startingStateForFile [
	^ 1
]

{ #category : #private }
SmaCCRewriteRuleFileParser >> filename: aString [
	filename := aString
]

{ #category : #private }
SmaCCRewriteRuleFileParser >> lookupClass: aSmaCCToken [
	| string block |
	string := aSmaCCToken value.
	block := [ :each | 
	each name asString = string
		ifTrue: [ ^ each ] ].
	SmaCCParseNode withAllSubclasses do: block.
	SmaCCParser allSubclassesDo: block.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForComment2: nodes [
	^ ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1)
		copyReplaceAll: '""'
		with: '"'
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForImport1: nodes [
	^ ((nodes at: 3) value copyFrom: 2 to: (nodes at: 3) value size - 1)
		copyReplaceAll: ''''''
		with: ''''
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForMatch1: nodes [
	^ SmaCCRewriteTreeMatch new
		source: (nodes at: 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForMatch2: nodes [
	^ SmaCCRewriteTreeMatch new
		source: (nodes at: 2);
		startingState: (nodes at: 1) value;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForMatch3: nodes [
	^ SmaCCRewriteTypeMatch on: (self lookupClass: (nodes at: 1))
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForMatch4: nodes [
	^ (SmaCCRewriteTypeMatch on: (self lookupClass: (nodes at: 1)))
		code: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForParserClass1: nodes [
	^ self lookupClass: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRule1: nodes [
	^ SmaCCRewrite
		comment: (nodes at: 1)
		match: (nodes at: 2)
		transformation: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRule2: nodes [
	^ SmaCCRewriteMethodDefinition
		comment: (nodes at: 1)
		source:
			(((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1) copyReplaceAll: '!!' with: '!')
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRule3: nodes [
	^ SmaCCRewritePropertyDefinition
		comment: (nodes at: 1)
		locals:
			(((nodes at: 2) reject: [ :each | each first ])
				collect: [ :each | each last ])
		globals:
			(((nodes at: 2) select: [ :each | each first ])
				collect: [ :each | each last ])
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRules1: nodes [
	^ SmaCCRewriteFile new
		filename: filename;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRules2: nodes [
	^ (nodes at: 1)
		addTransformation: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRules3: nodes [
	^ (nodes at: 1)
		parserClass: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForRules4: nodes [
	^ (nodes at: 1)
		import: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForStartSmalltalkExpression1: nodes [
	^ self scanSmalltalkExpression
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForStartStringExpression1: nodes [
	^ self scanStringExpression
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForTransformation1: nodes [
	^ SmaCCRewriteStringTransformation on: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForTransformation2: nodes [
	^ SmaCCRewriteCodeTransformation on: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForVariable1: nodes [
	^ Array with: false with: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForVariable2: nodes [
	^ Array with: true with: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForVariableList1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteRuleFileParser >> reduceActionForVariableList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #generated }
SmaCCRewriteRuleFileParser >> reduceTable [
^#(
	#(20 0 #reduceActionForRules1:) 
	#(24 0 #nil) 
	#(19 1 #liftFirstValue:) 
	#(24 1 #reduceActionForComment2:) 
	#(20 2 #reduceActionForRules3:) 
	#(20 2 #reduceActionForRules4:) 
	#(20 2 #reduceActionForRules2:) 
	#(32 0 #reduceActionForStartStringExpression1:) 
	#(26 0 #reduceActionForVariableList1:) 
	#(28 1 #reduceActionForMatch3:) 
	#(33 0 #reduceActionForStartSmalltalkExpression1:) 
	#(23 2 #reduceActionForRule2:) 
	#(23 2 #reduceActionForRule3:) 
	#(28 1 #reduceActionForMatch1:) 
	#(22 3 #reduceActionForImport1:) 
	#(21 3 #reduceActionForParserClass1:) 
	#(28 2 #reduceActionForMatch2:) 
	#(28 2 #reduceActionForMatch4:) 
	#(25 3 #liftSecondValue:) 
	#(26 2 #reduceActionForVariableList2:) 
	#(30 1 #reduceActionForTransformation1:) 
	#(23 4 #reduceActionForRule1:) 
	#(30 1 #reduceActionForTransformation2:) 
	#(29 3 #liftFirstValue:) 
	#(27 2 #reduceActionForVariable2:) 
	#(27 2 #reduceActionForVariable1:) 
	#(31 3 #liftFirstValue:)
	).
]

{ #category : #private }
SmaCCRewriteRuleFileParser >> scanSmalltalkExpression [
	^ scanner scanSmalltalkExpression
]

{ #category : #private }
SmaCCRewriteRuleFileParser >> scanStringExpression [
	^ scanner scanStringExpression
]

{ #category : #generated }
SmaCCRewriteRuleFileParser >> symbolNames [
	^ #('"("' '")"' '"+"' '"-"' '"->"' '":"' '"<<<"' '">>>"' '"Import"' '"Parser"' '"["' '"]"' '<name>' '<string>' '<cmt>' '<method>' '<whitespace>' 'B e g i n' 'File' 'Rules' 'ParserClass' 'Import' 'Rule' 'Comment' 'Variables' 'VariableList' 'Variable' 'Match' 'StringExpression' 'Transformation' 'Block' 'StartStringExpression' 'StartSmalltalkExpression' 'E O F' 'error')
]

{ #category : #generated }
SmaCCRewriteRuleFileParser >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 8 0 6 0 9 0 6 0 10 0 6 0 13 0 6 0 15 0 6 0 16 0 9 0 19 0 13 0 20 0 6 0 34] 
#[0 0 0 0 34] 
#[1 0 10 0 1 0 10 0 8 0 17 0 9 0 21 0 10 0 10 0 13 0 25 0 15 0 10 0 16 0 29 0 21 0 33 0 22 0 37 0 23 0 41 0 24 0 14 0 34] 
#[0 0 45 0 6] 
#[0 0 49 0 6] 
#[0 0 18 0 1 0 8 0 13 0 16] 
#[0 0 22 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 26 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 30 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[1 0 53 0 1 0 34 0 8 0 57 0 13 0 61 0 16 0 65 0 25 0 69 0 28 0 73 0 29 0 77 0 32] 
#[0 0 81 0 14] 
#[0 0 85 0 13] 
#[1 0 38 0 2 0 38 0 3 0 38 0 4 0 89 0 26] 
#[1 0 42 0 5 0 34 0 8 0 46 0 11 0 93 0 29 0 97 0 31 0 77 0 32 0 101 0 33] 
#[0 0 50 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 54 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 105 0 5] 
#[0 0 58 0 5] 
#[0 0 109 0 8] 
#[0 0 62 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 66 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[1 0 113 0 2 0 117 0 3 0 121 0 4 0 125 0 27] 
#[0 0 70 0 5] 
#[0 0 74 0 5] 
#[0 0 129 0 11] 
#[1 0 34 0 8 0 46 0 11 0 133 0 29 0 137 0 30 0 141 0 31 0 77 0 32 0 101 0 33] 
#[0 0 145 0 7] 
#[0 0 78 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 149 0 13] 
#[0 0 153 0 13] 
#[0 0 82 0 2 0 3 0 4] 
#[0 0 157 0 12] 
#[0 0 86 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 90 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 94 0 1 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 98 0 1 0 5 0 8 0 9 0 10 0 13 0 15 0 16 0 34] 
#[0 0 102 0 2 0 3 0 4] 
#[0 0 106 0 2 0 3 0 4] 
#[0 0 110 0 1 0 5 0 8 0 9 0 10 0 13 0 15 0 16 0 34]
	).
]

{ #category : #private }
SmaCCRewriteRuleFileParser >> tryAllTokens [
	^ true
]
