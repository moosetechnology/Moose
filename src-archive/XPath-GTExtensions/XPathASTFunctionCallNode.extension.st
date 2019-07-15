Extension { #name : #XPathASTFunctionCallNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTFunctionCallNode >> printTreeViewLabelOn: aStream [
	super printTreeViewLabelOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]

{ #category : #'*XPath-GTExtensions' }
XPathASTFunctionCallNode >> supportsTreeView [
	^ self hasArguments
]

{ #category : #'*XPath-GTExtensions' }
XPathASTFunctionCallNode >> treeViewChildren [
	^ self arguments
]
