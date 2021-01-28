Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> dependencies [
	^ FamixContainerGroupDependencies forContainerGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> hierarchy [
	^ FamixNamespaceGroupHierarchy forNamespaceGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> viewWithinOverallHierarchy [
	<menuItem: 'Within overall hierarchy' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewWithinOverallHierarchyOn: view.
	^ view openWithToolbar title: 'Within overall hierarchy'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> viewWithinOverallHierarchyOn: view [ 
	view shape label
		text: #name;
		color: [:each | (self includes: each) ifTrue: [Color black] ifFalse: [Color gray] ] .
	view nodes: (self flatCollectAsSet: #withAllParentScopes).
	view shape line color: (Color gray alpha: 0.2).
	view edges connectFrom: #parentScope.
	view layout cluster.
	view view pushBackEdges
]
