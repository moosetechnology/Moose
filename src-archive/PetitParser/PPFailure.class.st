"
The failure object in PetitParser. It is the only class that responds to #isPetitFailure with true. It contains an error message and a position of the occurrence of the failure.

Instance Variables:
	message	<String>	The error message of this failure.
	position	<Integer>	The position of this failure in the input stream.

"
Class {
	#name : #PPFailure,
	#superclass : #Object,
	#instVars : [
		'message',
		'context',
		'position'
	],
	#category : #'PetitParser-Core'
}

{ #category : #'instance creation' }
PPFailure class >> message: aString [
	^ self basicNew initializeMessage: aString 
]

{ #category : #'instance creation' }
PPFailure class >> message: aString at: anInteger [
	"One should not use this method if the furthest failure is supposed to be reported correctly"
	^ self basicNew initializeMessage: aString at: anInteger
]

{ #category : #'instance creation' }
PPFailure class >> message: aString context: aPPContext [
	^ self basicNew initializeMessage: aString context: aPPContext
]

{ #category : #'instance creation' }
PPFailure class >> message: aString context: aPPContext at: position [
	^ self basicNew initializeMessage: aString context: aPPContext position: position
]

{ #category : #initialization }
PPFailure >> initializeMessage: aString [	
	message := aString.

]

{ #category : #initialization }
PPFailure >> initializeMessage: aString at: anInteger [
	"One should not use this method if the furthest failure is supposed to be reported correctly"
	message := aString.
	position := anInteger.
]

{ #category : #initialization }
PPFailure >> initializeMessage: aString context: aPPContext [
	self initializeMessage: aString context:  aPPContext position: aPPContext position
]

{ #category : #initialization }
PPFailure >> initializeMessage: aString context: aPPContext position: anInteger [
	message := aString.
	context := aPPContext.
	position := anInteger.
	
	"record the furthest failure encountered while parsing the input stream "
	aPPContext noteFailure: self.	
]

{ #category : #testing }
PPFailure >> isPetitFailure [
	"I am the only class that should implement this method to return true."

	^ true
]

{ #category : #accessing }
PPFailure >> message [
	"Answer a human readable error message of this parse failure."
	
	^ message
]

{ #category : #accessing }
PPFailure >> position [
	"Answer the position in the source string that caused this parse failure."

	^ position
]

{ #category : #printing }
PPFailure >> printOn: aStream [
	aStream 
		nextPutAll: (self message ifNil: ['<message not specified>']); 
		nextPutAll: ' at '; print: self position
]
