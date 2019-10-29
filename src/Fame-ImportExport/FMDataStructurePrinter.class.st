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
