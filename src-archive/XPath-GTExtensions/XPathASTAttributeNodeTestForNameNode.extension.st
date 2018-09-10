Extension { #name : #XPathASTAttributeNodeTestForNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTAttributeNodeTestForNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]
