Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> mooseIcon [
	^ MooseIcons famixNamespaceGroup 
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> viewDependenciesWithCycles [
	<menuItem: 'Dependencies (cycles)' category: 'Visualize'>
	^ self dependencies open
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> viewHierarchy [
	<menuItem: 'Namespace Hierarchy' category: 'Visualize'>
	^ self hierarchy open
]

{ #category : #'*Moose-Finder' }
FamixNamespaceGroup >> viewWithinOverallHierarchy [
	<menuItem: 'Within overall hierarchy' category: 'Visualize'>
	^ self withinOverallHierarchy open
]
