Class {
	#name : #SmaCCRewriteTest,
	#superclass : #TestCase,
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #private }
SmaCCRewriteTest >> compareRewrite: sourceString isEqualTo: resultString using: aSmaCCRewriteEngine [
	| tree rewriteResult |
	tree := self parserClass parse: sourceString.
	rewriteResult := aSmaCCRewriteEngine rewriteTree: tree.
	self assert: rewriteResult = resultString
]

{ #category : #private }
SmaCCRewriteTest >> lispRewriter [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a{testBlock: [:node | 
									| myParent grandParent | 
									myParent := node parent. 
									grandParent := myParent parent.
									myParent class = grandParent class and: [myParent operator = grandParent operator]]}`
								`op{beToken;testBlock: [:token | token value ~= ''^'']}` `b`<<<
					->
					>>>`a` `b`<<<

					>>>`a`^`b`<<<
					->
					>>>(expt `a` `b`)<<<

					>>>`a` `op{beToken}` `b`<<<
					->
					>>>(`op` `a` `b`)<<<').
	^ rewriter
]

{ #category : #private }
SmaCCRewriteTest >> parserClass [
	^ SmaCCRewriteTestParser
]

{ #category : #private }
SmaCCRewriteTest >> postfixRewriter [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`a` `b` `op`<<<').
	^ rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testAddParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`(a)` `op` `(b)`<<<').
	self
		compareRewrite: '1+(1+1)'
		isEqualTo: '(1) + ((1) + (1))'
		using: rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testCodeExpressionToRemoveParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a{testBlock: [:node | node leftParens notEmpty]}`<<<
					->
					>>>``match leftParens do: [:each | self delete: each].
							match rightParens do: [:each | self delete: each].
							match nodesDo: [:each | self rewrite: each]``<<<').
	self
		compareRewrite: '(1)+ ( 1 +(1))'
		isEqualTo: '1+  1 +1'
		using: rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testCodeToRemoveParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'SmaCCRewriteTestExpressionNode
					->
					[match leftParens do: [:each | self delete: each].
					self processChildren.
					match rightParens do: [:each | self delete: each]]').
	self
		compareRewrite: '(1)+ ( 1 +(1))'
		isEqualTo: '1+  1 +1'
		using: rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testExpressions [
	| stream coreExpression |
	stream := WriteStream on: String new.
	(1 to: 25)
		do: [ :i | stream nextPutAll: '1 +' ]
		separatedBy: [ stream space ].
	coreExpression := stream contents.
	self
		compareRewrite: coreExpression , ' 1'
		isEqualTo: '1 ' , coreExpression
		using: self postfixRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testLispExpressions [
	self
		compareRewrite: '1+2*3^4+5'
		isEqualTo: '(+ 1 (* 2 (expt 3 4)) 5)'
		using: self lispRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testMultipleInsertAfters [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'SmaCCRewriteTestBinaryExpressionNode
					->
					[match parent notNil 
						ifTrue:
							[self insert: ''()'' after: match.
							self insert: ''[]'' after: match].
					self continue]').
	self compareRewrite: '1+1+1' isEqualTo: '1+1()[]+1' using: rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testNoChanges [
	self compareRewrite: '2' isEqualTo: '2' using: self postfixRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testOneExpression [
	self
		compareRewrite: '2+3'
		isEqualTo: '2 3 +'
		using: self postfixRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testTwoExpressions [
	self
		compareRewrite: '1+2*3'
		isEqualTo: '1 2 3 * +'
		using: self postfixRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testTypeAddParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					SmaCCRewriteTestBinaryExpressionNode
					->
					>>>`(left)` `operator` `(right)`<<<').
	self
		compareRewrite: '1+(1+1)'
		isEqualTo: '(1) + ((1) + (1))'
		using: rewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testWhitespace [
	self
		compareRewrite:
			'1+
	2
	*3'
		isEqualTo:
			'1 
	2
	 3 * +'
		using: self whitespacePostfixRewriter
]

{ #category : #tests }
SmaCCRewriteTest >> testWithParens [
	self
		compareRewrite: '1+(2+3)'
		isEqualTo: '1 2 3 + +'
		using: self postfixRewriter
]

{ #category : #private }
SmaCCRewriteTest >> whitespacePostfixRewriter [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`\a\` `\b\` `op`<<<').
	^ rewriter
]
