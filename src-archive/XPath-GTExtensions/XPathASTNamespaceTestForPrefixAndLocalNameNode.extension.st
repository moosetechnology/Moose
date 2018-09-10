Extension { #name : #XPathASTNamespaceTestForPrefixAndLocalNameNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTNamespaceTestForPrefixAndLocalNameNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (self localName qualifyWithXMLPrefix: self prefix);
		nextPut: $).
]
