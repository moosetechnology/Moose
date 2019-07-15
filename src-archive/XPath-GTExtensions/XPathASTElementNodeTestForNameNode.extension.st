Extension { #name : #XPathASTElementNodeTestForNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]
