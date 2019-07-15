Extension { #name : #XPathASTNamespaceTestForLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTNamespaceTestForLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]
