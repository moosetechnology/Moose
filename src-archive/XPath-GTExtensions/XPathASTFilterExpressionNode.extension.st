Extension { #name : #XPathASTFilterExpressionNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTFilterExpressionNode >> treeViewChildren [
	^ self hasPredicates
		ifTrue: [self predicates copyWithFirst: self expression]
		ifFalse: [super treeViewChildren]
]
