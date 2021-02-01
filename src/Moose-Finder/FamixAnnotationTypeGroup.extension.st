Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseFinderAnnotationConstallationOn: composite [
	<moosePresentationOrder: 30>
	^ self annotationConstellation appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> viewAnnotationConstellation [
	<menuItem: 'Annotation Constellation' category: 'Visualize'>
	^ self annotationConstellation open
]
