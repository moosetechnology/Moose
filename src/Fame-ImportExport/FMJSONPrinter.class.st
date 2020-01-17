Class {
	#name : #FMJSONPrinter,
	#superclass : #FMDataStructurePrinter,
	#category : #'Fame-ImportExport-Exporters'
}

{ #category : #parsing }
FMJSONPrinter >> beginDocument [

	stream nextPut: $[
]

{ #category : #parsing }
FMJSONPrinter >> beginEntity: name [
	indent := indent + 1.
	stream nextPutAll: '{'.
	self crTabs.
	stream
		nextPutAll: '"FM3": "';
		nextPutAll: name;
		nextPutAll: '",'.
	self crTabs
]

{ #category : #parsing }
FMJSONPrinter >> beginMultivalue: anEntity [
	stream nextPut: $[
]

{ #category : #parsing }
FMJSONPrinter >> beginProperty: name [
	self crTabs.
	stream 
		nextPut: $";
		nextPutAll: name;
		nextPut: $";
		nextPut: $:
]

{ #category : #parsing }
FMJSONPrinter >> endDocument [
	self crTabs.
	stream nextPut: $]
]

{ #category : #parsing }
FMJSONPrinter >> endEntity: name [
	self crTabs.
	stream nextPut: $}.
	indent := indent - 1
]

{ #category : #parsing }
FMJSONPrinter >> endMultivalue: anEntity [
	stream nextPut: $]
]

{ #category : #parsing }
FMJSONPrinter >> endProperty: name [
]

{ #category : #parsing }
FMJSONPrinter >> primitive: value [
	value isString
		ifTrue: [ 
			stream nextPut: $".
			value do: [ :char | 
				| charToPrint |
				$" == char ifTrue: [ stream nextPut: $\ ].
				Character cr == char ifTrue: [ 
					stream nextPut: $\.
					charToPrint := $n ].
				Character tab == char ifTrue: [ 
					stream nextPut: $\.
					charToPrint := $t ].
				stream nextPut: (charToPrint ifNil: [ char ]) ].
			stream nextPut: $" ]
		ifFalse: [ value msePrintOn: stream ]
]

{ #category : #parsing }
FMJSONPrinter >> printEntitySeparator [
	stream nextPut: $,
]

{ #category : #parsing }
FMJSONPrinter >> printPropertySeparator [
	stream nextPut: $,
]

{ #category : #parsing }
FMJSONPrinter >> referenceName: name [
	stream
		space;
		nextPut: ${;
		nextPutAll: '"ref":';
		space;
		nextPut: $";
		nextPutAll: name;
		nextPut: $";
		nextPut: $}
]

{ #category : #parsing }
FMJSONPrinter >> referenceNumber: index [
	stream
		space;
		nextPut: ${;
		nextPutAll: '"ref":';
		space;
		print: index;
		nextPut: $}
]

{ #category : #parsing }
FMJSONPrinter >> serial: index [
	
	stream 
		space;
		nextPutAll: '"id":';
		print: index;
		nextPut: $,
]
