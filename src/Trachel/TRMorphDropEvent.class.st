Class {
	#name : #TRMorphDropEvent,
	#superclass : #TRShapeEvent,
	#instVars : [
		'droppedMorph',
		'dropMorphEvent'
	],
	#category : #'Trachel-Events'
}

{ #category : #accessing }
TRMorphDropEvent >> dropMorphEvent [
	^ dropMorphEvent
]

{ #category : #accessing }
TRMorphDropEvent >> dropMorphEvent: anObject [
	dropMorphEvent := anObject
]

{ #category : #accessing }
TRMorphDropEvent >> droppedMorph [
	^ droppedMorph
]

{ #category : #accessing }
TRMorphDropEvent >> droppedMorph: anObject [
	droppedMorph := anObject
]
