Extension { #name : #XPathASTAttributeNodeTestForLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTAttributeNodeTestForLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]
