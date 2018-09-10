Extension { #name : #XMLCachingAttributeList }

{ #category : #'*XPath-Core-private' }
XMLCachingAttributeList >> attributeAxisSelectName: anAttributeName into: aNodeSet [
	self attributeNodesByName
		at: anAttributeName
		ifPresent: [:attribute |
			aNodeSet addLast: attribute].
	^ aNodeSet.
]
