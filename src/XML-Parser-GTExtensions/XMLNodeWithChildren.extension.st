Extension { #name : #XMLNodeWithChildren }

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithChildren >> addTreeViewChildrenTo: anOrderedCollection [
	self nodesDo: [:each |
		anOrderedCollection addLast: each]
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithChildren >> supportsTreeView [
	^ self hasChildren
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeWithChildren >> treeViewChildren [
	self supportsTreeView
		ifTrue: [| treeViewChildren |
			treeViewChildren := OrderedCollection new: self nodes size.
			self addTreeViewChildrenTo: treeViewChildren.
			^ treeViewChildren]
		ifFalse: [^ #()]
]
