"
Description
--------------------

I am an abstract class to define the API of cleaning strategies.

Cleaning strategies are used by a MM generator to know how to regenerate a MM.
"
Class {
	#name : #FamixAbstractMetamodelGeneratorCleaningStrategy,
	#superclass : #Object,
	#category : #'Famix-MetamodelBuilder-Core-Cleaning'
}

{ #category : #testing }
FamixAbstractMetamodelGeneratorCleaningStrategy class >> isAbstract [
	^ self = FamixAbstractMetamodelGeneratorCleaningStrategy
]

{ #category : #action }
FamixAbstractMetamodelGeneratorCleaningStrategy >> cleanBeforeGeneration: aMetamodelGenerator [
	self subclassResponsibility
]

{ #category : #action }
FamixAbstractMetamodelGeneratorCleaningStrategy >> withCleaningDo: aBlock with: aMetamodelGenerator [
	self cleanBeforeGeneration: aMetamodelGenerator.
	aBlock value
]
