Extension { #name : #XPathASTNamespaceTestForNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTNamespaceTestForNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]
