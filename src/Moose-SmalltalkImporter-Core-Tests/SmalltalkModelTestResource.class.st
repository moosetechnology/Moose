Class {
	#name : #SmalltalkModelTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #testing }
SmalltalkModelTestResource class >> isAbstract [
	^ self = SmalltalkModelTestResource
]

{ #category : #accessing }
SmalltalkModelTestResource >> modelClass [
	^ FamixStModel
]
