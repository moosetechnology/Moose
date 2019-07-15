Extension { #name : #XPathASTNamespaceTestForPrefixNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTNamespaceTestForPrefixNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]
