Extension { #name : #Behavior }

{ #category : #'*Fame-Core' }
Behavior >> allGeneratedTraits [
	^ self traitComposition allTraits select: #isMetamodelEntity
]
