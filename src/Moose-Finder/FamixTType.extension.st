Extension { #name : #FamixTType }

{ #category : #'*Moose-Finder' }
FamixTType >> mooseFinderBlueprintIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2 
			title: 'Blueprint';
			titleIcon: MooseIcons mooseBlueprint;
			painting: [ :view :each | 
				view @ RTDraggableView.
				each mooseInterestingEntity viewBlueprintOn: view.
				self addBlueprintLegendOn: view.
 ]
]
