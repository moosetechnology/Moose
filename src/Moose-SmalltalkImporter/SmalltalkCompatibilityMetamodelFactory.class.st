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

	^ FamixPharoSmalltalkGenerator 
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> sourceLanguage [

	^ FAMIXSmalltalkSourceLanguage
]
