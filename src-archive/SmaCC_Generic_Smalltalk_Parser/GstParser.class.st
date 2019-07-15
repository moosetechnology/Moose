Class {
	#name : #GstParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #'generated-accessing' }
GstParser class >> cacheId [
	^'2018-03-19T12:40:31.430637-05:00'
]

{ #category : #generated }
GstParser class >> definitionComment [
"%glr;
%prefix Gst;
%suffix Node;
%root Program;
%start Sequence Statement;
%id <bar> <binary>;
%hierarchy Value (
	Assignment
	Block
	Cascade
	Literal
	MessageSend
	Variable
);
%hierarchy Literal (StringLiteral NumberLiteral CharacterLiteral SymbolLiteral ArrayLiteral BooleanLiteral NilLiteral);
%hierarchy ArrayLiteral (ByteArrayLiteral);
%hierarchy Message (UnaryMessage BinaryMessage KeywordMessage);
%ignore_variables leftParen rightParen leftBar rightBar leftBracket rightBracket semicolon colon period ;
<name>
	:  (<isLetter> | _ ) ( <isLetter> | _ | <isDigit> ) *
	;
<keyword>
	: <name> \:
	;
<bar>
	: \|
	;
<binary>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,] +
	;
<string>
	: ( \' [^\']* \' )+
	;
<symbol>
	: \# ( <name> | <binary> | <keyword>+ | <string> )
	;
<character>
	: \$ .
	;
<comment>
	: \"" [^\""]* \""
	;
<whitespace>
	: \s+
	;
<float>
	: \-? \d+ \. \d+ ([deq] [\+\-]? \d+)?
	| \-? \d+ [deq] [\+\-]? \d+
	;
<integer>
	: \-? (
		  \d+
		| 2r[0-1]+
		| 3r[0-2]+
		| 4r[0-3]+
		| 5r[0-4]+
		| 6r[0-5]+
		| 7r[0-6]+
		| 8r[0-7]+
		| 9r[0-8]+
		| 10r[0-9]+
		| 11r[0-9A]+
		| 12r[0-9A-B]+
		| 13r[0-9A-C]+
		| 14r[0-9A-D]+
		| 15r[0-9A-E]+
		| 16r[0-9A-F]+
		| 17r[0-9A-G]+
		| 18r[0-9A-H]+
		| 19r[0-9A-I]+
		| 20r[0-9A-J]+
		| 21r[0-9A-K]+
		| 22r[0-9A-L]+
		| 23r[0-9A-M]+
		| 24r[0-9A-N]+
		| 25r[0-9A-O]+
		| 26r[0-9A-P]+
		| 27r[0-9A-Q]+
		| 28r[0-9A-R]+
		| 29r[0-9A-S]+
		| 30r[0-9A-T]+
		| 31r[0-9A-U]+
		| 32r[0-9A-V]+
		| 33r[0-9A-W]+
		| 34r[0-9A-X]+
		| 35r[0-9A-Y]+
		| 36r[0-9A-Z]+
		)
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;
Method
	: MethodPattern Sequence 'body' {{}}
	;
MethodPattern
	: <name> 'selectorPart'
	| ""true"" 'selectorPart'
	| ""false"" 'selectorPart'
	| ""nil"" 'selectorPart'
	| <binary> 'selectorPart' Variable 'variable'
	| KeywordPattern
	;
KeywordPattern
	: <keyword> 'selectorPart' Variable 'variable'
	| KeywordPattern <keyword> 'selectorPart' Variable 'variable'
	;
Sequence
	: Temporaries Statements {{}}
	;
Temporaries
	: 
	| <bar> 'leftBar' Variables <bar> 'rightBar'
	;
Variables
	: 
	| Variables Variable 'variable'
	;
Statements
	: 
	| StatementList
	| StatementList ""."" 'period'
	;
StatementList
	: Statement 'statement'
	| StatementList ""."" 'period' Statement 'statement'
	;
Statement
	: ""^"" 'upArrow' Assignment 'value' {{Return}}
	| Assignment
	;
Assignment
	: Variable 'variable' "":="" 'assignmentToken' Assignment 'value' {{}}
	| Cascade
	;
Cascade
	: KeywordMessageSendVars CascadedMessages {{}}
	| BinaryMessageSendVars CascadedMessages {{}}
	| UnaryMessageSendVars CascadedMessages {{}}
	| KeywordMessageSend
	;
CascadedMessages
	: "";"" 'semicolon' CascadedMessage 'message'
	| "";"" 'semicolon' CascadedMessage 'message' CascadedMessages
	;
CascadedMessage
	: KeywordMessage
	| BinaryMessage
	| UnaryMessage
	;
KeywordMessageSend
	: KeywordMessageSendVars {{MessageSend}}
	| BinaryMessageSend
	;
KeywordMessageSendVars
	: BinaryMessageSend 'receiver' KeywordMessage 'message' 
	;
KeywordMessage
	: <keyword> 'selectorPart' BinaryMessageSend 'value' {{}}
	| KeywordMessage <keyword> 'selectorPart' BinaryMessageSend 'value' {{}}
	;
BinaryMessageSend
	: BinaryMessageSendVars {{MessageSend}}
	| UnaryMessageSend
	;
BinaryMessageSendVars
	: BinaryMessageSend 'receiver' BinaryMessage 'message' 
	;
BinaryMessage
	: <binary> 'selectorPart' UnaryMessageSend 'value' {{}}
	;
UnaryMessageSend
	: UnaryMessageSendVars {{MessageSend}}
	| Value
	;
UnaryMessageSendVars
	: UnaryMessageSend 'receiver' UnaryMessage 'message' 
	;
UnaryMessage
	: <name> 'selectorPart' {{}}
	;
Variable
	: <name> 'name' {{}}
	;
Value
	: Variable
	| Literal
	| Block
	| ""("" 'leftParen' Assignment "")"" 'rightParen' {{Value}}
	;
Block
	: ""["" 'leftBracket' BlockArgs Sequence 'body' ""]"" 'rightBracket' {{}}
	;
BlockArgs
	: 
	| BlockArgList <bar> 'bar'
	;
BlockArgList
	: "":"" 'colon' Variable 'variable'
	| BlockArgList "":"" 'colon' Variable 'variable'
	;
Literal
	: StringLiteral
	| NumberLiteral
	| ArrayLiteral
	| ByteArrayLiteral
	| CharacterLiteral
	| SymbolLiteral
	| BooleanLiteral
	| NilLiteral
	;
StringLiteral
	: <string> 'value' {{}}
	;
NumberLiteral
	: <float> 'value' {{}}
	| IntegerLiteral
	;
IntegerLiteral
	: <integer> 'value' {{NumberLiteral}}
	;
ArrayLiteral
	: ""#("" 'arrayStart' ArrayLiteralItems "")"" 'arrayStop' {{}}
	;
ArrayLiteralItems
	: 
	| ArrayLiteralItems Literal 'value'
	;
ByteArrayLiteral
	: ""#["" 'arrayStart' ByteArrayLiteralItems ""]"" 'arrayStop' {{}}
	;
ByteArrayLiteralItems
	: 
	| ByteArrayLiteralItems IntegerLiteral 'value' 
	;
CharacterLiteral
	: <character> 'value' {{}}
	;
SymbolLiteral
	: <symbol> 'value' {{}}
	;
BooleanLiteral
	: ""true"" 'value' {{}}
	| ""false"" 'value' {{}}
	;
NilLiteral
	: ""nil"" 'value' {{}}
	;"
]

{ #category : #'generated-accessing' }
GstParser class >> scannerClass [
	^GstScanner
]

{ #category : #generated }
GstParser class >> startingStateForMethod [
	^ 1
]

{ #category : #generated }
GstParser class >> startingStateForSequence [
	^ 2
]

{ #category : #generated }
GstParser class >> startingStateForStatement [
	^ 3
]

{ #category : #public }
GstParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	actions isEmpty
		ifTrue:
			[ (currentToken ids includes: scanner binaryId)
				ifTrue:
					[ currentToken value = '|'
						ifTrue: [ self addActionsFor: scanner binaryId to: actions ]
						ifFalse:
							[ (#('||' '|||') includes: currentToken value)
								ifTrue:
									[ currentToken := currentToken class
										value: '|'
										start: currentToken startPosition
										ids: (Array with: scanner barId).
									self position: currentToken startPosition.
									actions := super actionsForCurrentToken ] ] ] ].
	^ actions
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForArrayLiteral1: nodes [
	| result |
	result := GstArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForAssignment1: nodes [
	| result |
	result := GstAssignmentNode new.
	result variable: (nodes at: 1).
	result assignmentToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBinaryMessage1: nodes [
	| result |
	result := GstBinaryMessageNode new.
	result selectorPart: (nodes at: 1).
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlock1: nodes [
	| result |
	result := GstBlockNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result colons.
	result addNodes: ((nodes at: 2) at: 2) to: result variables.
	result bar: ((nodes at: 2) at: 3).
	result body: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlockArgs1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlockArgs2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBooleanLiteral2: nodes [
	| result |
	result := GstBooleanLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForByteArrayLiteral1: nodes [
	| result |
	result := GstByteArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCascade1: nodes [
	| result |
	result := GstCascadeNode new.
	result receiver: ((nodes at: 1) at: 1).
	result addNode: ((nodes at: 1) at: 2) to: result messages.
	result addTokens: ((nodes at: 2) at: 1) to: result semicolons.
	result addNodes: ((nodes at: 2) at: 2) to: result messages.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCascadedMessages2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCharacterLiteral1: nodes [
	| result |
	result := GstCharacterLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessage1: nodes [
	| result |
	result := GstKeywordMessageNode new.
	result addToken: (nodes at: 1) to: result selectorParts.
	result addNode: (nodes at: 2) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessage2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result selectorParts.
	result addNode: (nodes at: 3) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessageSend1: nodes [
	| result |
	result := GstMessageSendNode new.
	result receiver: ((nodes at: 1) at: 1).
	result message: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessageSendVars1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordPattern1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordPattern2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethod1: nodes [
	| result |
	result := GstMethodNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result selectorParts.
	result addNodes: ((nodes at: 1) at: 2) to: result variables.
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethodPattern3: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethodPattern6: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForNilLiteral1: nodes [
	| result |
	result := GstNilLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForNumberLiteral1: nodes [
	| result |
	result := GstNumberLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForSequence1: nodes [
	| result |
	result := GstSequenceNode new.
	result leftBar: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result variables.
	result rightBar: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result periods.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatement1: nodes [
	| result |
	result := GstReturnNode new.
	result upArrow: (nodes at: 1).
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatementList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatements1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatements3: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStringLiteral1: nodes [
	| result |
	result := GstStringLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForSymbolLiteral1: nodes [
	| result |
	result := GstSymbolLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForTemporaries1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForTemporaries2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForUnaryMessage1: nodes [
	| result |
	result := GstUnaryMessageNode new.
	result selectorPart: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForValue4: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariable1: nodes [
	| result |
	result := GstVariableNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariables1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariables2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #generated }
GstParser >> reduceTable [
^#(
	#(32 0 #reduceActionForTemporaries1:) 
	#(29 1 #reduceActionForMethodPattern3:) 
	#(29 1 #reduceActionForMethodPattern6:) 
	#(33 0 #reduceActionForVariables1:) 
	#(34 0 #reduceActionForStatements1:) 
	#(60 0 #reduceActionForVariables1:) 
	#(62 0 #reduceActionForVariables1:) 
	#(53 0 #reduceActionForBlockArgs1:) 
	#(65 1 #reduceActionForBooleanLiteral2:) 
	#(66 1 #reduceActionForNilLiteral1:) 
	#(50 1 #reduceActionForVariable1:) 
	#(56 1 #reduceActionForStringLiteral1:) 
	#(64 1 #reduceActionForSymbolLiteral1:) 
	#(63 1 #reduceActionForCharacterLiteral1:) 
	#(57 1 #reduceActionForNumberLiteral1:) 
	#(58 1 #reduceActionForNumberLiteral1:) 
	#(36 1 #liftFirstValue:) 
	#(37 1 #liftFirstValue:) 
	#(38 1 #liftFirstValue:) 
	#(41 1 #reduceActionForKeywordMessageSend1:) 
	#(41 1 #liftFirstValue:) 
	#(44 1 #reduceActionForKeywordMessageSend1:) 
	#(44 1 #liftFirstValue:) 
	#(47 1 #reduceActionForKeywordMessageSend1:) 
	#(51 1 #liftFirstValue:) 
	#(47 1 #liftFirstValue:) 
	#(55 1 #liftFirstValue:) 
	#(57 1 #liftFirstValue:) 
	#(30 2 #reduceActionForKeywordPattern1:) 
	#(29 2 #reduceActionForKeywordPattern1:) 
	#(28 2 #reduceActionForMethod1:) 
	#(31 2 #reduceActionForSequence1:) 
	#(34 1 #reduceActionForMethodPattern6:) 
	#(35 1 #reduceActionForMethodPattern3:) 
	#(36 2 #reduceActionForStatement1:) 
	#(38 2 #reduceActionForCascade1:) 
	#(42 2 #reduceActionForKeywordMessageSendVars1:) 
	#(45 2 #reduceActionForKeywordMessageSendVars1:) 
	#(49 1 #reduceActionForUnaryMessage1:) 
	#(48 2 #reduceActionForKeywordMessageSendVars1:) 
	#(30 3 #reduceActionForKeywordPattern2:) 
	#(32 3 #reduceActionForTemporaries2:) 
	#(33 2 #reduceActionForVariables2:) 
	#(34 2 #reduceActionForStatements3:) 
	#(59 3 #reduceActionForArrayLiteral1:) 
	#(60 2 #reduceActionForVariables2:) 
	#(61 3 #reduceActionForByteArrayLiteral1:) 
	#(62 2 #reduceActionForVariables2:) 
	#(51 3 #reduceActionForValue4:) 
	#(54 2 #reduceActionForKeywordPattern1:) 
	#(53 2 #reduceActionForBlockArgs2:) 
	#(39 2 #reduceActionForKeywordPattern1:) 
	#(40 1 #liftFirstValue:) 
	#(43 2 #reduceActionForKeywordMessage1:) 
	#(46 2 #reduceActionForBinaryMessage1:) 
	#(37 3 #reduceActionForAssignment1:) 
	#(35 3 #reduceActionForStatementList2:) 
	#(52 4 #reduceActionForBlock1:) 
	#(54 3 #reduceActionForKeywordPattern2:) 
	#(39 3 #reduceActionForCascadedMessages2:) 
	#(43 3 #reduceActionForKeywordMessage2:)
	).
]

{ #category : #generated }
GstParser >> symbolNames [
	^ #('"#("' '"#["' '"("' '")"' '"."' '":"' '":="' '";"' '"["' '"]"' '"^"' '"false"' '"nil"' '"true"' '<name>' '<keyword>' '<bar>' '<binary>' '<string>' '<symbol>' '<character>' '<comment>' '<whitespace>' '<float>' '<integer>' '<patternToken>' 'B e g i n' 'Method' 'MethodPattern' 'KeywordPattern' 'Sequence' 'Temporaries' 'Variables' 'Statements' 'StatementList' 'Statement' 'Assignment' 'Cascade' 'CascadedMessages' 'CascadedMessage' 'KeywordMessageSend' 'KeywordMessageSendVars' 'KeywordMessage' 'BinaryMessageSend' 'BinaryMessageSendVars' 'BinaryMessage' 'UnaryMessageSend' 'UnaryMessageSendVars' 'UnaryMessage' 'Variable' 'Value' 'Block' 'BlockArgs' 'BlockArgList' 'Literal' 'StringLiteral' 'NumberLiteral' 'IntegerLiteral' 'ArrayLiteral' 'ArrayLiteralItems' 'ByteArrayLiteral' 'ByteArrayLiteralItems' 'CharacterLiteral' 'SymbolLiteral' 'BooleanLiteral' 'NilLiteral' 'E O F' 'error')
]

{ #category : #generated }
GstParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #GstMethodNode #GstMethodNode #OrderedCollection #OrderedCollection #GstSequenceNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #GstProgramNode #GstValueNode #GstValueNode #OrderedCollection #GstMessageNode #GstValueNode #OrderedCollection #GstKeywordMessageNode #GstValueNode #OrderedCollection #GstBinaryMessageNode #GstValueNode #OrderedCollection #GstUnaryMessageNode #GstVariableNode #GstValueNode #GstBlockNode #OrderedCollection #OrderedCollection #GstLiteralNode #GstStringLiteralNode #GstNumberLiteralNode #GstNumberLiteralNode #GstArrayLiteralNode #OrderedCollection #GstByteArrayLiteralNode #OrderedCollection #GstCharacterLiteralNode #GstSymbolLiteralNode #GstBooleanLiteralNode #GstNilLiteralNode #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
GstParser >> transitionTable [
^#(
#[1 0 17 0 12 0 21 0 13 0 25 0 14 0 29 0 15 0 33 0 16 0 37 0 18 0 41 0 28 0 45 0 29 0 49 0 30] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 9 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 0 57 0 31 0 61 0 32 0 6 0 67] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 121 0 36 0 121 0 37 0 121 0 38 0 121 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[0 0 10 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 10 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 10 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 10 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[1 0 97 0 15 0 209 0 50] 
#[1 0 97 0 15 0 213 0 50] 
#[0 0 0 0 67] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 9 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 0 217 0 31 0 61 0 32 0 6 0 67] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 14 0 9 0 14 0 11 0 14 0 12 0 14 0 13 0 14 0 14 0 14 0 15 0 221 0 16 0 14 0 17 0 14 0 19 0 14 0 20 0 14 0 21 0 14 0 24 0 14 0 25 0 14 0 67] 
#[1 0 18 0 15 0 18 0 17 0 225 0 33] 
#[0 0 0 0 67] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 22 0 10 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 229 0 34 0 233 0 35 0 237 0 36 0 237 0 37 0 237 0 38 0 237 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66 0 22 0 67] 
#[1 0 26 0 1 0 26 0 2 0 26 0 4 0 26 0 12 0 26 0 13 0 26 0 14 0 26 0 19 0 26 0 20 0 26 0 21 0 26 0 24 0 26 0 25 0 241 0 60] 
#[1 0 30 0 10 0 30 0 25 0 245 0 62] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 249 0 37 0 249 0 38 0 249 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 253 0 6 0 34 0 9 0 34 0 10 0 34 0 11 0 34 0 12 0 34 0 13 0 34 0 14 0 34 0 15 0 34 0 17 0 34 0 19 0 34 0 20 0 34 0 21 0 34 0 24 0 34 0 25 1 1 0 53 1 5 0 54] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 9 0 37 1 9 0 38 1 9 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[0 0 38 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 42 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 38 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 50 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 54 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 58 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 62 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 66 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 0 0 67] 
#[0 0 70 0 5 0 10 0 67] 
#[0 0 74 0 4 0 5 0 10 0 67] 
#[0 0 78 0 4 0 5 0 10 0 67] 
#[1 0 82 0 4 0 82 0 5 1 13 0 8 0 82 0 10 1 17 0 39 0 82 0 67] 
#[1 0 86 0 4 0 86 0 5 0 86 0 10 1 21 0 16 1 25 0 18 1 29 0 43 1 33 0 46 0 86 0 67] 
#[1 0 90 0 4 0 90 0 5 1 13 0 8 0 90 0 10 0 90 0 16 0 90 0 18 1 37 0 39 0 90 0 67] 
#[1 0 94 0 4 0 94 0 5 0 94 0 8 0 94 0 10 1 41 0 15 0 94 0 16 0 94 0 18 1 45 0 49 0 94 0 67] 
#[1 0 98 0 4 0 98 0 5 1 13 0 8 0 98 0 10 0 98 0 15 0 98 0 16 0 98 0 18 1 49 0 39 0 98 0 67] 
#[1 0 102 0 4 0 102 0 5 1 53 0 7 0 102 0 10 0 102 0 15 0 102 0 16 0 102 0 18 0 102 0 67] 
#[0 0 106 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 102 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 102 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 114 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 110 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 118 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 122 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 126 0 67] 
#[1 0 97 0 15 1 57 0 50] 
#[1 0 97 0 15 1 61 0 17 1 65 0 50] 
#[0 0 130 0 10 0 67] 
#[1 1 69 0 5 0 134 0 10 0 134 0 67] 
#[0 0 138 0 5 0 10 0 67] 
#[1 0 65 0 1 0 69 0 2 1 73 0 4 0 85 0 12 0 89 0 13 0 93 0 14 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 77 0 55 1 77 0 56 1 77 0 57 1 77 0 58 1 77 0 59 1 77 0 61 1 77 0 63 1 77 0 64 1 77 0 65 1 77 0 66] 
#[1 1 81 0 10 0 117 0 25 1 85 0 58] 
#[0 1 89 0 4] 
#[1 0 97 0 15 1 93 0 50] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 9 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 1 97 0 31 0 61 0 32] 
#[1 1 101 0 6 1 105 0 17] 
#[0 0 142 0 5 0 10 0 67] 
#[1 1 41 0 15 1 21 0 16 1 25 0 18 1 109 0 40 1 113 0 43 1 109 0 46 1 109 0 49] 
#[0 0 146 0 4 0 5 0 10 0 67] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 125 0 44 1 129 0 45 0 149 0 47 1 133 0 48 0 149 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 141 0 47 1 133 0 48 1 141 0 50 1 141 0 51 1 141 0 52 1 141 0 55 1 141 0 56 1 141 0 57 1 141 0 58 1 141 0 59 1 141 0 61 1 141 0 63 1 141 0 64 1 141 0 65 1 141 0 66] 
#[1 0 150 0 4 0 150 0 5 0 150 0 8 0 150 0 10 1 145 0 16 0 150 0 67] 
#[0 0 154 0 4 0 5 0 8 0 10 0 16 0 18 0 67] 
#[0 0 146 0 4 0 5 0 10 0 67] 
#[0 0 158 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 162 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 146 0 4 0 5 0 10 0 67] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 149 0 37 1 149 0 38 1 149 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[0 0 166 0 1 0 2 0 3 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 170 0 1 0 2 0 3 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 174 0 15 0 17] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 178 0 10 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 153 0 36 1 153 0 37 1 153 0 38 1 153 0 41 0 137 0 42 0 141 0 44 0 145 0 45 0 149 0 47 0 153 0 48 0 157 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66 0 178 0 67] 
#[0 0 182 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 186 0 1 0 2 0 4 0 12 0 13 0 14 0 19 0 20 0 21 0 24 0 25] 
#[0 0 190 0 1 0 2 0 4 0 5 0 8 0 10 0 12 0 13 0 14 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 67] 
#[0 0 194 0 10 0 25] 
#[0 0 198 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 202 0 6 0 17] 
#[0 1 157 0 10] 
#[1 0 97 0 15 1 161 0 50] 
#[0 0 206 0 1 0 2 0 3 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25] 
#[1 0 210 0 4 0 210 0 5 1 13 0 8 0 210 0 10 1 165 0 39 0 210 0 67] 
#[1 0 214 0 4 0 214 0 5 0 214 0 8 0 214 0 10 1 145 0 16 0 214 0 67] 
#[0 0 214 0 4 0 5 0 8 0 10 0 67] 
#[0 0 214 0 4 0 5 0 8 0 10 0 67] 
#[1 0 218 0 4 0 218 0 5 0 218 0 8 0 218 0 10 0 218 0 16 1 25 0 18 1 33 0 46 0 218 0 67] 
#[0 0 90 0 4 0 5 0 8 0 10 0 16 0 18 0 67] 
#[0 0 98 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 102 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[1 0 222 0 4 0 222 0 5 0 222 0 8 0 222 0 10 1 41 0 15 0 222 0 16 0 222 0 18 1 45 0 49 0 222 0 67] 
#[1 0 65 0 1 0 69 0 2 0 73 0 3 0 77 0 9 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 169 0 44 1 129 0 45 0 149 0 47 1 133 0 48 0 149 0 50 0 149 0 51 0 149 0 52 0 149 0 55 0 149 0 56 0 149 0 57 0 149 0 58 0 149 0 59 0 149 0 61 0 149 0 63 0 149 0 64 0 149 0 65 0 149 0 66] 
#[0 0 226 0 4 0 5 0 10 0 67] 
#[0 0 230 0 5 0 10 0 67] 
#[0 0 234 0 4 0 5 0 8 0 10 0 15 0 16 0 18 0 67] 
#[0 0 238 0 6 0 17] 
#[0 0 242 0 4 0 5 0 10 0 67] 
#[1 0 246 0 4 0 246 0 5 0 246 0 8 0 246 0 10 0 246 0 16 1 25 0 18 1 33 0 46 0 246 0 67]
	).
]
