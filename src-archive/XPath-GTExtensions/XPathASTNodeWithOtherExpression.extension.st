Extension { #name : #XPathASTNodeWithOtherExpression }

{ #category : #'*XPath-GTExtensions' }
XPathASTNodeWithOtherExpression >> treeViewChildren [
	^ Array
		with: self expression
		with: self otherExpression
]
