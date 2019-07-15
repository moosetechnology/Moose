Extension { #name : #FamixNamespace }

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixNamespace >> mooseFinderWithinHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Within overall hierarchy';
			titleIcon: MooseIcons mooseCluster;
			initializeView: [ RTMondrian new ];
			painting: [ :view |
				self withAllChildScopes asMooseGroup viewWithinOverallHierarchyOn: view ]
]
