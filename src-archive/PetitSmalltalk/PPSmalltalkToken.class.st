Class {
	#name : #PPSmalltalkToken,
	#superclass : #PPToken,
	#instVars : [
		'comments'
	],
	#category : #'PetitSmalltalk-Core'
}

{ #category : #accessing }
PPSmalltalkToken >> comments [
	^ comments ifNil: [ #() ]
]

{ #category : #accessing }
PPSmalltalkToken >> comments: anArray [
	comments := anArray
]

{ #category : #compatiblity }
PPSmalltalkToken >> length [
	^ self size
]
