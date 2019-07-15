"
I represent an error that occurs when we have cycles in static example dependencies. The cycles can be either direct or indirect. For example,  these configurations induces an error:
- a depends-on b, b depends-on a
- a depends-on b, b depends-on c, c depends-on a
"
Class {
	#name : #GtExampleRecursionDetected,
	#superclass : #GtExampleError,
	#instVars : [
		'resolved',
		'next'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExampleRecursionDetected >> next [
	^ next
]

{ #category : #accessing }
GtExampleRecursionDetected >> next: anObject [
	next := anObject
]

{ #category : #accessing }
GtExampleRecursionDetected >> resolved [
	^ resolved
]

{ #category : #accessing }
GtExampleRecursionDetected >> resolved: anObject [
	resolved := anObject
]
