"
I am a base class for (drag and) drop events attached to the drop target elements.
"
Class {
	#name : #TRMouseAbstractDrop,
	#superclass : #TRAbstractMouseEvent,
	#instVars : [
		'draggedShape'
	],
	#category : #'Trachel-Events'
}

{ #category : #accessing }
TRMouseAbstractDrop >> draggedElement [
	^ draggedShape element
]

{ #category : #accessing }
TRMouseAbstractDrop >> draggedShape [
	^ draggedShape
]

{ #category : #accessing }
TRMouseAbstractDrop >> draggedShape: aShape [
	draggedShape := aShape
]
