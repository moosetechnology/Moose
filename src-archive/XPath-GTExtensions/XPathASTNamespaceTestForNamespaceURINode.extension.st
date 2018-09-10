Extension { #name : #XPathASTNamespaceTestForNamespaceURINode }

{ #category : #'*XPath-GTExtensions' }
XPathASTNamespaceTestForNamespaceURINode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]
