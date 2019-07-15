Class {
	#name : #GLMPNGExporting2Action,
	#superclass : #GLMAbstractExportingAction,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMPNGExporting2Action >> doExportToFull: fileName [
	RTPNGExporter new
		withScale;
		builder: self roassalView;
		fileName: fileName fullName;
		exportToFile.
]

{ #category : #hooks }
GLMPNGExporting2Action >> extensions [
	^ #('png')
]

{ #category : #hooks }
GLMPNGExporting2Action >> titleExtension [
	^ 'PNG with scale'
	
]
