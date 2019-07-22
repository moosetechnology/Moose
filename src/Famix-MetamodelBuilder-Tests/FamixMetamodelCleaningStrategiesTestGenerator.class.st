Class {
	#name : #FamixMetamodelCleaningStrategiesTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx',
		'tOneTrait',
		'fmx2'
	],
	#category : #'Famix-MetamodelBuilder-Tests-Helpers'
}

{ #category : #testing }
FamixMetamodelCleaningStrategiesTestGenerator class >> isRealMetamodel [
	^ false
]

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
	fmx := builder newClassNamed: #FmxTestEntity.
	fmx2 := builder newClassNamed: #FmxTestEntityWithDifferentSuperclass
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineHierarchy [
	super defineHierarchy.
	fmx --|> tOneTrait.
	fmx2 --|> fmx
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
	tOneTrait := builder newTraitNamed: #TATrait
]
