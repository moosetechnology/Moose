"
Description
--------------------

I am responsible of printing the MSE format markup during a model export.

Examples
--------------------

	| printer |
	printer := FMMSEPrinter onString.
	FMMetaMetaModel default exportWithPrinter: printer.
	printer stream contents
"
Class {
	#name : #FMMSEPrinter,
	#superclass : #FMDataStructurePrinter,
	#category : #'Fame-ImportExport-Exporters'
}

{ #category : #parsing }
FMMSEPrinter >> beginDocument [

	stream nextPut: $(
]

{ #category : #parsing }
FMMSEPrinter >> beginEntity: name [

	indent := indent + 1.
	self crTabs.
	stream 
		nextPut: $(;
		nextPutAll: name
]

{ #category : #parsing }
FMMSEPrinter >> beginProperty: name [

	indent := indent + 1.
	self crTabs.
	stream 
		nextPut: $(;
		nextPutAll: name
]

{ #category : #parsing }
FMMSEPrinter >> endDocument [
	stream nextPut: $)
]

{ #category : #parsing }
FMMSEPrinter >> endEntity: name [

	stream nextPut: $).
	indent := indent - 1
]

{ #category : #parsing }
FMMSEPrinter >> endProperty: name [

	stream nextPut: $).
	indent := indent - 1
]

{ #category : #parsing }
FMMSEPrinter >> primitive: value [
	stream space.
	value msePrintOn: stream
]

{ #category : #parsing }
FMMSEPrinter >> referenceName: name [
	stream
		space;
		nextPut: $(;
		nextPutAll: #ref:;
		space;
		nextPutAll: name;
		nextPut: $)
]

{ #category : #parsing }
FMMSEPrinter >> referenceNumber: index [
	stream
		space;
		nextPut: $(;
		nextPutAll: #ref:;
		space;
		print: index;
		nextPut: $)
]

{ #category : #parsing }
FMMSEPrinter >> serial: index [
	stream
		space;
		nextPut: $(;
		nextPutAll: #id:;
		space;
		print: index;
		nextPut: $)
]
