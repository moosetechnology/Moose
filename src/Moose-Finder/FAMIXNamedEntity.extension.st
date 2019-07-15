Extension { #name : #FAMIXNamedEntity }

{ #category : #'*Moose-Finder' }
FAMIXNamedEntity >> mooseFinderAnnotationInstancesIn: composite [
	<moosePresentationOrder: 20>
	composite list
			title: 'Annotation instances';
			titleIcon: MooseIcons famixAnnotationInstanceGroup;
			display: [ self annotationInstances ];
			format: #mooseName;
			when: [ self annotationInstances notEmpty ]
]
