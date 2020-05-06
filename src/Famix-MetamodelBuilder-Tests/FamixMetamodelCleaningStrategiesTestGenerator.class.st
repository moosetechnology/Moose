Class {
	#name : #FamixMetamodelCleaningStrategiesTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx',
		'tOneTrait',
		'fmx2',
		'fmx3',
		'tTwoTrait'
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
	fmx2 := builder newClassNamed: #FmxTestEntityWithDifferentSuperclass.
	fmx3 := builder newClassNamed: #FmxTestEntityWithTraitPrecedenceToRemove
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineHierarchy [
	super defineHierarchy.
	
	fmx --|> tOneTrait.
	
	fmx2 --|> fmx.
	
	fmx3 --|> tOneTrait.
	fmx3 --|> tTwoTrait
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineProperties [
	super defineProperties.
	fmx property: #property type: #String
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineRelations [
	super defineRelations.
	fmx <>- fmx.
	(fmx2 property: #furry) *- (fmx property: #fursonas) 
]

{ #category : #definition }
FamixMetamodelCleaningStrategiesTestGenerator >> defineTraits [
	super defineTraits.
	tOneTrait := builder newTraitNamed: #TATrait.
	tTwoTrait := builder newTraitNamed: #TATrait2.
]
