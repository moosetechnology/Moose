Extension { #name : #FAMIXScopingEntity }

{ #category : #'*Moose-Finder' }
FAMIXScopingEntity >> mooseFinderChildrenTreeIn: composite [ 
	<moosePresentationOrder: 80>
	composite tree 
		titleIcon: MooseIcons mooseTree;
		title: 'Children tree';
		rootsExpanded;
		display: [:entity | {entity mooseInterestingEntity}];
		format: #name;
		children: [ :each | each structuralChildren sorted: [:entity1 :entity2 | entity1 name < entity2 name] ];
		icon: #mooseIcon
]
