Class {
	#name : #SmalltalkCompatibilityMetamodelFactory,
	#superclass : #AbstractSmalltalkMetamodelFactory,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #accessing }
SmalltalkCompatibilityMetamodelFactory class >> defaultModel [
	^ FAMIXModel
]

{ #category : #accessing }
SmalltalkCompatibilityMetamodelFactory >> anchor [
	^ FAMIXPharoAnchor
]

{ #category : #accessing }
SmalltalkCompatibilityMetamodelFactory >> sourceLanguage [
	^ FAMIXSmalltalkSourceLanguage
]
