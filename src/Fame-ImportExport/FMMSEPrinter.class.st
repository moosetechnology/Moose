Class {
	#name : #FMMSEPrinter,
	#superclass : #FMPrintClient,
	#category : #'Fame-ImportExport'
}

{ #category : #parsing }
FMMSEPrinter >> beginAttribute: name [

	indent := indent + 1.
	self crTabs.
	stream 
		nextPut: $(;
		nextPutAll: name
]

{ #category : #parsing }
FMMSEPrinter >> beginDocument [

	stream nextPut: $(
]

{ #category : #parsing }
FMMSEPrinter >> beginElement: name [

	indent := indent + 1.
	self crTabs.
	stream 
		nextPut: $(;
		nextPutAll: name
]

{ #category : #parsing }
FMMSEPrinter >> endAttribute: name [

	stream nextPut: $).
	indent := indent - 1
]

{ #category : #parsing }
FMMSEPrinter >> endDocument [
	stream nextPut: $)
]

{ #category : #parsing }
FMMSEPrinter >> endElement: name [

	stream nextPut: $).
	indent := indent - 1
]

{ #category : #'initialize-release' }
FMMSEPrinter >> initialize [
	stream := nil.
	indent := nil
]

{ #category : #parsing }
FMMSEPrinter >> primitive: value [

	stream space.
	value fm3PrintOn: stream
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
