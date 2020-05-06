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

	"If the new class has a trait precedence, we check that the current one also have the same. Else we need to adapt.
	If the new class does not have a trait precedent, we check that the current one also does not have one. Else we need to adapt."
	aRGClass properties
		at: #precedingTrait
		ifPresent: [ :aTrait | (self traitComposition isPrecedingSequence and: [ self traitComposition preferedTrait name = aTrait ]) ifFalse: [ ^ true ] ]
		ifAbsent: [ self traitComposition isPrecedingSequence ifTrue: [ ^ true ] ].

	(generatedTraitDefinitions equalsTo: aRGClass traitsDefinitions) ifFalse: [ ^ true ].

	((self generatedSlots collect: #definitionString) equalsTo: (aRGClass slots collect: #definitionString)) ifFalse: [ ^ true ].

	^ (self superclass ifNil: [ Trait ]) name ~= aRGClass superclass name
]
