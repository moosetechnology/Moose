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
	^ ((self generatedTraits collect: #name) asSet
		= (aRGClass traitComposition transformations collect: #name) asSet
		and: [ (self generatedSlots collect: #name) asSet
				= (aRGClass slots collect: #name) asSet
				and:
					[ (self superclass ifNil: [ Trait ]) name = aRGClass superclass name ] ])
		not
]
