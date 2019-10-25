Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #running }
FMExporterTest >> testExportAsMSE [
	| printer |
	printer := FMMSEPrinter onString.
	FMMetaMetaModel new exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #running }
FMExporterTest >> testExportAsXML [
	| printer |
	printer := FMXMLPrinter onString.
	FMMetaMetaModel new exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]
