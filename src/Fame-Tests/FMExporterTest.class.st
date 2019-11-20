Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMExporterTest >> testExportAsMSE [
	| printer |
	printer := FMMSEPrinter onString.
	FMMetaMetaModel default exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #tests }
FMExporterTest >> testExportAsXML [
	| printer |
	printer := FMXMLPrinter onString.
	FMMetaMetaModel default exportWithPrinter: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]

{ #category : #tests }
FMExporterTest >> testExportedModelIsTheSameAsBeforeExport [
	| metamodel printer |
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.

	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 3.
	self assert: metamodel properties size equals: 6.

	printer := FMMSEPrinter onString.
	metamodel exportWithPrinter: printer.
	metamodel := FMMetaModel fromString: printer stream contents.

	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 3.
	self assert: metamodel properties size equals: 6
]
