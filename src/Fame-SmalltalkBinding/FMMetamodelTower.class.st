Class {
	#name : #FMMetamodelTower,
	#superclass : #FMModelTower,
	#instVars : [
		'metamodel'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'as yet unclassified' }
FMMetamodelTower >> metamodel [
	^metamodel
]

{ #category : #accessing }
FMMetamodelTower >> metamodel: aMetaRepository [
	^metamodel := aMetaRepository
]
