Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMExporterTest >> testExportAsMSE [
	| printer |
	printer := FMMSEPrinter new onString.
	FMMetaMetaRepository new accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #running }
FMExporterTest >> testExportAsXML [
	| printer |
	printer := FMXMLPrinter new onString.
	FMMetaMetaRepository new accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]
