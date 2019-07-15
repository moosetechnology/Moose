Extension { #name : #FAMIXAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FAMIXAnnotationTypeGroup >> gtInspectorAnnotationConstallationOn: composite [
	<gtInspectorPresentationOrder: 40>
	composite roassal2
		title: 'Constellation';
		initializeView: [ RTMondrian new ];
		painting: [ :view | self viewAnnotationConstellationOn: view]
]

{ #category : #'*Moose-Finder' }
FAMIXAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]
