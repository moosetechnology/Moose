Class {
	#name : #FamixMetamodelGeneratorTotalCleaningStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #action }
FamixMetamodelGeneratorTotalCleaningStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	[ aMetamodelGenerator packageName asPackage removeFromSystem ] on: NotFound  do: [ "Nothing because it just mean it was clean already" ]
]
