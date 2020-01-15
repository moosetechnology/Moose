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

{ #category : #tests }
FMExporterTest >> testMSEExportWithWrongTypeRaiseError [
	| printer model |
	model := FMModel withMetamodel: FMEquationSystemExample createMetamodel.

	model
		add:
			(EQNumerical new
				number: DateAndTime now; "Here a number primitive is expected but a date and time is passed."
				yourself).

	printer := FMMSEPrinter onString.
	self should: [ model exportWithPrinter: printer ] raise: Error
]
