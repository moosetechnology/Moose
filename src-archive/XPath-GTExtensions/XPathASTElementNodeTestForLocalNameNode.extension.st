Extension { #name : #XPathASTElementNodeTestForLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]
