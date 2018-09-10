Extension { #name : #XMLAttributeTest }

{ #category : #'*XPath-Tests' }
XMLAttributeTest >> testHasExpandedName [
	self assert: self newNode hasExpandedName
]

{ #category : #'*XPath-Tests' }
XMLAttributeTest >> testStringValue [
	super testStringValue.

	self assert:
		(self nodeClass
			name: 'name'
			value: 'value') stringValue = 'value'
]
