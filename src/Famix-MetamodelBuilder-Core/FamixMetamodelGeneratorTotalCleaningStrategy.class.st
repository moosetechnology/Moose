Class {
	#name : #FamixMetamodelGeneratorTotalCleaningStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #action }
FamixMetamodelGeneratorTotalCleaningStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	aMetamodelGenerator generatedPackage ifNotNil: #removeFromSystem
]
