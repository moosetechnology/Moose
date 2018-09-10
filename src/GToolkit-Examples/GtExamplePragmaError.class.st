"
I am an abstract error related to the way the pragmas are used within an example method.
"
Class {
	#name : #GtExamplePragmaError,
	#superclass : #GtExampleError,
	#instVars : [
		'pragma'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExamplePragmaError >> pragma [
	^ pragma
]

{ #category : #accessing }
GtExamplePragmaError >> pragma: anObject [
	pragma := anObject
]
