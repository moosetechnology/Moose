Class {
	#name : #FMDataStructurePrinter,
	#superclass : #FMParserClient,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'Fame-ImportExport'
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
