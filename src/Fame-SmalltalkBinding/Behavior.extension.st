Extension { #name : #Behavior }

{ #category : #'*Fame-SmalltalkBinding' }
Behavior >> allGeneratedTraits [
	^ self traitComposition allTraits select: #isMetamodelEntity
]
