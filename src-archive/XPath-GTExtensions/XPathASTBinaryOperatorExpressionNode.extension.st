Extension { #name : #XPathASTBinaryOperatorExpressionNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTBinaryOperatorExpressionNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self operatorName;
		nextPut: $).
]
