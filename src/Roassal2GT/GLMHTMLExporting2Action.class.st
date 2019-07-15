Class {
	#name : #GLMHTMLExporting2Action,
	#superclass : #GLMAbstractExportingAction,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMHTMLExporting2Action >> doExportToFull: fileName [
	RTHTML5Exporter new 
		directory: fileName parent;
		fileName: fileName basename; 
		export: self roassalView.

]

{ #category : #hooks }
GLMHTMLExporting2Action >> extensions [
	^ #('html')
]

{ #category : #hooks }
GLMHTMLExporting2Action >> titleExtension [
	^ 'HTML...'
]
