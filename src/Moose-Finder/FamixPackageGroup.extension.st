Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> mooseFinderDependenciesIn: composite [
	<moosePresentationOrder: 20>
	self dependencies appearInPaneComposite: composite
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

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> viewDependenciesWithCycles [
	<menuItem: 'Dependencies (cycles)' category: 'Visualize'>
	self dependencies open
]
