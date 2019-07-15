Class {
	#name : #GLMHTMLExportingWithoutFixedShapesAction,
	#superclass : #GLMAbstractExportingAction,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMHTMLExportingWithoutFixedShapesAction >> doExportToFull: fileName [
	RTHTML5Exporter new 
		directory: fileName parent;
		fileName: fileName basename; 
		exportFixedShapes: false;
		export: self roassalView.

]

{ #category : #hooks }
GLMHTMLExportingWithoutFixedShapesAction >> extensions [
	^ #('html')
]

{ #category : #hooks }
GLMHTMLExportingWithoutFixedShapesAction >> titleExtension [
	^ 'HTML (without fixed shapes)...'
]
