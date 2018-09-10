Extension { #name : #XMLAttributeList }

{ #category : #'*XPath-Core-private' }
XMLAttributeList >> attributeAxisSelectName: anAttributeName into: aNodeSet [
	| i |

	"Must match anAttributeName exactly.
	We avoid #attributeNodeAt: because it matches names and local
	names, not names exactly, and #attributeValueAt: returns the
	value, not the node"
	(i := self indexOfAttributeValueAt: anAttributeName) > 0
		ifTrue: [
			aNodeSet addLast:
				(self at: i)].
	^ aNodeSet.
]
