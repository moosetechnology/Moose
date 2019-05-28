Class {
	#name : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#superclass : #Object,
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #testing }
FamixAbstractMetamodelGeneratorCleaningStrategy class >> isAbstract [
	^ self = FamixAbstractMetamodelGeneratorCleaningStrategy
]

{ #category : #action }
FamixAbstractMetamodelGeneratorCleaningStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	self subclassResponsibility
]
