Extension { #name : #XPathASTElementNodeTestForPrefixNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForPrefixNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]
