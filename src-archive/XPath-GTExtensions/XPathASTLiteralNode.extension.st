Extension { #name : #XPathASTLiteralNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTLiteralNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self asXPathString;
		nextPut: $).
]
