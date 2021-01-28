Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> hierarchy [
	^ FamixNamespaceGroupHierarchy forNamespaceGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> viewDependenciesWithCycles [
	<menuItem: 'Dependencies (cycles)' category: 'Visualize'>
	|view |
	view := RTMondrian new.
	self viewDependenciesWithCyclesOn: view.
	^ view openWithToolbar title: 'Dependencies (cycles)'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> viewDependenciesWithCyclesOn: view [
	| tarjan |
	tarjan := MalTarjan new.
	tarjan nodes: self.
	tarjan edges: self from: #yourself toAll: [ :e | e allProvidersAtScope: FamixTNamespace ].
	tarjan run.

	view shape rectangle
		width: #numberOfClasses;
		height: [ :each | each numberOfMethods / 10 ];
		fillColor: [ :namespace | (tarjan findNode: namespace) isInCycle ifTrue: [ Color red ] ifFalse: [ Color veryLightGray ] ].
	view interaction popupText: #gtDisplayString.
	view nodes: self.
	view shape line color: (Color gray alpha: 0.2).
	view edges source: self connectFrom: #yourself toAll: [ :e | e allProvidersAtScope: FamixTNamespace ].
	view layout dominanceTree layered.
	view view pushBackEdges
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
