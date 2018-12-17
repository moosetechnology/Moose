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

{ #category : #tests }
RTSVGExporterTest >> testEmpty [
	
	| v str |
	v := RTView new.

	str := WriteStream on: String new.
	RTSVGExporter new view: v; exportOnStream: str.
	self assert: str contents equals: '<svg  xmlns="http://www.w3.org/2000/svg" width="3px" height="3px" style="background-color: rgba(256,256,256,1.0);float:left" 
	xmlns:xlink="http://www.w3.org/1999/xlink">
<defs></defs></svg>'
]
