Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMExporterTest >> testExportAsMSE [
	| printer |
	printer := FMMSEPrinter new onString.
	FMMetaRepository fm3 accept: printer.
	printer stream contents isString should beTrue.
	printer stream contents first should equal: $(
]

{ #category : #running }
FMExporterTest >> testExportAsXML [
	| printer |
	printer := FMXMLPrinter new onString.
	FMMetaRepository fm3 accept: printer.
	printer stream contents isString should beTrue.
	printer stream contents first should equal: $<
]
