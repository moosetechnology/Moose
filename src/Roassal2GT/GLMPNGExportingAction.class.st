Class {
	#name : #GLMPNGExportingAction,
	#superclass : #GLMAbstractExportingAction,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMPNGExportingAction >> doExportToFull: fileName [

	RTPNGExporter new 
				builder: self roassalView;
				fileName: fileName fullName;
				exportToFile.
]

{ #category : #'as yet unclassified' }
GLMPNGExportingAction >> extensions [
	^ #('png')
]

{ #category : #'as yet unclassified' }
GLMPNGExportingAction >> titleExtension [
	^ 'PNG'
	
]
