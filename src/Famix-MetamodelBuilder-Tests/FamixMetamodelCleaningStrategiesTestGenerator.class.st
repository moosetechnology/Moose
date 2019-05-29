Class {
	#name : #FamixMetamodelCleaningStrategiesTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx',
		'tOneTrait'
	],
	#category : #'Famix-MetamodelBuilder-Tests-Helpers'
}

{ #category : #accessing }
FamixMetamodelCleaningStrategiesTestGenerator class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources'
]

{ #category : #accessing }
FamixMetamodelCleaningStrategiesTestGenerator class >> prefix [

	<ignoreForCoverage>
	^ #FmxTestCleaningStrategy
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #FmxTestEntity
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineHierarchy [
	super defineHierarchy.
	fmx --|> tOneTrait
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineProperties [
	super defineProperties.
	fmx property: #property type: #String
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineRelations [
	super defineRelations.
	fmx <>- fmx
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineTraits [
	super defineTraits.
	tOneTrait := builder newTraitNamed: #TATrait.
]
