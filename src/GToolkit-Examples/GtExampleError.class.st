"
I am an abstract error induced by a signaledException related to a specific example.

My subclasses define the specific error.
"
Class {
	#name : #GtExampleError,
	#superclass : #Error,
	#instVars : [
		'example',
		'signaledException'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExampleError >> example [
	^ example
]

{ #category : #accessing }
GtExampleError >> example: anObject [
	example := anObject
]

{ #category : #accessing }
GtExampleError >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	self signaledException ifNotNil: [
		aStream nextPutAll: ' ('.
		self signaledException gtDisplayOn: aStream.
		aStream nextPutAll: ')' ].
]

{ #category : #testing }
GtExampleError >> isGTExampleError [
	^ true
]

{ #category : #accessing }
GtExampleError >> signaledException [
	^ signaledException
]

{ #category : #accessing }
GtExampleError >> signaledException: anObject [
	signaledException := anObject
]
