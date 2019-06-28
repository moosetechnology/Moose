Extension { #name : #Class }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlotNames [
	^ self slots select: #isFameSlot thenCollect: #name
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedTraitNames [
	^ self traits select: #isMetamodelEntity thenCollect: #name
]
