Extension { #name : #XMLInternalSubsetList }

{ #category : #'*XML-Parser-GTExtensions' }
XMLInternalSubsetList >> gtInspectorItemsIn: aComposite [
	^ self
		addOrderedListTableToComposite: aComposite
		paneTitle: 'Nodes'
		columnTitle: 'Node'
]
