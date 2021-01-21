Extension { #name : #FamixTType }

{ #category : #'*Moose-Finder' }
FamixTType >> mooseFinderBlueprintIn: composite [
	<moosePresentationOrder: 20>
	self blueprint appearInPaneComposite: composite
]

{ #category : #'*Moose-Finder' }
FamixTType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	self blueprint open
]

{ #category : #'*Moose-Finder' }
FamixTType >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'>
	^ self uml open
]
