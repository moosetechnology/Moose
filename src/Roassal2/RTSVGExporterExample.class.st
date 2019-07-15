"
A RTSVGExporterExample is the example class for RTSVGExporter.
"
Class {
	#name : #RTSVGExporterExample,
	#superclass : #RTObject,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #simple }
RTSVGExporterExample >> exampleDependencyAnalyzerBuilder [
	
	"self new exampleDependencyAnalyzerBuilder"
	| b |	
	b := RTMondrian new.
	b nodes: Collection withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	^ b view.

	"This line does the export."
	"RTSVGExporter exportBuilderAsSVG: b filename:'exampleDependencyAnalyzerBuilder'."
]
