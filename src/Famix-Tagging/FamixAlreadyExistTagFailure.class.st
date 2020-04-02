"
Description
--------------------

I am an exception that occurs if an existing tag will be in conflict after executing an operation.
"
Class {
	#name : #FamixAlreadyExistTagFailure,
	#superclass : #FamixTagFailure,
	#instVars : [
		'existingTag'
	],
	#category : #'Famix-Tagging-Exceptions'
}

{ #category : #signaling }
FamixAlreadyExistTagFailure class >> signalWithTag: anExistingTag [
	self new
		existingTag: anExistingTag;
		signal
]

{ #category : #accessing }
FamixAlreadyExistTagFailure >> existingTag [
	^ existingTag
]

{ #category : #accessing }
FamixAlreadyExistTagFailure >> existingTag: anObject [
	existingTag := anObject
]

{ #category : #accessing }
FamixAlreadyExistTagFailure >> messageText [
	^ 'Impossible to perform operation: the Tag ' , self existingTag asString , ' already exist'
]
