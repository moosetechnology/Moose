Extension { #name : #XPathASTNodeWithExpression }

{ #category : #'*XPath-GTExtensions' }
XPathASTNodeWithExpression >> supportsTreeView [
	^ true
]

{ #category : #'*XPath-GTExtensions' }
XPathASTNodeWithExpression >> treeViewChildren [
	^ Array with: self expression
]
