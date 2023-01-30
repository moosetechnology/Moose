Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> hierarchy [

	^ FamixNamespaceGroupHierarchy forNamespaceGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> inspectorShowInHierarchy [

	<inspectorPresentationOrder: 10 title: 'Hierarchy'>
	^ self withinOverallHierarchy asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> withinOverallHierarchy [
	^ FamixNamespaceGroupOverallHierarchy forNamespaceGroup: self
]
