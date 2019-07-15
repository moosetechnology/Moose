Extension { #name : #XPathASTStepNode }

{ #category : #'*XPath-GTExtensions' }
XPathASTStepNode >> treeViewChildren [
	^ self hasPredicates
		ifTrue: [self predicates copyWithFirst: self nodeTest]
		ifFalse: [Array with: self nodeTest]
]
