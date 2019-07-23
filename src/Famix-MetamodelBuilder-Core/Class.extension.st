Extension { #name : #Class }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> customTraits [
	^ self traits reject: #isMetamodelEntity
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlotNames [
	^ self generatedSlots collect: #name
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
	(self generatedTraitNames equalsTo: (aRGClass traitComposition transformations collect: #name)) ifFalse: [ ^ true ].

	(self generatedSlotNames equalsTo: (aRGClass slots collect: #name)) ifFalse: [ ^ true ].

	^ (self superclass ifNil: [ Trait ]) name ~= aRGClass superclass name
]
