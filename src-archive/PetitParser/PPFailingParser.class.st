"
A parser that consumes nothing and always fails.

Instance Variables:
	message <String>	The failure message.

"
Class {
	#name : #PPFailingParser,
	#superclass : #PPParser,
	#instVars : [
		'message'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPFailingParser class >> message: aString [
	^ self new setMessage: aString
]

{ #category : #accessing }
PPFailingParser >> message [
	"Answer the error message of the receiving parser."

	^ message
]

{ #category : #'pp-context' }
PPFailingParser >> parseOn: aPPContext [
	^ PPFailure message: message context: aPPContext
]

{ #category : #printing }
PPFailingParser >> printNameOn: aStream [
	super printNameOn: aStream.
	aStream nextPutAll: ', '; print: message
]

{ #category : #initialization }
PPFailingParser >> setMessage: aString [
	message := aString
]
