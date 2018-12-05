Class {
	#name : #SmalltalkCompatibilityMetamodelFactory,
	#superclass : #AbstractSmalltalkMetamodelFactory,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> anchor [

	^ self entityNamed: #PharoAnchor
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> defaultMetamodelClass [

	^ FamixCompatibilityGenerator
]
