Extension { #name : #FamixTType }

{ #category : #'*Moose-Finder' }
FamixTType >> mooseFinderBlueprintIn: composite [
	<moosePresentationOrder: 20>
	composite roassal3
		title: 'Blueprint';
		titleIcon: MooseIcons mooseBlueprint;
		initializeCanvas: [ FamixBlueprint new
				view: self mooseInterestingEntity;
				canvas ]
]
