Class {
	#name : #RTSVGExporterTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #tests }
RTSVGExporterTest >> testBasic [
	
	| b str |
	b := RTMondrian new.
	b nodes: Collection withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b build.

	str := WriteStream on: String new.
	RTSVGExporter new view: b view; exportOnStream: str
]
