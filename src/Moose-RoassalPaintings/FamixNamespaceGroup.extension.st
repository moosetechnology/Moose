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
FamixNamespaceGroup >> withinOverallHierarchy [
	^ FamixNamespaceGroupOverallHierarchy forNamespaceGroup: self
]
