Extension { #name : #XPathASTVariableReferenceNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTVariableReferenceNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]
