Extension { #name : #RGTraitComposition }

{ #category : #'*Calypso-Ring2' }
RGTraitComposition >> allTraits [

	^self traits flatCollect: [:trait |
		trait hasTraitComposition
			ifTrue: [trait traitComposition allTraits copyWith: trait]
			ifFalse: [Array with: trait]]
]
