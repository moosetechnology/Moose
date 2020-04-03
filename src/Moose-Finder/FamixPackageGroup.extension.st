Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> mooseFinderDependenciesIn: composite [
	"Does not work, and no idea how to fix it"
	"<moosePresentationOrder: 20>"
	composite roassal2
			title: 'Dependencies';
			titleIcon: MooseIcons mooseDependencies;
			initializeView: [ RTMondrian new ];
			painting: [ :view :each | 
						each mooseInterestingEntity viewDependenciesWithCyclesOn: view ]
]

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> mooseFinderPackageInternalIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Dependencies';
			titleIcon: MooseIcons mooseDependencies;
			initializeView: [ RTView new ];
			painting: [ :view :each | 
						each  viewPackageInternalOn: view ]
]

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> mooseIcon [
	^ MooseIcons famixPackageGroup 
]
