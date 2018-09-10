"
I am an error that occurs when an example declares a subject that does not exist in the image.
"
Class {
	#name : #GtExampleSubjectError,
	#superclass : #GtExamplePragmaError,
	#instVars : [
		'subject'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExampleSubjectError >> subject [
	^ subject
]

{ #category : #accessing }
GtExampleSubjectError >> subject: anObject [
	subject := anObject
]
