"
Description
--------------------

I am a cleaning strategy that cleans nothing (Null design patter)
"
Class {
	#name : #FamixMetamodelGeneratorNoCleaningStrategy,
	#superclass : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Cleaning'
}

{ #category : #action }
FamixMetamodelGeneratorNoCleaningStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	"I do nothing because I am lazy"
]
