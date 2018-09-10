Extension { #name : #XPathASTElementNodeTestForNamespaceURINode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForNamespaceURINode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]
