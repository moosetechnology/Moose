Extension { #name : #Class }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> customTraitNames [
	^ self traits reject: #isMetamodelEntity thenCollect: #name
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlots [
	^ self localSlots select: #isFameSlot
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedTraitNames [
	^ self generatedTraits collect: #name
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedTraits [
	^ self traits select: #isMetamodelEntity
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> needToAdaptTo: aRGClass [
	| generatedTraitNames generatedTraitDefinitions |
	generatedTraitNames := self generatedTraitNames.

	"We need to manage the cases where it will be things like `FamixJavaTStructuralEntity - {#mooseNameOn:}`"
	generatedTraitDefinitions := self traitComposition rootMembers
		select: [ :member | generatedTraitNames includes: member name ]
		thenCollect: #traitCompositionExpression.

	aRGClass properties at:#precedingTrait ifPresent: [ :aTrait | 
		self traitComposition isPrecedingSequence ifFalse: [ ^ true ].
		(self traitComposition preferedTrait name = aTrait) ifFalse: [ ^ true ]].

	(generatedTraitDefinitions equalsTo: aRGClass traitsDefinitions) ifFalse: [ ^ true ].

	((self generatedSlots collect: #definitionString) equalsTo: (aRGClass slots collect: #definitionString)) ifFalse: [ ^ true ].

	^ (self superclass ifNil: [ Trait ]) name ~= aRGClass superclass name
]
