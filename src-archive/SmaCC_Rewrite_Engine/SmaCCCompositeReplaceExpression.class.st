Class {
	#name : #SmaCCCompositeReplaceExpression,
	#superclass : #SmaCCReplaceExpression,
	#instVars : [
		'expressions'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCCompositeReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitCompositeReplace: self
]

{ #category : #generated }
SmaCCCompositeReplaceExpression >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #evaluating }
SmaCCCompositeReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	| result |
	result := aSmaCCRewriteMatchContext smaccStringClass new.
	self expressions
		reverseDo:
			[ :each | result addPrefix: (each evaluateInContext: aSmaCCRewriteMatchContext) ].
	^ result
]

{ #category : #generated }
SmaCCCompositeReplaceExpression >> expressions [
	^ expressions
]

{ #category : #generated }
SmaCCCompositeReplaceExpression >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
SmaCCCompositeReplaceExpression >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
]
