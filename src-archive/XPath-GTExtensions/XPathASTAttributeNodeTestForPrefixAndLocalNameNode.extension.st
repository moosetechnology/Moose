Extension { #name : #XPathASTAttributeNodeTestForPrefixAndLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (self localName qualifyWithXMLPrefix: self prefix);
		nextPut: $).
]
