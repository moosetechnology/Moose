Extension { #name : #XPathASTUnaryOperatorExpressionNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTUnaryOperatorExpressionNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self operatorName;
		nextPut: $).
]
