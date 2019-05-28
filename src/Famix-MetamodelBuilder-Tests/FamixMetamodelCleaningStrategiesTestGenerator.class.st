Class {
	#name : #FamixMetamodelCleaningStrategiesTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
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
FamixMetamodelCleaningStrategiesTestGenerator >> defineProperties [
	super defineProperties.
	fmx property: #property type: #String
]
