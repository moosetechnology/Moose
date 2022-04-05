Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixAnnotationTypeGroup >> annotationConstellation [
	^ FamixAnnotationTypeGroupConstellation forAnnotationTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixAnnotationTypeGroup >> inspectorShowAnnotationConstellation [

	<inspectorPresentationOrder: 10 title: 'Annotation Constellation'>
	^ self annotationConstellation asInspectorPresenter
]
