Class {
	#name : #RTHTML5ExporterTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Exporter-HTML5'
}

{ #category : #tests }
RTHTML5ExporterTest >> testBasic [
	| view stream |
	view := RTView new.
	view add: RTBox element.
	stream := WriteStream on: String new.
	[RTHTML5Exporter new 	
		export: view toStream: stream;
		insert: view named: 'foo' inPillarStream: stream.
	] ensure: [ 
		'roassal.js' asFileReference ensureDelete.
		'foo.html' asFileReference ensureDelete. ]
			
	
]
