Class {
	#name : #SmaCCNodeReplaceExpression,
	#superclass : #SmaCCReplaceExpression,
	#instVars : [
		'beforeWhitespace',
		'beforePrefix',
		'prefix',
		'name',
		'postfix',
		'afterPostfix',
		'afterWhitespace'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCNodeReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitNodeReplace: self
]

{ #category : #private }
SmaCCNodeReplaceExpression >> addPostfixTo: aSmaCCString inContext: aSmaCCRewriteMatchContext [
	| node position string |
	node := aSmaCCRewriteMatchContext nodeFor: name value.
	(aSmaCCRewriteMatchContext isAtEndOfParent: node)
		ifFalse:
			[ position := aSmaCCRewriteMatchContext originalStopPosition: node.
			string := nil.
			afterPostfix notNil
				ifTrue:
					[ (aSmaCCRewriteMatchContext
						charactersAtAndAfter: (aSmaCCRewriteMatchContext nextIndex: position)
						matchesToken: afterPostfix)
						ifTrue:
							[ afterPostfix value size
								timesRepeat: [ position := aSmaCCRewriteMatchContext nextIndex: position ] ].
					string := afterPostfix value ].
			afterWhitespace notNil
				ifTrue:
					[ aSmaCCString
						addPrefix: (aSmaCCRewriteMatchContext whitespaceAfter: position) ].
			string notNil
				ifTrue: [ aSmaCCString addPrefix: string ] ].
	postfix notNil
		ifTrue: [ aSmaCCString addPrefix: postfix value ]
]

{ #category : #private }
SmaCCNodeReplaceExpression >> addPrefixTo: aSmaCCString inContext: aSmaCCRewriteMatchContext [
	| node startPosition |
	node := aSmaCCRewriteMatchContext nodeFor: name value.
	startPosition := aSmaCCRewriteMatchContext
		originalStartPosition: node.
	prefix notNil
		ifTrue: [ aSmaCCString addPrefix: prefix value ].
	(aSmaCCRewriteMatchContext isAtStartOfParent: node)
		ifTrue: [ ^ self ].
	beforePrefix notNil
		ifTrue:
			[ (aSmaCCRewriteMatchContext
				charactersAtAndBefore: (aSmaCCRewriteMatchContext previousIndex: startPosition)
				matchesToken: beforePrefix)
				ifTrue:
					[ beforePrefix value size
						timesRepeat:
							[ startPosition := aSmaCCRewriteMatchContext
								previousIndex: startPosition ] ].
			aSmaCCString addPrefix: beforePrefix value ].
	beforeWhitespace notNil
		ifTrue:
			[ aSmaCCString
				addPrefix: (aSmaCCRewriteMatchContext whitespaceBefore: startPosition) ]
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> afterPostfix [
	^ afterPostfix
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> afterPostfix: aSmaCCToken [
	afterPostfix := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> afterWhitespace [
	^ afterWhitespace
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> afterWhitespace: aSmaCCToken [
	afterWhitespace := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> beforePrefix [
	^ beforePrefix
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> beforePrefix: aSmaCCToken [
	beforePrefix := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> beforeWhitespace [
	^ beforeWhitespace
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> beforeWhitespace: aSmaCCToken [
	beforeWhitespace := aSmaCCToken
]

{ #category : #evaluating }
SmaCCNodeReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	| result |
	result := aSmaCCRewriteMatchContext smaccStringClass new.
	self addPostfixTo: result inContext: aSmaCCRewriteMatchContext.
	result addPrefix: (aSmaCCRewriteMatchContext stringFor: name value).
	self addPrefixTo: result inContext: aSmaCCRewriteMatchContext.
	^ result
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> name [
	^ name
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> postfix [
	^ postfix
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> postfix: aSmaCCToken [
	postfix := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> prefix [
	^ prefix
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> prefix: aSmaCCToken [
	prefix := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeReplaceExpression >> tokenVariables [
	^ #(#beforeWhitespace #beforePrefix #prefix #name #postfix #afterPostfix #afterWhitespace)
]
