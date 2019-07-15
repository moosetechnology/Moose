Class {
	#name : #MAReader,
	#superclass : #MAStreamingVisitor,
	#category : #'Magritte-Model-Visitor'
}

{ #category : #'instance creation' }
MAReader class >> read: aStream description: aDescription [
	^ self new read: aStream description: aDescription
]

{ #category : #private }
MAReader >> error: aString [ 
	MAReadError signal: aString
]

{ #category : #visiting }
MAReader >> read: aStream description: aDescription [
	self
		stream: aStream;
		visit: aDescription.
	^ self object
]
