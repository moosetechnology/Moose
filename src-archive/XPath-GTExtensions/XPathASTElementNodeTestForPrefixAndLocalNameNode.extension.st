Extension { #name : #XPathASTElementNodeTestForPrefixAndLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTElementNodeTestForPrefixAndLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (self localName qualifyWithXMLPrefix: self prefix);
		nextPut: $).
]
