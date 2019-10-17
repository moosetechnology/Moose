Class {
	#name : #FMPrintClient,
	#superclass : #FMParserClient,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #testing }
FMPrintClient class >> isAbstract [
	^ self = FMPrintClient
]

{ #category : #private }
FMPrintClient >> crTabs [
	stream
		cr;
		tab: indent
]

{ #category : #accessing }
FMPrintClient >> onString [
	self onString: ''
]

{ #category : #accessing }
FMPrintClient >> onString: aString [
	self stream: aString writeStream
]

{ #category : #accessing }
FMPrintClient >> stream [
	^ stream
]

{ #category : #accessing }
FMPrintClient >> stream: aStream [
	stream := aStream.
	indent := 0
]
