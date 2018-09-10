Class {
	#name : #MAValueHolder,
	#superclass : #MABasicObject,
	#instVars : [
		'contents'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #'instance creation' }
MAValueHolder class >> on: anObject [
	^ self new contents: anObject
]

{ #category : #accessing }
MAValueHolder >> contents [
	^ contents
]

{ #category : #accessing }
MAValueHolder >> contents: anObject [
	contents := anObject
]
