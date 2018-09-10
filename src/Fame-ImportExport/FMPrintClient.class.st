Class {
	#name : #FMPrintClient,
	#superclass : #FMParserClient,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #private }
FMPrintClient >> crTabs [

	stream cr; tab: indent.
]

{ #category : #accessing }
FMPrintClient >> onString [
	
	self onString: String new
]

{ #category : #accessing }
FMPrintClient >> onString: aString [
	
	self stream: aString writeStream.
]

{ #category : #accessing }
FMPrintClient >> stream [
	^stream
]

{ #category : #accessing }
FMPrintClient >> stream: aStream [

	stream := aStream.
	indent := 0.
]
