Class {
	#name : #SmaCCReplaceExpression,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitReplace: self
]

{ #category : #evaluating }
SmaCCReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	self subclassResponsibility
]
