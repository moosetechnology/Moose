Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixAnnotationTypeGroup >> annotationConstellation [
	^ FamixAnnotationTypeGroupConstellation forAnnotationTypeGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixAnnotationTypeGroup >> viewAnnotationConstellation [
	<menuItem: 'Annotation Constellation' category: 'Visualize'>
	self annotationConstellation open
]
