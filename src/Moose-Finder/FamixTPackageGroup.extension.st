Extension { #name : #FamixTPackageGroup }

{ #category : #'*moose-finder' }
FamixTPackageGroup >> mooseFinderDependenciesIn: composite [
	"Does not work, and no idea how to fix it"
	"<moosePresentationOrder: 20>"
	composite roassal2
			title: 'Dependencies';
			titleIcon: MooseIcons mooseDependencies;
			initializeView: [ RTMondrian new ];
			painting: [ :view :each | 
						each mooseInterestingEntity viewDependenciesWithCyclesOn: view ]
]

{ #category : #'*moose-finder' }
FamixTPackageGroup >> mooseFinderPackageInternalIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Dependencies';
			titleIcon: MooseIcons mooseDependencies;
			initializeView: [ RTView new ];
			painting: [ :view :each | 
						each  viewPackageInternalOn: view ]
]

{ #category : #'*moose-finder' }
FamixTPackageGroup >> mooseIcon [
	^ MooseIcons famixPackageGroup 
]
