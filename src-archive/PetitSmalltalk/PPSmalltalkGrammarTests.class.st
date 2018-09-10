Class {
	#name : #PPSmalltalkGrammarTests,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitSmalltalk-Tests'
}

{ #category : #accessing }
PPSmalltalkGrammarTests class >> packageNamesUnderTest [
	^ #('PetitSmalltalk')
]

{ #category : #accessing }
PPSmalltalkGrammarTests >> parserClass [
	^ PPSmalltalkGrammar
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testArgumentsBlock1 [
	self 
		parse: '[ :a | ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testArgumentsBlock2 [
	self 
		parse: '[ :a :b | ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testArgumentsBlock3 [
	self 
		parse: '[ :a :b :c | ]'
		rule: #block
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testArray1 [
	self 
		parse: '{}'
		rule: #array
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testArray2 [
	self 
		parse: '{self foo}'
		rule: #array
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testArray3 [
	self 
		parse: '{self foo. self bar}'
		rule: #array
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testArray4 [
	self 
		parse: '{self foo. self bar.}'
		rule: #array
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral1 [
	self 
		parse: '#()'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral10 [
	self 
		parse: '#((1 2) #(1 2 3))'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral11 [
	self 
		parse: '#([1 2] #[1 2 3])'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral2 [
	self 
		parse: '#(1)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral3 [
	self 
		parse: '#(1 2)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral4 [
	self 
		parse: '#(true false nil)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral5 [
	self 
		parse: '#($a)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral6 [
	self 
		parse: '#(1.2)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral7 [
	self 
		parse: '#(size #at: at:put: #''=='')'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral8 [
	self 
		parse: '#(''baz'')'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testArrayLiteral9 [
	self 
		parse: '#((1) 2)'
		rule: #arrayLiteral
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment1 [
	self 
		parse: '1'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment2 [
	self 
		parse: 'a := 1'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment3 [
	self 
		parse: 'a := b := 1'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment4 [
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ self parse: 'a _ 1' rule: #expression ]
		ifFalse: [ self fail: 'a _ 1' rule: #expression ]
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment5 [
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ self parse: 'a _ b _ 1' rule: #expression ]
		ifFalse: [ self fail: 'a _ b _ 1' rule: #expression ]
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testAssignment6 [
	self 
		parse: 'a := (b := c)'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryExpression1 [
	self 
		parse: '1 + 2'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryExpression2 [
	self 
		parse: '1 + 2 + 3'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryExpression3 [
	self 
		parse: '1 // 2'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryExpression4 [
	self 
		parse: '1 -- 2'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryExpression5 [
	self 
		parse: '1 ==> 2'
		rule: #expression.
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryMethod1 [
	self 
		parse: '+ a'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryMethod2 [
	self 
		parse: '+ a | b |'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryMethod3 [
	self 
		parse: '+ a b'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryMethod4 [
	self 
		parse: '+ a | b | c'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testBinaryMethod5 [
	self 
		parse: '-- a'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testBlock1 [
	self 
		parse: '[]'
		rule: #block
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testByteLiteral1 [
	self 
		parse: '#[]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testByteLiteral2 [
	self 
		parse: '#[0]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testByteLiteral3 [
	self 
		parse: '#[255]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testByteLiteral4 [
	self 
		parse: '#[ 1 2 ]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testByteLiteral5 [
	self 
		parse: '#[ 2r1010 8r77 16rFF ]'
		rule: #byteLiteral
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testCascadeExpression1 [
	self 
		parse: '1 abs; negated'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testCascadeExpression2 [
	self 
		parse: '1 abs negated; raisedTo: 12; negated'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testCascadeExpression3 [
	self 
		parse: '1 + 2; - 3'
		rule: #expression
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testCharLiteral1 [
	self 
		parse: '$a'
		rule: #charLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testCharLiteral2 [
	self 
		parse: '$ '
		rule: #charLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testCharLiteral3 [
	self 
		parse: '$$'
		rule: #charLiteral
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testComment1 [
	self 
		parse: '1"one"+2'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testComment2 [
	self 
		parse: '1 "one" +2'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testComment3 [
	self 
		parse: '1"one"+"two"2'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testComment4 [
	self 
		parse: '1"one""two"+2'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testComment5 [
	self 
		parse: '1"one"	"two"+2'
		rule: #expression
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testCompleteness [
	"This test asserts that all subclasses override all test methods."
	
	self class allSubclasses do: [ :subclass |
		self class testSelectors do: [ :selector |
			self 
				assert: (selector = #testCompleteness or: [ subclass selectors includes: selector ])
				description: subclass printString , ' does not test ' , selector printString ] ]
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testComplexBlock1 [
	self 
		parse: '[ :a | | b | c ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testComplexBlock2 [
	self 
		parse: '[:a||b|c]'
		rule: #block
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordExpression1 [
	self 
		parse: '1 to: 2'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordExpression2 [
	self 
		parse: '1 to: 2 by: 3'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordExpression3 [
	self 
		parse: '1 to: 2 by: 3 do: 4'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordMethod1 [
	self 
		parse: 'to: a'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordMethod2 [
	self 
		parse: 'to: a do: b | c |'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordMethod3 [
	self 
		parse: 'to: a do: b by: c d'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testKeywordMethod4 [
	self 
		parse: 'to: a do: b by: c | d | e'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testMethod1 [
	self 
		parse: 'negated ^ 0 - self'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testMethod2 [
	"Spaces at the beginning of the method."
	self 
		parse: '	  negated ^ 0 - self'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testMethod3 [
	"Spaces at the end of the method."
	self 
		parse: '	negated ^ 0 - self  '
		rule: #method
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral1 [
	self 
		parse: '0'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral10 [
	self 
		parse: '10r10'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral11 [
	self 
		parse: '8r777'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral12 [
	self 
		parse: '16rAF'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral13 [
	self 
		parse: '16rCA.FE'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral14 [
	self 
		parse: '3r-22.2'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral15 [
	self 
		parse: '0.50s2'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral2 [
	self 
		parse: '0.1'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral3 [
	self 
		parse: '123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral4 [
	self 
		parse: '123.456'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral5 [
	self 
		parse: '-0'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral6 [
	self 
		parse: '-0.1'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral7 [
	self 
		parse: '-123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral8 [
	self 
		parse: '-123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testNumberLiteral9 [
	self 
		parse: '-123.456'
		rule: #numberLiteral
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma1 [
	self 
		parse: 'method <foo>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma10 [
	self 
		parse: 'method <foo: bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma11 [
	self 
		parse: 'method <foo: true>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma12 [
	self 
		parse: 'method <foo: false>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma13 [
	self 
		parse: 'method <foo: nil>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma14 [
	self 
		parse: 'method <foo: ()>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma15 [
	self 
		parse: 'method <foo: #()>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma16 [
	self 
		parse: 'method < + 1 >'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma17 [
	self 
		parse: 'method <foo: 1 bar: 2>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma18 [
	self 
		parse: 'method <foo: 1 bar: 2  baz: b>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma2 [
	self 
		parse: 'method <foo> <bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma3 [
	self 
		parse: 'method | a | <foo>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma4 [
	self 
		parse: 'method <foo> | a |'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma5 [
	self 
		parse: 'method <foo> | a | <bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma6 [
	self 
		parse: 'method <foo: 1>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma7 [
	self 
		parse: 'method <foo: 1.2>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma8 [
	self 
		parse: 'method <foo: ''bar''>'
		rule: #method
]

{ #category : #'testing-pragmas' }
PPSmalltalkGrammarTests >> testPragma9 [
	self 
		parse: 'method <foo: #''bar''>'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testSequence1 [
	self 
		parse: '| a | 1 . 2'
		rule: #sequence
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testSimpleBlock1 [
	self 
		parse: '[ ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testSimpleBlock2 [
	self 
		parse: '[ nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testSimpleBlock3 [
	self 
		parse: '[ :a ]'
		rule: #block
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSpecialLiteral1 [
	self 
		parse: 'true'
		rule: #trueLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSpecialLiteral2 [
	self 
		parse: 'false'
		rule: #falseLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSpecialLiteral3 [
	self 
		parse: 'nil'
		rule: #nilLiteral
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testStatementBlock1 [
	self 
		parse: '[ nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testStatementBlock2 [
	self 
		parse: '[ | a | nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
PPSmalltalkGrammarTests >> testStatementBlock3 [
	self 
		parse: '[ | a b | nil ]'
		rule: #block
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements1 [
	self 
		parse: '1'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements2 [
	self 
		parse: '1 . 2'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements3 [
	self 
		parse: '1 . 2 . 3'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements4 [
	self 
		parse: '1 . 2 . 3 .'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements5 [
	self 
		parse: '1 . . 2'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements6 [
	self 
		parse: '1. 2'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements7 [
	self 
		parse: '. 1'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements8 [
	self 
		parse: '.1'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testStatements9 [
	self 
		parse: ''
		rule: #statements
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testStringLiteral1 [
	self 
		parse: ''''''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testStringLiteral2 [
	self 
		parse: '''ab'''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testStringLiteral3 [
	self 
		parse: '''ab''''cd'''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral1 [
	self 
		parse: '#foo'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral2 [
	self 
		parse: '#+'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral3 [
	self 
		parse: '#key:'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral4 [
	self 
		parse: '#key:value:'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral5 [
	self 
		parse: '#''testing-result'''
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral6 [
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: '#__gen__binding'
			rule: #symbolLiteral ]
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral7 [
	self 
		parse: '# fucker'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral8 [
	self 
		parse: '##fucker'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
PPSmalltalkGrammarTests >> testSymbolLiteral9 [
	self 
		parse: '## fucker'
		rule: #symbolLiteral
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testTemporaries1 [
	self 
		parse: '| a |'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testTemporaries2 [
	self 
		parse: '| a b |'
		rule: #sequence
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testTemporaries3 [
	self 
		parse: '| a b c |'
		rule: #sequence
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryExpression1 [
	self 
		parse: '1 abs'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryExpression2 [
	self 
		parse: '1 abs negated'
		rule: #expression
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryMethod1 [
	self 
		parse: 'abs'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryMethod2 [
	self 
		parse: 'abs | a |'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryMethod3 [
	self 
		parse: 'abs a'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryMethod4 [
	self 
		parse: 'abs | a | b'
		rule: #method
]

{ #category : #'testing-messages' }
PPSmalltalkGrammarTests >> testUnaryMethod5 [
	self 
		parse: 'abs | a |'
		rule: #method
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable1 [
	self 
		parse: 'trueBinding'
		rule: #primary
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable2 [
	self 
		parse: 'falseBinding'
		rule: #primary
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable3 [
	self 
		parse: 'nilly'
		rule: #primary
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable4 [
	self 
		parse: 'selfish'
		rule: #primary
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable5 [
	self 
		parse: 'supernanny'
		rule: #primary
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable6 [
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: 'super_nanny'
			rule: #primary ]
]

{ #category : #testing }
PPSmalltalkGrammarTests >> testVariable7 [
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: '__gen_var_123__'
			rule: #primary ]
]
