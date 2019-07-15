"
A GRCountingStream counts how many elements have been added to it. This is necessary because the underlying stream may inflate the number of elements in the stream.

Instance Variables:
	count	<Integer>
		
count
  - number of elements added to this stream
"
Class {
	#name : #GRCountingStream,
	#superclass : #GRDelegatingStream,
	#instVars : [
		'count'
	],
	#category : #'Grease-Core'
}

{ #category : #accessing }
GRCountingStream >> count [
	^ count
]

{ #category : #streaming }
GRCountingStream >> greaseNext: anInteger putAll: aCollection startingAt: startIndex [
	super greaseNext: anInteger putAll: aCollection startingAt: startIndex.
	count := count + anInteger
]

{ #category : #initialization }
GRCountingStream >> initialize [
	super initialize.
	count := 0
]

{ #category : #streaming }
GRCountingStream >> next [
	self shouldNotImplement
]

{ #category : #streaming }
GRCountingStream >> next: anInteger [
	self shouldNotImplement
]

{ #category : #streaming }
GRCountingStream >> nextPut: aCharacter [
	stream nextPut: aCharacter.
	count := count + 1
	
]

{ #category : #streaming }
GRCountingStream >> nextPutAll: aString [
	stream nextPutAll: aString.
	count := count + aString size
	
]

{ #category : #accessing }
GRCountingStream >> reset [
	super reset.
	count := 0
]
