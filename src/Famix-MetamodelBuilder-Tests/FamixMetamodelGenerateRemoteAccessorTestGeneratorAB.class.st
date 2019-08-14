Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTestGeneratorAB,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'entityA',
		'entityB'
	],
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #testing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB class >> isRealMetamodel [
	^ false
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-AB'
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB class >> prefix [

<ignoreForCoverage>
	^ #FmxTestGenerateAccessorAB
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB class >> submetamodels [
	^ {FamixMetamodelGenerateRemoteAccessorTestGeneratorA . FamixMetamodelGenerateRemoteAccessorTestGeneratorB}
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB >> defineClasses [
	super defineClasses.
	entityA := self remoteEntity: #EntityA withPrefix: #FmxTestGenerateAccessorA.
	entityB := self remoteEntity: #EntityB withPrefix: #FmxTestGenerateAccessorB
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAB >> defineRelations [
	super defineRelations.
	(entityA property: #relationToB) - (entityB property: #relationToA).
	(entityA property: #manyB) -* (entityB property: #oneA).
	(entityA property: #manyManyB) *-* (entityB property: #manyManyA).
]
