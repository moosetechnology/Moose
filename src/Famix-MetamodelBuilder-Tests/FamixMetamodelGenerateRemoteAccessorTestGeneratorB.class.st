Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTestGeneratorB,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx'
	],
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-B'
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB class >> prefix [

<ignoreForCoverage>
	^ #FmxTestGenerateAccessorB
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #EntityB
]
