Extension { #name : #XMLAttributeList }

{ #category : #'*XML-Parser-GTExtensions' }
XMLAttributeList >> gtInspectorItemsIn: aComposite [
	^ self
		addOrderedListTableToComposite: aComposite
		paneTitle: 'Attributes'
		columnTitle: 'Attribute'
]
