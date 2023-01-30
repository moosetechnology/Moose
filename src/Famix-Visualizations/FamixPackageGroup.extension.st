Extension { #name : #FamixPackageGroup }

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> complexity [

	^ FamixPackageGroupComplexity forPackageGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> inspectorShowComplexity [

	<inspectorPresentationOrder: 10 title: 'Complexity'>
	^ self complexity asInspectorPresenter
]

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> inspectorShowDependencies [

	<inspectorPresentationOrder: 10 title: 'Dependencies'>
	^ self dependencies asInspectorPresenter
]
