Extension { #name : #FamixTAnnotationTypeGroup }

{ #category : #'*Moose-Finder' }
FamixTAnnotationTypeGroup >> gtInspectorAnnotationConstallationOn: composite [
	<gtInspectorPresentationOrder: 40>
	composite roassal2
		title: 'Constellation';
		initializeView: [ RTMondrian new ];
		painting: [ :view | self viewAnnotationConstellationOn: view]
]

{ #category : #'*Moose-Finder' }
FamixTAnnotationTypeGroup >> mooseIcon [
	^ MooseIcons famixAnnotationTypeGroup
]
