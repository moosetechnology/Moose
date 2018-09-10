"
I am an error that is raised whenever there are multiple validation rules failing.
"
Class {
	#name : #MAMultipleErrors,
	#superclass : #MAValidationError,
	#instVars : [
		'collection'
	],
	#category : #'Magritte-Model-Exception'
}

{ #category : #'instance creation' }
MAMultipleErrors class >> description: aDescription errors: aCollection signal: aString [ 
	^ self new
		setDescription: aDescription;
		setCollection: aCollection;
		signal: aString;
		yourself
]

{ #category : #accessing }
MAMultipleErrors >> collection [
	^ collection
]

{ #category : #printing }
MAMultipleErrors >> printOn: aStream [
	self collection
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream nextPut: Character cr ]
]

{ #category : #initialization }
MAMultipleErrors >> setCollection: aCollection [
	collection := aCollection
]
