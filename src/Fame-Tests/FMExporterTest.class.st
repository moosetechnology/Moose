Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMExporterTest >> testExportAsMSE [
	| printer |
	printer := FMMSEPrinter onString.
	FMMetaMetaModel new exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #tests }
FMExporterTest >> testExportAsXML [
	| printer |
	printer := FMXMLPrinter onString.
	FMMetaMetaModel new exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]
