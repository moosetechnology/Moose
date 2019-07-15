Extension { #name : #XPathASTLocationPathNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTLocationPathNode >> supportsTreeView [
	^ self hasSteps
]

{ #category : #'*XPath-GTExtensions' }
XPathASTLocationPathNode >> treeViewChildren [
	^ self steps
]
