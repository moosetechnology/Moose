"
This is a utility class that holds information related to the origin of the Moose image. It is typically instantiated at image creation time and the information is stored following the singleton pattern.
"
Class {
	#name : #MooseImage,
	#superclass : #Object,
	#instVars : [
		'signature',
		'timeStamp'
	],
	#classVars : [
		'current'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
MooseImage class >> current [
	^ current ifNil: [ current := MooseImage new ]
]

{ #category : #initialize }
MooseImage >> initialize [
	timeStamp := DateAndTime now.
	signature := 'Unknown'
]

{ #category : #printing }
MooseImage >> printOn: aStream [
	aStream 
		nextPutAll: 'Moose';
		cr;
		nextPutAll: self signature;
		cr;
		nextPutAll: self timeStamp asString
]

{ #category : #accessing }
MooseImage >> signature [
	^ signature
]

{ #category : #accessing }
MooseImage >> signature: anObject [
	signature := anObject
]

{ #category : #accessing }
MooseImage >> timeStamp [
	^ timeStamp
]

{ #category : #accessing }
MooseImage >> timeStamp: anObject [
	timeStamp := anObject
]
