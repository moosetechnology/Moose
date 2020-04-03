Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> gtInspectorAnnotationConstallationOn: composite [
	<gtInspectorPresentationOrder: 40>
	composite roassal2
		title: 'Constellation';
		initializeView: [ RTMondrian new ];
		painting: [ :view | self viewAnnotationConstellationOn: view]
]

{ #category : #'*Moose-Finder' }
FamixAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]
