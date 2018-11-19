Extension { #name : #XMLNodeList }

{ #category : #'*XML-Parser-GTExtensions' }
XMLNodeList >> gtInspectorItemsIn: aComposite [
	^ self
		addOrderedListTableToComposite: aComposite
		paneTitle: 'Nodes'
		columnTitle: 'Node'
]
