"
A RTDraggable is an interaction that make an element draggable using the mouse.

"
Class {
	#name : #RTDraggable,
	#superclass : #RTAbstractDraggable,
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTDraggable class >> groupToDrag: elements [
	^ self new groupToDrag: elements
]

{ #category : #vistor }
RTDraggable >> accept: aVisitor with: args [
	aVisitor visitDraggableInteraction: self with: args
]

{ #category : #hooks }
RTDraggable >> transformDistance: distanceAsPoint forElement: anElement [
	"Nothing to be transformed since there is no restriction here"
	^ distanceAsPoint
]
