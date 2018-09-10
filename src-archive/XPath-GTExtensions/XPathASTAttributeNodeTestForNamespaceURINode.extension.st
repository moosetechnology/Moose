Extension { #name : #XPathASTAttributeNodeTestForNamespaceURINode }

{ #category : #'*XPath-GTExtensions' }
XPathASTAttributeNodeTestForNamespaceURINode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]
