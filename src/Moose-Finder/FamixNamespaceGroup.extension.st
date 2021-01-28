Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> mooseFinderWithinHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Within overall hierarchy';
			titleIcon: MooseIcons mooseCluster;
			initializeView: [ RTMondrian new ];
			painting: [ :view :each |
				each mooseInterestingEntity viewWithinOverallHierarchyOn: view ]
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> mooseIcon [
	^ MooseIcons famixNamespaceGroup 
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> viewDependenciesWithCycles [
	<menuItem: 'Dependencies (cycles)' category: 'Visualize'>
	self dependencies open
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> viewHierarchy [
	<menuItem: 'Namespace Hierarchy' category: 'Visualize'>
	self hierarchy open
]
