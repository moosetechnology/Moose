Extension { #name : #FAMIXPackageGroup }

{ #category : #'*moose-finder' }
FAMIXPackageGroup >> mooseFinderDependenciesIn: composite [
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
FAMIXPackageGroup >> mooseFinderPackageInternalIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Dependencies';
			titleIcon: MooseIcons mooseDependencies;
			initializeView: [ RTView new ];
			painting: [ :view :each | 
						each  viewPackageInternalOn: view ]
]

{ #category : #'*moose-finder' }
FAMIXPackageGroup >> mooseIcon [
	^ MooseIcons famixPackageGroup 
]
