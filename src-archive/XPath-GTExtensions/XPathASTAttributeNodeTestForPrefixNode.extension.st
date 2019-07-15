Extension { #name : #XPathASTAttributeNodeTestForPrefixNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTAttributeNodeTestForPrefixNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]
