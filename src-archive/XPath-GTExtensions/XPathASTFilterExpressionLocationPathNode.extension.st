Extension { #name : #XPathASTFilterExpressionLocationPathNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTFilterExpressionLocationPathNode >> treeViewChildren [
	^ self hasSteps
		ifTrue: [self steps copyWithFirst: self expression]
		ifFalse: [super treeViewChildren]
]
