Extension { #name : #FAMIXContainerEntity }

{ #category : #'*Moose-Finder' }
FAMIXContainerEntity >> mooseFinderFunctionsIn: composite [
	<moosePresentationOrder: 40>
	composite list
		title: 'Functions';
		titleIcon: MooseIcons famixFunctionGroup;
		display: [ self functions ];
		format: [ :each | each mooseName ];
		when: [ self functions isNotEmpty ]
]

{ #category : #'*Moose-Finder' }
FAMIXContainerEntity >> mooseFinderTypesIn: composite [
	<moosePresentationOrder: 40>
	composite list
		title: 'Types';
		titleIcon: MooseIcons famixClassGroup;
		display: [ self types ];
		format: [ :each | each mooseName ];
		when: [ self types isNotEmpty ]
]
