Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Famix-Visualizations' }
FamixAnnotationTypeGroup >> annotationConstellation [
	^ FamixAnnotationTypeGroupConstellation forAnnotationTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixAnnotationTypeGroup >> inspectorShowAnnotationConstellation [

	<inspectorPresentationOrder: 10 title: 'Annotation Constellation'>
	^ self annotationConstellation asInspectorPresenter
]
