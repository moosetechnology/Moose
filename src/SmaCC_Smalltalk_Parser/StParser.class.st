Class {
	#name : #StParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_Smalltalk_Parser'
}

{ #category : #'generated-accessing' }
StParser class >> cacheId [
	^'2019-04-15T17:15:43.070416-05:00'
]

{ #category : #generated }
StParser class >> definitionComment [
"<name>
	: (<isLetter> | \_) (<isLetter> | [\d\_]) *
	;
<number>
	: \d
	;
<negativeNumber>
	: \- <number>
	;
<string>
	: \'  [^\']* \' (\' [^\']* \')*
	;
<keyword>
	: <name> \:
	;
<multikeyword>
	: <name> \: (<name> \: )+
	;
<binarySymbol>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,] [\~\!\@\%\&\*\+\=\\\|\?\/\>\<\,]?
	;
<whitespace>
	: <isSeparator>+
	;
<comment>
	: \"" [^\""]* \""
	;
<dottedName>
	: <name> (\. <name>)+
	;
<character>
	: \$ .
	;
<variableAssignment>
	: <name> \: \=
	;
<anyChar>
	:  .
	; # For VW literal arrays that handle #(;) -> #(#';')

%id <number> <negativeNumber> <name> <binarySymbol>;
%start SequenceNode ;

Method
	: <name> MethodSequenceNode 
			{(RBMethodNode 
				selector: '1' value asSymbol 
				arguments: #() 
				body: '2' last) 
					""tags: '2' first; ""
					yourself}
	| BinaryMethodName MethodSequenceNode 
			{(RBMethodNode 
				selector: '1' first 
				arguments: '1' last 
				body: '2' last) 
					""tags: '2' first; ""
					yourself}
	| KeywordMethodName MethodSequenceNode 
			{(RBMethodNode 
				selector: '1' first contents asSymbol 
				arguments: '1' last 
				body: '2' last) 
					""tags: '2' first; ""
					yourself}
	;
BinaryMethodName
	: <binarySymbol> Variable 
			{Array with: '1' value asSymbol with: (Array with: '2')}
	;
KeywordMethodName
	: <keyword> Variable 
			{| stream | 
			stream := WriteStream on: (String new: 30). 
			stream nextPutAll: '1' value. 
			Array with: stream with: (OrderedCollection with: '2')}
	| KeywordMethodName <keyword> Variable 
			{'1' first nextPutAll: '2' value. 
			'1' last add: '3'. 
			'1'}
	;
Primitives
	: 		{OrderedCollection new}
	| Primitives ""<"" PrimitiveMessageSend "">"" 
			{'1' 
				add: ('2' startPosition to: '4' startPosition); 
				yourself}
	;
PrimitiveMessageSend
	:
	| PrimitiveMessageSend <keyword> 
			{nil}
	| PrimitiveMessageSend Literal 
			{nil}
	| PrimitiveMessageSend ""("" 
			{nil}
	| PrimitiveMessageSend "")"" 
			{nil}
	| PrimitiveMessageSend ""{"" 
			{nil}
	| PrimitiveMessageSend ""}"" 
			{nil}
	| PrimitiveMessageSend "";"" 
			{nil}
	| PrimitiveMessageSend ""."" 
			{nil}
	| PrimitiveMessageSend <name> 
			{nil}
	| PrimitiveMessageSend <binarySymbol> 
			{nil}
	;
MethodSequenceNode
	: Primitives ""|"" TemporaryVariables ""|"" Primitives Statements 
			{Array with: ('1' addAll: '5'; yourself) with: (RBSequenceNode temporaries: '3' statements: '6')}
	| Primitives ""||"" Primitives Statements 
			{Array with: ('1' addAll: '3'; yourself) with: (RBSequenceNode temporaries: #() statements: '4')}
	| Primitives Statements 
			{Array with: '1' with: (RBSequenceNode temporaries: #() statements: '2')}
	;
SequenceNode
	: Temporaries Statements 
			{RBSequenceNode temporaries: '1' statements: '2'}
	;
Temporaries
	: 		{#()}
	| ""||""
			{#()}
	| ""|"" TemporaryVariables ""|"" 
			{'2'}
	;
TemporaryVariables
	: 		{OrderedCollection new}
	| TemporaryVariables Variable 
			{'1' 
				add: '2'; 
				yourself}
	;
Statements
	: 		{OrderedCollection new}
	| StatementList OptionalPeriod
			{#liftFirstValue:}
	| StatementList ""."" ""^"" Expression OptionalPeriod
			{'1' 
				add: (RBReturnNode value: '4'); 
				yourself}
	| ""^"" Expression OptionalPeriod
			{OrderedCollection with: (RBReturnNode value: '2')}
	;
OptionalPeriod
	: 
	| "".""
	;
StatementList
	: Expression
	| StatementList ""."" Expression 
			{'1' 
				add: '3'; 
				yourself}
	;
Block
	: ""["" BlockArgs ""|"" SequenceNode ""]"" 
			{RBBlockNode arguments: '2' body: '4'}
	| ""["" SequenceNode ""]"" 
			{RBBlockNode body: '2'}
	| ""["" BlockArgs ""]"" 
			{RBBlockNode arguments: '2' body: (RBSequenceNode statements: #())}
	| ""["" BlockArgs ""||"" TemporaryVariables ""|"" Statements ""]"" 
			{RBBlockNode arguments: '2' body: (RBSequenceNode temporaries: '4' statements: '6')}
	;
BlockArgs
	: "":"" Variable 
			{OrderedCollection with: '2'}
	| BlockArgs "":"" Variable 
			{'1' 
				add: '3'; 
				yourself}
	;
Expression
	: Variable "":="" Expression 
			{RBAssignmentNode variable: '1' value: '3'}
	| Cascade 
			{#liftFirstValue:}
	;
Cascade
	: MessageSend CascadeList 
			{| messages |
			'2' isEmpty ifTrue: [^'1'].
			messages := OrderedCollection new: '2' size + 1.
			messages add: '1'.
			'2' do: [:each | messages add: (RBMessageNode receiver: '1' receiver selector: each first contents asSymbol arguments: each last)].
			RBCascadeNode messages: messages}
	| Primary 
			{#liftFirstValue:}
	;
MessageSend
	: KeywordMessageSend 
			{#liftFirstValue:}
	| BinaryMessageSend 
			{#liftFirstValue:}
	| UnaryMessageSend 
			{#liftFirstValue:}
	;
CascadeList
	: 		{OrderedCollection new}
	| CascadeList "";"" SimpleMessage 
			{'1' 
				add: '3'; 
				yourself}
	;
SimpleMessage
	: UnaryMessage 
			{#liftFirstValue:}
	| BinaryMessage 
			{#liftFirstValue:}
	| KeywordMessage 
			{#liftFirstValue:}
	;
KeywordMessageSend
	: BinaryMessageSend KeywordMessage 
			{#createMessageNodeFrom:}
	| UnaryMessageSend KeywordMessage 
			{#createMessageNodeFrom:}
	| Primary KeywordMessage 
			{#createMessageNodeFrom:}
	;
KeywordMessage
	: <keyword> KeywordArgument 
			{| stream | 
			stream := WriteStream on: (String new: 30). 
			stream nextPutAll: '1' value. 
			Array with: stream with: (OrderedCollection with: '2')}
	| KeywordMessage <keyword> KeywordArgument 
			{'1' first nextPutAll: '2' value. 
			'1' last add: '3'. 
			'1'}
	;
KeywordArgument
	: BinaryMessageSend 
			{#liftFirstValue:}
	| UnaryMessageSend 
			{#liftFirstValue:}
	| Primary 
			{#liftFirstValue:}
	;
BinaryMessageSend
	: BinaryMessageSend BinaryMessage 
			{#createMessageNodeFrom:}
	| UnaryMessageSend BinaryMessage 
			{#createMessageNodeFrom:}
	| Primary BinaryMessage 
			{#createMessageNodeFrom:} 
	;
BinaryMessage 
	: <binarySymbol> BinaryArgument 
			{Array with: (ReadStream on: '1' value) with: (Array with: '2')}
	;
BinaryArgument
	: UnaryMessageSend 
			{#liftFirstValue:}
	| Primary 
			{#liftFirstValue:}
	;
UnaryMessageSend 
	: UnaryMessageSend UnaryMessage 
			{#createMessageNodeFrom:}
	| Primary UnaryMessage 
			{#createMessageNodeFrom:}
	;
UnaryMessage 
	: <name> 
			{Array with: (ReadStream on: '1' value) with: #()}
	;
Primary
	: ""("" Expression "")"" 
			{#liftSecondValue:}
	| Literal 
			{RBLiteralNode value: '1'}
	| Variable 
			{#liftFirstValue:}
	| Block 
			{#liftFirstValue:}
	;
Variable
	: <name> 
			{RBVariableNode named: '1' value}
	| <dottedName> 
			{RBVariableNode named: '1' value}
	;
Literal
	: ""true"" 
			{true}
	| ""false"" 
			{false}
	| ""nil"" 
			{nil}
	| <number> 
			{'1' value}
	| <negativeNumber> 
			{'1' value}
	| <character> 
			{'1' value at: 2}
	| <string> 
			{('1' value copyFrom: 2 to: '1' value size - 1) copyReplaceAll: '''''' with: ''''}
	|  ""#"" <string> 
			{(('2' value copyFrom: 2 to: '2' value size - 1) copyReplaceAll: '''''' with: '''') asSymbol}
	| ""#"" <name> 
			{'2' value asSymbol}
	| ""#"" <binarySymbol> 
			{'2' value asSymbol}
	| ""#"" <keyword> 
			{'2' value asSymbol}
	| ""#"" <multikeyword> 
			{'2' value asSymbol}
	| ""#"" ""["" ByteArray ""]"" 
			{'3' contents}
	| ""#"" ""("" Array "")"" 
			{'3' contents}
	| ""#"" ""{"" <name> ""}"" 
			{'3' value asQualifiedReference}
	| ""#"" ""{"" <dottedName> ""}"" 
			{'3' value asQualifiedReference}
	;
ByteArray
	: 		{WriteStream on: ByteArray new}
	| ByteArray <number> 
			{'1' 
				nextPut: '2' value; 
				yourself}
	;
Array
	: 		{WriteStream on: Array new}
	| Array ArrayLiteral 
			{'1' 
				nextPut: '2'; 
				yourself} 
	| Array <name> "":="" 
			{'2' stopPosition + 1 = '3' startPosition 
				ifTrue: ['1' nextPut: ('2' value, ':') asSymbol] 
				ifFalse: ['1' nextPut: '2' value asSymbol; nextPut: #':']. 
			self position: '3' startPosition. 
			currentToken := nil. 
			'1'}
	;
ArrayLiteral
	: Literal 
			{#liftFirstValue:}
	| <name> 
			{'1' value asSymbol}
	| <binarySymbol> 
			{'1' value asSymbol}
	| <keyword> 
			{'1' value asSymbol}
	| <multikeyword> 
			{'1' value asSymbol}
	| ""{"" <name> ""}"" 
			{'2' value asQualifiedReference}
	| ""{"" <dottedName> ""}"" 
			{'2' value asQualifiedReference}
	| ""("" Array "")"" 
			{'2' contents}
	| ""["" ByteArray ""]"" 
			{'2' contents}
	| <anyChar> 
			{'1' value asSymbol}
	| <dottedName> 
			{'1' value}
	;"
]

{ #category : #'file types' }
StParser class >> fileExtension [
	^ '.st'
]

{ #category : #'file types' }
StParser class >> fileExtensionType [
	^ 'Smalltalk source'
]

{ #category : #accessing }
StParser class >> parseExpression: aString [
	^ self
		simplifyExpression:
			(self parse: aString startingAt: self startingStateForSequenceNode)
]

{ #category : #accessing }
StParser class >> parseExpression: aString onError: aBlock [
	^ self
		simplifyExpression:
			(self
				parse: aString
				startingAt: self startingStateForSequenceNode
				onError: aBlock)
]

{ #category : #accessing }
StParser class >> parseMethod: aString [
	^ self parse: aString startingAt: self startingStateForMethod
]

{ #category : #accessing }
StParser class >> parseMethod: aString onError: aBlock [
	^ self
		parse: aString
		startingAt: self startingStateForMethod
		onError: aBlock
]

{ #category : #generated }
StParser class >> reduceTable [
^#(
	#(41 0 #reduceActionForTemporaries1: 2767873 false ) 
	#(37 0 #reduceActionForPrimitives1: 1617921 false ) 
	#(42 0 #reduceActionForPrimitives1: 2852865 false ) 
	#(41 1 #reduceActionForTemporaries1: 2767874 false ) 
	#(43 0 #reduceActionForPrimitives1: 2976769 false ) 
	#(34 2 #reduceActionForMethod1: 643073 false ) 
	#(62 1 #reduceActionForVariable1: 6361089 false ) 
	#(62 1 #reduceActionForVariable1: 6361090 false ) 
	#(36 2 #reduceActionForKeywordMethodName1: 1299457 false ) 
	#(35 2 #reduceActionForBinaryMethodName1: 1188865 false ) 
	#(34 2 #reduceActionForMethod2: 643074 false ) 
	#(34 2 #reduceActionForMethod3: 643075 false ) 
	#(63 1 #reduceActionForLiteral2: 6477826 false ) 
	#(63 1 #nil 6477827 false ) 
	#(63 1 #reduceActionForLiteral1: 6477825 false ) 
	#(63 1 #reduceActionForLiteral4: 6477828 false ) 
	#(63 1 #reduceActionForLiteral4: 6477829 false ) 
	#(63 1 #reduceActionForLiteral7: 6477831 false ) 
	#(63 1 #reduceActionForLiteral6: 6477830 false ) 
	#(40 2 #reduceActionForSequenceNode1: 2669569 false ) 
	#(44 0 #reduceFor: 3279873 false ) 
	#(61 1 #liftFirstValue: 6191108 false ) 
	#(45 1 #reduceFor: 3309569 false ) 
	#(48 1 #liftFirstValue: 3938306 false ) 
	#(51 0 #reduceActionForPrimitives1: 4591617 false ) 
	#(50 1 #liftFirstValue: 4441089 false ) 
	#(50 1 #liftFirstValue: 4441090 false ) 
	#(50 1 #liftFirstValue: 4441091 false ) 
	#(49 1 #liftFirstValue: 4065282 false ) 
	#(61 1 #liftFirstValue: 6191107 false ) 
	#(61 1 #reduceActionForPrimary2: 6191106 false ) 
	#(38 0 #reduceFor: 1784833 false ) 
	#(39 2 #reduceActionForMethodSequenceNode3: 2226179 false ) 
	#(36 3 #reduceActionForKeywordMethodName2: 1299458 false ) 
	#(41 3 #liftSecondValue: 2767875 false ) 
	#(42 2 #reduceActionForTemporaryVariables2: 2852866 false ) 
	#(65 0 #reduceActionForArray1: 7392257 false ) 
	#(64 0 #reduceActionForByteArray1: 7268353 false ) 
	#(63 2 #reduceActionForLiteral9: 6477833 false ) 
	#(63 2 #reduceActionForLiteral8: 6477832 false ) 
	#(63 2 #reduceActionForLiteral9: 6477835 false ) 
	#(63 2 #reduceActionForLiteral9: 6477836 false ) 
	#(63 2 #reduceActionForLiteral9: 6477834 false ) 
	#(44 1 #reduceFor: 3279874 false ) 
	#(43 2 #liftFirstValue: 2976770 false ) 
	#(49 2 #reduceActionForCascade1: 4065281 false ) 
	#(53 2 #createMessageNodeFrom: 4850689 false ) 
	#(56 2 #createMessageNodeFrom: 5534721 false ) 
	#(60 1 #reduceActionForUnaryMessage1: 6107137 false ) 
	#(53 2 #createMessageNodeFrom: 4850690 false ) 
	#(56 2 #createMessageNodeFrom: 5534722 false ) 
	#(59 2 #createMessageNodeFrom: 5965825 false ) 
	#(53 2 #createMessageNodeFrom: 4850691 false ) 
	#(56 2 #createMessageNodeFrom: 5534723 false ) 
	#(59 2 #createMessageNodeFrom: 5965826 false ) 
	#(61 3 #liftSecondValue: 6191105 false ) 
	#(47 2 #reduceActionForBlockArgs1: 3807233 false ) 
	#(46 3 #reduceActionForBlock2: 3414018 false ) 
	#(46 3 #reduceActionForBlock3: 3414019 false ) 
	#(43 3 #reduceActionForStatements4: 2976772 false ) 
	#(45 3 #reduceActionForStatementList2: 3309570 false ) 
	#(54 2 #reduceActionForKeywordMethodName1: 5064705 false ) 
	#(55 1 #liftFirstValue: 5391361 false ) 
	#(55 1 #liftFirstValue: 5391362 false ) 
	#(55 1 #liftFirstValue: 5391363 false ) 
	#(57 2 #reduceActionForBinaryMessage1: 5745665 false ) 
	#(58 1 #liftFirstValue: 5868545 false ) 
	#(58 1 #liftFirstValue: 5868546 false ) 
	#(48 3 #reduceActionForExpression1: 3938305 false ) 
	#(38 2 #nil 1784836 false ) 
	#(38 2 #nil 1784837 false ) 
	#(38 2 #nil 1784841 false ) 
	#(38 2 #nil 1784840 false ) 
	#(37 4 #reduceActionForPrimitives2: 1617922 false ) 
	#(38 2 #nil 1784838 false ) 
	#(38 2 #nil 1784839 false ) 
	#(38 2 #nil 1784842 false ) 
	#(38 2 #nil 1784834 false ) 
	#(38 2 #nil 1784843 false ) 
	#(38 2 #nil 1784835 false ) 
	#(39 4 #reduceActionForMethodSequenceNode2: 2226178 false ) 
	#(63 4 #reduceActionForLiteral14: 6477838 false ) 
	#(66 1 #reduceActionForArrayLiteral2: 7766018 false ) 
	#(66 1 #reduceActionForArrayLiteral2: 7766020 false ) 
	#(66 1 #reduceActionForArrayLiteral2: 7766021 false ) 
	#(66 1 #reduceActionForArrayLiteral2: 7766019 false ) 
	#(66 1 #reduceActionForLiteral4: 7766027 false ) 
	#(66 1 #reduceActionForArrayLiteral2: 7766026 false ) 
	#(66 1 #liftFirstValue: 7766017 false ) 
	#(65 2 #reduceActionForArray2: 7392258 false ) 
	#(63 4 #reduceActionForLiteral14: 6477837 false ) 
	#(64 2 #reduceActionForByteArray2: 7268354 false ) 
	#(63 4 #reduceActionForLiteral15: 6477839 false ) 
	#(63 4 #reduceActionForLiteral15: 6477840 false ) 
	#(47 3 #reduceActionForStatementList2: 3807234 false ) 
	#(51 3 #reduceActionForStatementList2: 4591618 false ) 
	#(52 1 #liftFirstValue: 4710403 false ) 
	#(52 1 #liftFirstValue: 4710402 false ) 
	#(52 1 #liftFirstValue: 4710401 false ) 
	#(54 3 #reduceActionForKeywordMethodName2: 5064706 false ) 
	#(65 3 #reduceActionForArray3: 7392259 false ) 
	#(46 5 #reduceActionForBlock1: 3414017 false ) 
	#(43 5 #reduceActionForStatements3: 2976771 false ) 
	#(39 6 #reduceActionForMethodSequenceNode1: 2226177 false ) 
	#(66 3 #reduceActionForArrayLiteral8: 7766024 false ) 
	#(66 3 #reduceActionForArrayLiteral8: 7766025 false ) 
	#(66 3 #reduceActionForArrayLiteral6: 7766022 false ) 
	#(66 3 #reduceActionForArrayLiteral6: 7766023 false ) 
	#(46 7 #reduceActionForBlock4: 3414020 false )
	).
]

{ #category : #'generated-accessing' }
StParser class >> scannerClass [
	^StScanner
]

{ #category : #private }
StParser class >> simplifyExpression: aSequenceNode [
	^ (aSequenceNode statements size == 1
		and: [ aSequenceNode temporaries isEmpty ])
		ifTrue: [ aSequenceNode statements first ]
		ifFalse: [ aSequenceNode ]
]

{ #category : #generated }
StParser class >> startingStateForMethod [
	^ 1
]

{ #category : #generated }
StParser class >> startingStateForSequenceNode [
	^ 2
]

{ #category : #generated }
StParser class >> symbolNames [
	^ #('"#"' '"("' '")"' '"."' '":"' '":="' '";"' '"<"' '">"' '"["' '"]"' '"^"' '"false"' '"nil"' '"true"' '"{"' '"|"' '"||"' '"}"' '<name>' '<number>' '<negativeNumber>' '<string>' '<keyword>' '<multikeyword>' '<binarySymbol>' '<whitespace>' '<comment>' '<dottedName>' '<character>' '<variableAssignment>' '<anyChar>' 'B e g i n' 'Method' 'BinaryMethodName' 'KeywordMethodName' 'Primitives' 'PrimitiveMessageSend' 'MethodSequenceNode' 'SequenceNode' 'Temporaries' 'TemporaryVariables' 'Statements' 'OptionalPeriod' 'StatementList' 'Block' 'BlockArgs' 'Expression' 'Cascade' 'MessageSend' 'CascadeList' 'SimpleMessage' 'KeywordMessageSend' 'KeywordMessage' 'KeywordArgument' 'BinaryMessageSend' 'BinaryMessage' 'BinaryArgument' 'UnaryMessageSend' 'UnaryMessage' 'Primary' 'Variable' 'Literal' 'ByteArray' 'Array' 'ArrayLiteral' 'E O F' 'error')
]

{ #category : #generated }
StParser class >> transitionTable [
^#(
#[1 0 13 0 20 0 17 0 24 0 21 0 26 0 25 0 34 0 29 0 35 0 33 0 36] 
#[1 0 6 0 1 0 6 0 2 0 6 0 10 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 37 0 17 0 41 0 18 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 29 0 6 0 30 0 45 0 40 0 49 0 41 0 6 0 67] 
#[1 0 10 0 1 0 10 0 2 0 10 0 8 0 10 0 10 0 10 0 12 0 10 0 13 0 10 0 14 0 10 0 15 0 10 0 17 0 10 0 18 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 29 0 10 0 30 0 53 0 37 0 57 0 39 0 10 0 67] 
#[1 0 61 0 20 0 65 0 29 0 69 0 62] 
#[1 0 61 0 20 0 65 0 29 0 73 0 62] 
#[0 0 0 0 67] 
#[1 0 10 0 1 0 10 0 2 0 10 0 8 0 10 0 10 0 10 0 12 0 10 0 13 0 10 0 14 0 10 0 15 0 10 0 17 0 10 0 18 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 29 0 10 0 30 0 53 0 37 0 77 0 39 0 10 0 67] 
#[1 0 10 0 1 0 10 0 2 0 10 0 8 0 10 0 10 0 10 0 12 0 10 0 13 0 10 0 14 0 10 0 15 0 10 0 17 0 10 0 18 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 81 0 24 0 10 0 29 0 10 0 30 0 53 0 37 0 85 0 39 0 10 0 67] 
#[1 0 14 0 17 0 14 0 20 0 14 0 29 0 89 0 42] 
#[0 0 18 0 1 0 2 0 10 0 11 0 12 0 13 0 14 0 15 0 20 0 21 0 22 0 23 0 29 0 30 0 67] 
#[0 0 0 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 22 0 11 0 105 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 137 0 43 0 141 0 45 0 173 0 46 0 149 0 48 0 149 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63 0 22 0 67] 
#[1 0 93 0 1 0 97 0 2 0 185 0 8 0 101 0 10 0 105 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 189 0 17 0 193 0 18 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 197 0 43 0 141 0 45 0 173 0 46 0 149 0 48 0 149 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63 0 22 0 67] 
#[0 0 26 0 67] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 26 0 29 0 30 0 67] 
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 26 0 29 0 30 0 67] 
#[0 0 38 0 1 0 2 0 8 0 10 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 29 0 30 0 67] 
#[0 0 42 0 1 0 2 0 8 0 10 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 29 0 30 0 67] 
#[0 0 46 0 67] 
#[1 0 61 0 20 0 65 0 29 0 201 0 62] 
#[0 0 50 0 67] 
#[1 0 205 0 17 0 61 0 20 0 65 0 29 0 209 0 62] 
#[1 0 213 0 2 0 217 0 10 0 221 0 16 0 225 0 20 0 229 0 23 0 233 0 24 0 237 0 25 0 241 0 26] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 173 0 46 0 245 0 48 0 245 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63] 
#[1 0 6 0 1 0 6 0 2 0 249 0 5 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 37 0 17 0 41 0 18 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 29 0 6 0 30 0 253 0 40 0 49 0 41 1 1 0 47] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 173 0 46 1 5 0 48 1 5 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63] 
#[0 0 54 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 58 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 62 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 66 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 70 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 74 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 78 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 82 0 11 0 67] 
#[1 1 9 0 4 0 86 0 11 1 13 0 44 0 86 0 67] 
#[0 0 90 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[0 0 94 0 4 0 11 0 67] 
#[0 0 98 0 3 0 4 0 11 0 67] 
#[1 0 102 0 3 0 102 0 4 0 102 0 7 0 102 0 11 1 17 0 51 0 102 0 67] 
#[0 0 106 0 3 0 4 0 7 0 11 0 67] 
#[1 0 110 0 3 0 110 0 4 0 110 0 7 0 110 0 11 1 21 0 24 1 25 0 26 1 29 0 54 1 33 0 57 0 110 0 67] 
#[1 0 114 0 3 0 114 0 4 0 114 0 7 0 114 0 11 1 37 0 20 1 21 0 24 1 25 0 26 1 41 0 54 1 45 0 57 1 49 0 60 0 114 0 67] 
#[1 0 118 0 3 0 118 0 4 0 118 0 11 1 37 0 20 1 21 0 24 1 25 0 26 1 53 0 54 1 57 0 57 1 61 0 60 0 118 0 67] 
#[1 0 122 0 3 0 122 0 4 1 65 0 6 0 122 0 11 0 122 0 20 0 122 0 24 0 122 0 26 0 122 0 67] 
#[0 0 126 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 130 0 1 0 130 0 2 0 130 0 3 0 130 0 4 0 130 0 7 0 130 0 9 0 130 0 13 0 130 0 14 0 130 0 15 0 130 0 16 0 130 0 19 0 130 0 20 0 130 0 21 0 130 0 22 0 130 0 23 0 130 0 24 0 130 0 26 0 130 0 30 1 69 0 38] 
#[1 0 14 0 17 0 14 0 20 0 14 0 29 1 73 0 42] 
#[1 0 10 0 1 0 10 0 2 0 10 0 8 0 10 0 10 0 10 0 12 0 10 0 13 0 10 0 14 0 10 0 15 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 29 0 10 0 30 1 77 0 37 0 10 0 67] 
#[0 0 134 0 67] 
#[0 0 138 0 1 0 2 0 8 0 10 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 29 0 30 0 67] 
#[0 0 142 0 1 0 2 0 10 0 11 0 12 0 13 0 14 0 15 0 20 0 21 0 22 0 23 0 29 0 30 0 67] 
#[0 0 146 0 17 0 20 0 29] 
#[1 0 150 0 1 0 150 0 2 0 150 0 3 0 150 0 10 0 150 0 13 0 150 0 14 0 150 0 15 0 150 0 16 0 150 0 20 0 150 0 21 0 150 0 22 0 150 0 23 0 150 0 24 0 150 0 25 0 150 0 26 0 150 0 29 0 150 0 30 0 150 0 32 1 81 0 65] 
#[1 0 154 0 11 0 154 0 21 1 85 0 64] 
#[1 1 89 0 20 1 93 0 29] 
#[0 0 158 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 162 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 166 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 170 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 0 174 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 1 97 0 3] 
#[1 0 61 0 20 0 65 0 29 1 101 0 62] 
#[0 1 105 0 11] 
#[1 1 109 0 5 1 113 0 11 1 117 0 17 1 121 0 18] 
#[1 1 125 0 4 0 86 0 11 1 129 0 44 0 86 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 178 0 11 1 133 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 173 0 46 1 137 0 48 1 137 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63 0 178 0 67] 
#[0 0 182 0 11 0 67] 
#[1 0 186 0 3 0 186 0 4 1 141 0 7 0 186 0 11 0 186 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 157 0 46 1 145 0 55 1 149 0 56 1 153 0 59 1 157 0 61 1 157 0 62 0 181 0 63] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 173 0 46 1 165 0 58 1 169 0 59 1 173 0 61 1 173 0 62 0 181 0 63] 
#[1 0 190 0 3 0 190 0 4 0 190 0 7 0 190 0 11 1 177 0 24 0 190 0 67] 
#[0 0 194 0 3 0 4 0 7 0 11 0 24 0 26 0 67] 
#[0 0 198 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 202 0 3 0 202 0 4 0 202 0 7 0 202 0 11 1 177 0 24 0 202 0 67] 
#[0 0 206 0 3 0 4 0 7 0 11 0 24 0 26 0 67] 
#[0 0 210 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 214 0 3 0 214 0 4 0 214 0 7 0 214 0 11 1 177 0 24 0 214 0 67] 
#[0 0 218 0 3 0 4 0 7 0 11 0 24 0 26 0 67] 
#[0 0 222 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 173 0 46 1 181 0 48 1 181 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63] 
#[1 0 93 0 1 1 185 0 2 1 189 0 3 1 193 0 4 1 197 0 7 1 201 0 9 0 109 0 13 0 113 0 14 0 117 0 15 1 205 0 16 1 209 0 19 1 213 0 20 0 121 0 21 0 125 0 22 0 129 0 23 1 217 0 24 1 221 0 26 0 133 0 30 1 225 0 63] 
#[1 1 229 0 17 0 61 0 20 0 65 0 29 0 209 0 62] 
#[1 0 93 0 1 0 97 0 2 0 185 0 8 0 101 0 10 0 105 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 233 0 43 0 141 0 45 0 173 0 46 0 149 0 48 0 149 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63 0 22 0 67] 
#[1 0 93 0 1 1 237 0 2 1 241 0 3 1 245 0 10 0 109 0 13 0 113 0 14 0 117 0 15 1 249 0 16 1 253 0 20 0 121 0 21 0 125 0 22 0 129 0 23 2 1 0 24 2 5 0 25 2 9 0 26 2 13 0 29 0 133 0 30 2 17 0 32 2 25 0 63 2 25 0 66] 
#[1 2 29 0 11 2 33 0 21] 
#[0 2 37 0 19] 
#[0 2 41 0 19] 
#[0 0 226 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[0 0 230 0 5 0 11 0 17 0 18] 
#[0 0 234 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 61 0 20 0 65 0 29 2 45 0 62] 
#[0 0 238 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 6 0 1 0 6 0 2 0 6 0 10 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 37 0 17 0 41 0 18 0 6 0 20 0 6 0 21 0 6 0 22 0 6 0 23 0 6 0 29 0 6 0 30 2 49 0 40 0 49 0 41] 
#[1 0 14 0 17 0 14 0 20 0 14 0 29 2 53 0 42] 
#[0 0 178 0 11 0 67] 
#[0 0 242 0 11 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 0 173 0 46 2 57 0 48 2 57 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63] 
#[0 0 246 0 4 0 11 0 67] 
#[1 1 37 0 20 1 21 0 24 1 25 0 26 2 61 0 52 2 65 0 54 2 61 0 57 2 61 0 60] 
#[0 0 250 0 3 0 4 0 7 0 11 0 24 0 67] 
#[1 0 254 0 3 0 254 0 4 0 254 0 7 0 254 0 11 0 254 0 24 1 25 0 26 1 33 0 57 0 254 0 67] 
#[1 1 2 0 3 1 2 0 4 1 2 0 7 1 2 0 11 1 37 0 20 1 2 0 24 1 25 0 26 1 45 0 57 1 49 0 60 1 2 0 67] 
#[1 1 6 0 3 1 6 0 4 1 6 0 7 1 6 0 11 1 37 0 20 1 6 0 24 1 25 0 26 1 57 0 57 1 61 0 60 1 6 0 67] 
#[0 0 122 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[0 1 10 0 3 0 4 0 7 0 11 0 24 0 26 0 67] 
#[1 1 14 0 3 1 14 0 4 1 14 0 7 1 14 0 11 1 37 0 20 1 14 0 24 1 14 0 26 1 49 0 60 1 14 0 67] 
#[1 1 18 0 3 1 18 0 4 1 18 0 7 1 18 0 11 1 37 0 20 1 18 0 24 1 18 0 26 1 61 0 60 1 18 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 1 157 0 46 2 77 0 55 1 149 0 56 1 153 0 59 1 157 0 61 1 157 0 62 0 181 0 63] 
#[0 1 22 0 3 0 4 0 11 0 67] 
#[0 1 26 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 30 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 34 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 38 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 42 0 1 0 2 0 8 0 10 0 12 0 13 0 14 0 15 0 17 0 18 0 20 0 21 0 22 0 23 0 29 0 30 0 67] 
#[0 1 46 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 50 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 54 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 58 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 62 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[0 1 66 0 1 0 2 0 3 0 4 0 7 0 9 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 26 0 30] 
#[1 0 10 0 1 0 10 0 2 0 10 0 8 0 10 0 10 0 10 0 12 0 10 0 13 0 10 0 14 0 10 0 15 0 10 0 20 0 10 0 21 0 10 0 22 0 10 0 23 0 10 0 29 0 10 0 30 2 81 0 37 0 10 0 67] 
#[0 1 70 0 67] 
#[1 0 150 0 1 0 150 0 2 0 150 0 3 0 150 0 10 0 150 0 13 0 150 0 14 0 150 0 15 0 150 0 16 0 150 0 20 0 150 0 21 0 150 0 22 0 150 0 23 0 150 0 24 0 150 0 25 0 150 0 26 0 150 0 29 0 150 0 30 0 150 0 32 2 85 0 65] 
#[0 1 74 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[1 0 154 0 11 0 154 0 21 2 89 0 64] 
#[1 2 93 0 20 2 97 0 29] 
#[1 1 78 0 1 1 78 0 2 1 78 0 3 2 101 0 6 1 78 0 10 1 78 0 13 1 78 0 14 1 78 0 15 1 78 0 16 1 78 0 20 1 78 0 21 1 78 0 22 1 78 0 23 1 78 0 24 1 78 0 25 1 78 0 26 1 78 0 29 1 78 0 30 1 78 0 32] 
#[0 1 82 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 86 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 90 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 94 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 98 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 102 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 106 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 110 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 1 114 0 11 0 21] 
#[0 1 118 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 1 122 0 1 0 2 0 3 0 4 0 7 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32 0 67] 
#[0 1 126 0 5 0 11 0 17 0 18] 
#[0 2 105 0 11] 
#[1 2 109 0 17 0 61 0 20 0 65 0 29 0 209 0 62] 
#[1 1 125 0 4 0 86 0 11 2 113 0 44 0 86 0 67] 
#[0 1 130 0 3 0 4 0 7 0 11 0 67] 
#[1 1 134 0 3 1 134 0 4 1 134 0 7 1 134 0 11 1 177 0 24 1 134 0 67] 
#[0 1 138 0 3 0 4 0 7 0 11 0 67] 
#[0 1 142 0 3 0 4 0 7 0 11 0 67] 
#[0 1 146 0 3 0 4 0 7 0 11 0 24 0 67] 
#[1 0 93 0 1 0 97 0 2 0 185 0 8 0 101 0 10 0 105 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 2 117 0 43 0 141 0 45 0 173 0 46 0 149 0 48 0 149 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63 0 22 0 67] 
#[1 0 93 0 1 1 237 0 2 2 121 0 3 1 245 0 10 0 109 0 13 0 113 0 14 0 117 0 15 1 249 0 16 1 253 0 20 0 121 0 21 0 125 0 22 0 129 0 23 2 1 0 24 2 5 0 25 2 9 0 26 2 13 0 29 0 133 0 30 2 17 0 32 2 25 0 63 2 25 0 66] 
#[1 2 125 0 11 2 33 0 21] 
#[0 2 129 0 19] 
#[0 2 133 0 19] 
#[0 1 150 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 154 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67] 
#[1 0 93 0 1 0 97 0 2 0 101 0 10 0 22 0 11 0 105 0 12 0 109 0 13 0 113 0 14 0 117 0 15 0 61 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 65 0 29 0 133 0 30 2 137 0 43 0 141 0 45 0 173 0 46 0 149 0 48 0 149 0 49 0 157 0 50 0 157 0 53 0 165 0 56 0 169 0 59 0 173 0 61 0 177 0 62 0 181 0 63] 
#[0 1 158 0 11 0 67] 
#[0 1 162 0 67] 
#[0 1 166 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 170 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 174 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 1 178 0 1 0 2 0 3 0 10 0 13 0 14 0 15 0 16 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 32] 
#[0 2 141 0 11] 
#[0 1 182 0 3 0 4 0 7 0 11 0 20 0 24 0 26 0 67]
	).
]

{ #category : #private }
StParser >> actionForCurrentToken [
	| ids action |
	ids := currentToken ids.
	1 to: ids size do:
		[ :i | 
		action := self actionFor: (ids at: i).
		(action bitAnd: self actionMask) = self errorAction
			ifFalse: [ ^ action ].
		(ids at: i) = scanner negativeNumberId
			ifTrue:
				[ currentToken := SmaCCToken
					value: '-'
					start: currentToken startPosition
					ids: (Array with: scanner binarySymbolId).
				self position: currentToken stopPosition - 1.
				^ self actionForCurrentToken ] ].
	^ self errorAction
]

{ #category : #private }
StParser >> createMessageNodeFrom: aCollection [
	^ RBMessageNode
		receiver: aCollection first
		selector: (aCollection at: 2) first contents asSymbol
		arguments: (aCollection at: 2) last
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray1: nodes [
	^ WriteStream on: Array new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray2: nodes [
	^ (nodes at: 1)
		nextPut: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArray3: nodes [
	(nodes at: 2) stopPosition + 1 = (nodes at: 3) startPosition
		ifTrue: [ (nodes at: 1) nextPut: ((nodes at: 2) value , ':') asSymbol ]
		ifFalse: [ (nodes at: 1)
				nextPut:
					(nodes at: 2) value asSymbol;
				nextPut: #':' ].
	self position:
		(nodes at: 3) startPosition.
	currentToken := nil.
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral2: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral6: nodes [
	^ (nodes at: 2) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForArrayLiteral8: nodes [
	^ (nodes at: 2) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBinaryMessage1: nodes [
	^ Array
		with: (ReadStream on: (nodes at: 1) value)
		with: (Array with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBinaryMethodName1: nodes [
	^ Array
		with: (nodes at: 1) value asSymbol
		with: (Array with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock1: nodes [
	^ RBBlockNode arguments: (nodes at: 2) body: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock2: nodes [
	^ RBBlockNode body: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock3: nodes [
	^ RBBlockNode
		arguments: (nodes at: 2)
		body: (RBSequenceNode statements: #())
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlock4: nodes [
	^ RBBlockNode
		arguments: (nodes at: 2)
		body: (RBSequenceNode temporaries: (nodes at: 4) statements: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForBlockArgs1: nodes [
	^ OrderedCollection with: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForByteArray1: nodes [
	^ WriteStream on: ByteArray new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForByteArray2: nodes [
	^ (nodes at: 1)
		nextPut: (nodes at: 2) value;
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForCascade1: nodes [
	| messages |
	(nodes at: 2) isEmpty
		ifTrue: [ ^ nodes at: 1 ].
	messages := OrderedCollection new:
		(nodes at: 2) size + 1.
	messages add: (nodes at: 1).
	(nodes at: 2)
		do: [ :each | 
			messages
				add:
					(RBMessageNode
						receiver:
							(nodes at: 1) receiver
						selector: each first contents asSymbol
						arguments: each last) ].
	^ RBCascadeNode messages: messages
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForExpression1: nodes [
	^ RBAssignmentNode variable: (nodes at: 1) value: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMethodName1: nodes [
	| stream |
	stream := WriteStream on: (String new: 30).
	stream nextPutAll:
		(nodes at: 1) value.
	^ Array with: stream with: (OrderedCollection with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForKeywordMethodName2: nodes [
	(nodes at: 1) first nextPutAll: (nodes at: 2) value.
	(nodes at: 1) last add: (nodes at: 3).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral14: nodes [
	^ (nodes at: 3) contents
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral15: nodes [
	^ (nodes at: 3) value asQualifiedReference
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral4: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral6: nodes [
	^ (nodes at: 1) value at: 2
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral7: nodes [
	^ ((nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1)
		copyReplaceAll: ''''''
		with: ''''
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral8: nodes [
	^ (((nodes at: 2) value copyFrom: 2 to: (nodes at: 2) value size - 1)
		copyReplaceAll: ''''''
		with: '''') asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForLiteral9: nodes [
	^ (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod1: nodes [
	^ (RBMethodNode
		selector: (nodes at: 1) value asSymbol
		arguments: #()
		body:
			(nodes at: 2) last) yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod2: nodes [
	^ (RBMethodNode
		selector: (nodes at: 1) first
		arguments: (nodes at: 1) last
		body:
			(nodes at: 2) last) yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethod3: nodes [
	^ (RBMethodNode
		selector: (nodes at: 1) first contents asSymbol
		arguments:
			(nodes at: 1) last
		body:
			(nodes at: 2) last) yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode1: nodes [
	^ Array
		with:
			((nodes at: 1)
				addAll: (nodes at: 5);
				yourself)
		with: (RBSequenceNode temporaries: (nodes at: 3) statements: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode2: nodes [
	^ Array
		with:
			((nodes at: 1)
				addAll: (nodes at: 3);
				yourself)
		with: (RBSequenceNode temporaries: #() statements: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForMethodSequenceNode3: nodes [
	^ Array
		with: (nodes at: 1)
		with: (RBSequenceNode temporaries: #() statements: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimary2: nodes [
	^ RBLiteralNode value: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitives1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForPrimitives2: nodes [
	^ (nodes at: 1)
		add: ((nodes at: 2) startPosition to: (nodes at: 4) startPosition);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForSequenceNode1: nodes [
	^ RBSequenceNode temporaries: (nodes at: 1) statements: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatementList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatements3: nodes [
	^ (nodes at: 1)
		add: (RBReturnNode value: (nodes at: 4));
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForStatements4: nodes [
	^ OrderedCollection with: (RBReturnNode value: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaries1: nodes [
	^ #()
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForTemporaryVariables2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForUnaryMessage1: nodes [
	^ Array with: (ReadStream on: (nodes at: 1) value) with: #()
]

{ #category : #'generated-reduction actions' }
StParser >> reduceActionForVariable1: nodes [
	^ RBVariableNode named: (nodes at: 1) value
]
