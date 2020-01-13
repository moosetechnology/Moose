Class {
	#name : #SmalltalkModelTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #testing }
SmalltalkModelTestResource class >> isAbstract [
	^ self = SmalltalkModelTestResource
]

{ #category : #accessing }
SmalltalkModelTestResource >> modelClass [
	^ FamixStModel
]
