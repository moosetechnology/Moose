Class {
	#name : #SmaCCRewriteRuleFileScanner,
	#superclass : #SmaCCScanner,
	#classInstVars : [
		'rewriter'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'generated-initialization' }
SmaCCRewriteRuleFileScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(13 'Import' 9) #(13 'Parser' 10))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #accessing }
SmaCCRewriteRuleFileScanner class >> rewriter [
	^ rewriter
]

{ #category : #accessing }
SmaCCRewriteRuleFileScanner class >> rewriter: aParseTreeRewriter [
	rewriter := aParseTreeRewriter
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> emptySymbolTokenId [
	^ 34
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> errorTokenId [
	^ 35
]

{ #category : #private }
SmaCCRewriteRuleFileScanner >> fixExpression: expression [
	| rewriter tree |
	rewriter := self class rewriter.
	rewriter isNil
		ifTrue: [ ^ expression ].
	tree := RBParser parseExpression: expression.
	[ rewriter executeTree: tree ] whileTrue: [ tree := rewriter tree ].
	^ tree formattedCode
]

{ #category : #private }
SmaCCRewriteRuleFileScanner >> isValidSmalltalk: aString [
	RBParser parseExpression: aString onError: [ :e :p | ^ false ].
	^ true
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(15).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scan2 [
	[ self step.
	currentCharacter == $!
		ifTrue: [ self recordMatch: #(16).
			self step.
			currentCharacter == $!
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scan3 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(14).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scan4 [
	[ self recordMatch: #(13).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForToken [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	^ self scanForTokenX7
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX1 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX2 [
	[ self recordMatch: #(17).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX3 [
	(self scanForString: '>>')
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX4 [
	(self scanForString: '<<')
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX5 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX6 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scanForTokenX5 ].
	^ self scan2
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> scanForTokenX7 [
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #private }
SmaCCRewriteRuleFileScanner >> scanSmalltalkExpression [
	| expression |
	expression := ''.
	[ stream atEnd
		ifTrue: [ self error: 'Invalid Smalltalk expression' ].
	expression := expression , (stream upTo: $]).
	self isValidSmalltalk: expression ]
		whileFalse: [ expression := expression copyWith: $] ].
	stream skip: -1.
	^ self fixExpression: expression
]

{ #category : #private }
SmaCCRewriteRuleFileScanner >> scanStringExpression [
	| string |
	string := stream upToAll: '<<<'.
	stream skip: -3.
	^ string
]

{ #category : #generated }
SmaCCRewriteRuleFileScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace)
]
