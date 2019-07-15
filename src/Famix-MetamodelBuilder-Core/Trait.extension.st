Extension { #name : #Trait }

{ #category : #'*Famix-MetamodelBuilder-Core' }
Trait class >> named: aName uses: aTraitCompositionOrCollection slots: someSlots package: aCategory [

	^ self named: aName uses: aTraitCompositionOrCollection slots: someSlots category: aCategory
]
