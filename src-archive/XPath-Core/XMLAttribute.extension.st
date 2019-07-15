Extension { #name : #XMLAttribute }

{ #category : #'*XPath-Core-testing' }
XMLAttribute >> hasExpandedName [
	^ true
]

{ #category : #'*XPath-Core-accessing' }
XMLAttribute >> stringValue [
	^ self value
]
