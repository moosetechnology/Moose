Extension { #name : #Class }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> customTraits [
	^ self traits reject: #isMetamodelEntity
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlotNames [
	^ self localSlots select: #isFameSlot thenCollect: #name
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedSlots [
	self flag: #toRemoveSlotGeneration.	"The code of this method should be:
	
	self slots select: #isFameSlot
	
	The problem is that currently, some classes override #generatedSlotNames to change the result. After new generations this should vanish. So, we will keep the current implementation for some month. Then we can remove this version and use the one in this comment. Browse all senders of toRemoveSlotGeneration to remove all hacks related to this change.
	
	Remove in 2020."
	^ (self generatedSlotNames collect: [ :slotName | self slotNamed: slotName ifFound: [ :slot | slot ] ifNone: nil ]) select: #notNil
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> generatedTraits [
	^ self traits select: #isMetamodelEntity
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
Class >> needToAdaptTo: aRGClass [
	^ ((self generatedTraits collect: #name) asSet = (aRGClass traitComposition transformations collect: #name) asSet
		and: [ (self generatedSlots collect: #name) asSet = (aRGClass slots collect: #name) asSet ]) not
]
