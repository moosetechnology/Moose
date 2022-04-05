Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> mooseIcon [
	^ MooseIcons famixPackageGroup 
]

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> viewComplexity [
	<menuItem: 'Package complexity' category: 'Visualize'>
	^ self complexity open
]

{ #category : #'*Moose-Finder' }
FamixPackageGroup >> viewDependenciesWithCycles [
	<menuItem: 'Dependencies (cycles)' category: 'Visualize'>
	^ self dependencies open
]
