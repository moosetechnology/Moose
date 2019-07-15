Extension { #name : #FAMIXNamespaceGroup }

{ #category : #'*moose-finder' }
FAMIXNamespaceGroup >> mooseFinderWithinHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Within overall hierarchy';
			titleIcon: MooseIcons mooseCluster;
			initializeView: [ RTMondrian new ];
			painting: [ :view :each |
				each mooseInterestingEntity viewWithinOverallHierarchyOn: view ]
]

{ #category : #'*moose-finder' }
FAMIXNamespaceGroup >> mooseIcon [
	^ MooseIcons famixNamespaceGroup 
]
