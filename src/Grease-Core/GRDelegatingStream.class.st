"
A GRDelegatingStream is a wrapper around a write stream and defines common behavior.

Instance Variables
	stream:		<WriteStream>

stream
	- a WriteStream


"
Class {
	#name : #GRDelegatingStream,
	#superclass : #GRObject,
	#instVars : [
		'stream'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #'instance creation' }
GRDelegatingStream class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #testing }
GRDelegatingStream >> atEnd [
	^ stream atEnd
]

{ #category : #accessing }
GRDelegatingStream >> contents [
	^ stream contents
]

{ #category : #streaming }
GRDelegatingStream >> crlf [
	self nextPut: Character cr; nextPut: Character lf
]

{ #category : #accessing }
GRDelegatingStream >> flush [
	stream flush
]

{ #category : #initialization }
GRDelegatingStream >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #testing }
GRDelegatingStream >> isStream [
	^ true
]

{ #category : #streaming }
GRDelegatingStream >> next [
	self subclassResponsibility
]

{ #category : #streaming }
GRDelegatingStream >> next: anInteger [
	self subclassResponsibility
]

{ #category : #streaming }
GRDelegatingStream >> nextPut: aCharacter [
	self subclassResponsibility
]

{ #category : #streaming }
GRDelegatingStream >> nextPutAll: aString [
	self subclassResponsibility
]

{ #category : #accessing }
GRDelegatingStream >> position [
	^ stream position
]

{ #category : #streaming }
GRDelegatingStream >> print: anObject [
	anObject printOn: self
]

{ #category : #accessing }
GRDelegatingStream >> reset [
	"Reset the stream"

	stream reset
]

{ #category : #accessing }
GRDelegatingStream >> size [
	^ stream size
]

{ #category : #streaming }
GRDelegatingStream >> space [
	self nextPut: Character space
]

{ #category : #streaming }
GRDelegatingStream >> tab [
	self nextPut: Character tab
]
