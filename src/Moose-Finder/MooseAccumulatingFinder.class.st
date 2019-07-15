"
MooseAccumulatingFinder new openOn: MooseModel root allModels first
"
Class {
	#name : #MooseAccumulatingFinder,
	#superclass : #GLMCompositePresentation,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseAccumulatingFinder >> compose [
	self accumulator
		with: [ :accumulator | 
			accumulator
				title: 'Moose Finder';
				show: [ :a | 
							a title: [ :entity | entity mooseInterestingEntity mooseName ].
							a custom: MooseFinder new first noTitle ].
			accumulator transmit
				toOutsidePort: #entity;
				fromOutsidePort: #strongSelection ]
]
