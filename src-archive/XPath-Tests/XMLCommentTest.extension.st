Extension { #name : #XMLCommentTest }

{ #category : #'*XPath-Tests' }
XMLCommentTest >> testStringValue [
	super testStringValue.

	self assert: (self nodeClass string: 'test') stringValue = 'test'.
]
