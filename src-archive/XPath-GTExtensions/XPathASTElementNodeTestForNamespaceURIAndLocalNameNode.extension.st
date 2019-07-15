Extension { #name : #XPathASTElementNodeTestForNamespaceURIAndLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (self localName expandWithXMLNamespaceURI: self namespaceURI);
		nextPut: $).
]
