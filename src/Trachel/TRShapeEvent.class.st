Class {
	#name : #TRShapeEvent,
	#superclass : #TREvent,
	#instVars : [
		'shape'
	],
	#category : #'Trachel-Events'
}

{ #category : #'instance creation' }
TRShapeEvent class >> shape: aTrachelShape [
	^ self new shape: aTrachelShape; yourself
]

{ #category : #accessing }
TRShapeEvent >> element [
	"Could be any object"

	^ self shape class = TRCanvas
		ifTrue: [ nil ]
		ifFalse: [ self shape element ]
]

{ #category : #accessing }
TRShapeEvent >> shape [
	
	^ shape
]

{ #category : #accessing }
TRShapeEvent >> shape: aTrachelShape [
	
	shape := aTrachelShape
]
