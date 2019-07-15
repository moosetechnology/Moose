Class {
	#name : #GLMSVGExportingAction,
	#superclass : #GLMAbstractExportingAction,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #hooks }
GLMSVGExportingAction >> doExportToFull: fileName [

	RTSVGExporter 
		exportBuilderAsSVG: self roassalView
		filename: fileName asAbsolute
]

{ #category : #hooks }
GLMSVGExportingAction >> extensions [
	^ #('SVG')
]

{ #category : #hooks }
GLMSVGExportingAction >> titleExtension [
	^ 'SVG'
	
]
