Class {
	#name : #SmalltalkCompatibilityMetamodelFactory,
	#superclass : #AbstractSmalltalkMetamodelFactory,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> anchor [

	^ FAMIXPharoAnchor
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> defaultMetamodelClass [

	^ FamixCompatibilityGenerator
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> sourceLanguage [

	^ FAMIXSmalltalkSourceLanguage
]
