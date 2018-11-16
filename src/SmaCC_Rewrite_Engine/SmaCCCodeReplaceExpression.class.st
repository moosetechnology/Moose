Class {
	#name : #SmaCCCodeReplaceExpression,
	#superclass : #SmaCCReplaceExpression,
	#instVars : [
		'code'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCCodeReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitCodeReplace: self
]

{ #category : #generated }
SmaCCCodeReplaceExpression >> code [
	^ code
]

{ #category : #generated }
SmaCCCodeReplaceExpression >> code: aSmaCCToken [
	code := aSmaCCToken
]

{ #category : #evaluating }
SmaCCCodeReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	| value |
	value := self method
		valueWithReceiver: aSmaCCRewriteMatchContext
		arguments: #().
	^ (value isString or: [ value isKindOf: SmaCCString ])
		ifTrue: [ value ]
		ifFalse:
			[ aSmaCCRewriteMatchContext
				sourceFrom: aSmaCCRewriteMatchContext match startPosition
				to: aSmaCCRewriteMatchContext match stopPosition ]
]

{ #category : #evaluating }
SmaCCCodeReplaceExpression >> method [
	^ self
		attributeNamed: #method
		ifAbsentPut: [ | tree |
			tree := RBParser parseMethod: 'code ' , code value.
			tree body statements isEmpty
				ifTrue: [ tree := RBParser parseMethod: 'code ^''''' ].
			tree body addReturn.
			SmaCCRewriteMatchContext compiledMethodFor: tree formattedCode ]
]

{ #category : #generated }
SmaCCCodeReplaceExpression >> tokenVariables [
	^ #(#code)
]
