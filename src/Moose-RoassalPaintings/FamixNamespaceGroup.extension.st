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
FamixNamespaceGroup >> inspectorShowInHierarchy [

	<inspectorPresentationOrder: 10 title: 'Hierarchy'>
	^ self withinOverallHierarchy asInspectorPresenter
]

{ #category : #'*Moose-RoassalPaintings' }
FamixNamespaceGroup >> withinOverallHierarchy [
	^ FamixNamespaceGroupOverallHierarchy forNamespaceGroup: self
]
