Extension { #name : #Behavior }

{ #category : #'*Moose-Query' }
Behavior >> allGeneratedTraits [
	^ self traitComposition allTraits select: #isMetamodelEntity
]
