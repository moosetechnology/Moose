Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> viewAnnotationConstellation [
	<menuItem: 'Annotation Constellation' category: 'Visualize'>
	^ self annotationConstellation open
]
