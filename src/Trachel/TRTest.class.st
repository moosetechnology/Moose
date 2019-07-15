Class {
	#name : #TRTest,
	#superclass : #TestCase,
	#category : #'Trachel-Tests'
}

{ #category : #documentation }
TRTest >> readme [

"
Exporting to Amber

| exporter rootClasses |
exporter := P2AExporterV11 new.
rootClasses := Array with: TREvent with: TRObject with: TRTest.
rootClasses do: [ :c |
	c withAllSubclasses do: [ :cc | exporter addClass: cc ] ].
exporter fileOutAsString

 

"
]

{ #category : #running }
TRTest >> setUp [
	super setUp.
	Transcript show: self class name asString, '>>'.
	Transcript show: testSelector asString; cr
]
