Class {
	#name : #MAStreamingVisitor,
	#superclass : #MAVisitor,
	#instVars : [
		'stream',
		'object'
	],
	#category : #'Magritte-Model-Visitor'
}

{ #category : #streaming }
MAStreamingVisitor >> contents [
	^ self stream contents
]

{ #category : #accessing }
MAStreamingVisitor >> object [
	^ object
]

{ #category : #accessing }
MAStreamingVisitor >> object: anObject [
	object := anObject
]

{ #category : #private }
MAStreamingVisitor >> object: anObject during: aBlock [
	| previous |
	previous := self object. self object: anObject.
	aBlock ensure: [ self object: previous ]
]

{ #category : #accessing }
MAStreamingVisitor >> stream [
	^ stream
]

{ #category : #accessing }
MAStreamingVisitor >> stream: aStream [
	stream := aStream
]
