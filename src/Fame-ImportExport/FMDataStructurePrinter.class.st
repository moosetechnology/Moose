"
Description
--------------------

During the export of a model, multiple data structure can be used. (MSE, XML, JSON...)

I am an abstract class responsible of the printing of the data structure of the model export.

I'll not export the entities, but I'll export the markup around them.
	 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	indent:		<anInteger>		The current indentation of the export.
	stream:		<aStream>			The stream on which I need to print the markup structure.

"
Class {
	#name : #FMDataStructurePrinter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'Fame-ImportExport-Exporters'
}

{ #category : #testing }
FMDataStructurePrinter class >> isAbstract [
	^ self = FMDataStructurePrinter
]

{ #category : #'instance creation' }
FMDataStructurePrinter class >> on: aStream [
	^ self new
		stream: aStream;
		yourself
]

{ #category : #accessing }
FMDataStructurePrinter class >> onString [
	^ self on: '' writeStream
]

{ #category : #private }
FMDataStructurePrinter >> crTabs [
	stream
		cr;
		tab: indent
]

{ #category : #accessing }
FMDataStructurePrinter >> stream [
	^ stream
]

{ #category : #accessing }
FMDataStructurePrinter >> stream: aStream [
	stream := aStream.
	indent := 0
]
