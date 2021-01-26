Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseFinderAnnotationConstallationOn: composite [
	<moosePresentationOrder: 30>
	self annotationConstellation appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]
