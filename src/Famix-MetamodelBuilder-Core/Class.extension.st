Extension { #name : #Class }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlotNames [
	^ #()
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedTraitNames [
	^ self traits select: #isMetamodelEntity thenCollect: #name
]
