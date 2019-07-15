"
I am a generic validation error. I reference the description that caused the validation error.
"
Class {
	#name : #MAValidationError,
	#superclass : #MAError,
	#category : #'Magritte-Model-Exception'
}

{ #category : #'instance creation' }
MAValidationError class >> description: aDescription signal: aString [ 
	^ self new
		setDescription: aDescription;
		signal: aString;
		yourself
]

{ #category : #printing }
MAValidationError >> printOn: aStream [
	(self tag isDescription and: [ self tag label notNil ])
		ifTrue: [ aStream nextPutAll: self tag label greaseString; nextPutAll: ': ' ].
	aStream nextPutAll: self messageText greaseString 
]

{ #category : #initialization }
MAValidationError >> setDescription: aDescription [
	self tag: aDescription
]
