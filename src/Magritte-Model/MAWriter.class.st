Class {
	#name : #MAWriter,
	#superclass : #MAStreamingVisitor,
	#category : #'Magritte-Model-Visitor'
}

{ #category : #'instance creation' }
MAWriter class >> write: anObject [
	^ self new write: anObject
]

{ #category : #'instance creation' }
MAWriter class >> write: anObject description: aDescription [
	^ self new write: anObject description: aDescription
]

{ #category : #'instance creation' }
MAWriter class >> write: anObject description: aDescription to: aStream [
	^ self new write: anObject description: aDescription to: aStream
]

{ #category : #private }
MAWriter >> defaultWriteStream [
	self subclassResponsibility
]

{ #category : #private }
MAWriter >> error: aString [ 
	MAWriteError signal: aString
]

{ #category : #visiting }
MAWriter >> write: anObject [
	^ self write: anObject description: anObject magritteDescription
]

{ #category : #visiting }
MAWriter >> write: anObject description: aDescription [
	^ self write: anObject description: aDescription to: self defaultWriteStream
]

{ #category : #visiting }
MAWriter >> write: anObject description: aDescription to: aStream [
	self
		object: anObject;
		stream: aStream;
		visit: aDescription.
	^ self contents
]
