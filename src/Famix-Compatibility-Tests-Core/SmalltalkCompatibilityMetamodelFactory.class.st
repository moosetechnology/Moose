Class {
	#name : #SmalltalkCompatibilityMetamodelFactory,
	#superclass : #AbstractSmalltalkMetamodelFactory,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #accessing }
SmalltalkCompatibilityMetamodelFactory class >> defaultModel [
	^ FAMIXModel
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> anchor [
	^ FAMIXPharoAnchor
]

{ #category : #'as yet unclassified' }
SmalltalkCompatibilityMetamodelFactory >> sourceLanguage [
	^ FAMIXSmalltalkSourceLanguage
]
