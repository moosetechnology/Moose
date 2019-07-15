Extension { #name : #XMLStringTest }

{ #category : #'*XPath-Tests' }
XMLStringTest >> testStringValue [
	super testStringValue.

	self assert:
		(self nodeClass string: self markupString) stringValue =
			self markupString.
]
