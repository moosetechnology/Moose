Class {
	#name : #RTTest,
	#superclass : #TestCase,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #'useful documentation' }
RTTest >> readme [

"
Exporting the core of Roassal2 to Amber
Note that you need to have Trachel also exported

| exporter rootClasses soleClasses |
exporter := P2AExporterV11 new.
rootClasses := Array with: RTAnnounceableObject with: RTLayout.
rootClasses do: [ :c |
	c withAllSubclasses do: [ :cc | exporter addClass: cc ] ].
soleClasses := { RTObject . RTGroup. RTShape . RTAbstractElementShape . RTBox . RTEllipse . RTAbstractLine . RTLine . RTNoShape . RTLayoutTranslator . RTDirectLayoutTranslator}.
soleClasses do: [ :cc | exporter addClass: cc ].
exporter fileOutAsString


| exporter rootClasses |
exporter := P2AExporterV11 new.
rootClasses := Array with: RTShapeTest with: RTViewTest with: RTShape with: RTExample with: RTAnnounceableObject.
rootClasses do: [ :c |
	c withAllSubclasses do: [ :cc | exporter addClass: cc ] ].
exporter fileOutAsString

 

"
]

{ #category : #running }
RTTest >> setUp [
	super setUp.
" The following lines are useful for debugging

	'/tmp/results.txt' asFileReference writeStream 
		nextPutAll: self class name asString, '>>', testSelector asString;
		cr.
	
	Transcript show: self class name asString, '>>'.
	Transcript show: testSelector asString; cr"
]
