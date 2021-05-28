Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> browseAsSelectionInSystemComplexityLocator [
	<menuItem: 'As selection within system complexity' category: 'Browse'> 
	MooseSystemComplexityLocator openOn: self mooseModel allModelClasses withSelection: self
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseIcon [
	^ MooseIcons famixClassGroup 
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewBlueprintComplexity [
	<menuItem: 'Blueprint complexity' category: 'Visualize'>
	^ self blueprintComplexity open
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewNesting [
	<menuItem: 'Nesting Map' category: 'Visualize'>
	^ self nesting open
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewSystemAttraction [
	<menuItem: 'System attraction' category: 'Visualize'>
	^ self systemAttraction open
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
