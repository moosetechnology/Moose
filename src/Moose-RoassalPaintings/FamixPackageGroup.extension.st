Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> complexity [
	^ FamixPackageGroupComplexity forPackageGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> dependencies [
	^ FamixContainerGroupDependencies forContainerGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> inspectorShowComplexity [

	<inspectorPresentationOrder: 10 title: 'Complexity'>
	^ self complexity asInspectorPresenter
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> inspectorShowDependencies [

	<inspectorPresentationOrder: 10 title: 'Dependencies'>
	^ self dependencies asInspectorPresenter
]
