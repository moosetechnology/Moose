Extension { #name : #XMLAttribute }

{ #category : #'*XML-Parser-GTExtensions' }
XMLAttribute >> removeFromParent [
	self parent removeAttributeNode: self
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLAttribute >> supportsSourceEditing [
	^ false
]
