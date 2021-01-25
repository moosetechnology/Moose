Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> browseAsSelectionInSystemComplexityLocator [
	<menuItem: 'As selection within system complexity' category: 'Browse'> 
	MooseSystemComplexityLocator openOn: self mooseModel allModelClasses withSelection: self
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderComplexityIn: composite [
	<moosePresentationOrder: 20>
	self systemComplexity appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderNestingIn: composite [
	<moosePresentationOrder: 30>
	self nesting appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderUMLIn: composite [
	<moosePresentationOrder: 20>
	self uml appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseIcon [
	^ MooseIcons famixClassGroup 
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewNesting [
	<menuItem: 'Nesting Map' category: 'Visualize'>
	self nesting open
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewSystemComplexity [
	<menuItem: 'System complexity' category: 'Visualize'>
	^ self systemComplexity open
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'>
	^ self uml open
]
