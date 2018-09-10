Class {
	#name : #SmaCCReplaceExpressionVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCReplaceExpressionVisitor >> visitCodeReplace: aCodeReplace [
	^ self visitReplace: aCodeReplace
]

{ #category : #generated }
SmaCCReplaceExpressionVisitor >> visitCompositeReplace: aCompositeReplace [
	^ self visitReplace: aCompositeReplace
]

{ #category : #generated }
SmaCCReplaceExpressionVisitor >> visitNodeReplace: aNodeReplace [
	^ self visitReplace: aNodeReplace
]

{ #category : #generated }
SmaCCReplaceExpressionVisitor >> visitReplace: aReplace [
	^ self visitSmaCCParseNode: aReplace
]

{ #category : #generated }
SmaCCReplaceExpressionVisitor >> visitStringReplace: aStringReplace [
	^ self visitReplace: aStringReplace
]
