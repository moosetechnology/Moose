"
I'm a mouse wheel scrolling event.

"
Class {
	#name : #TRMouseWheelEvent,
	#superclass : #TRAbstractMouseEvent,
	#instVars : [
		'direction'
	],
	#category : #'Trachel-Events'
}

{ #category : #'instance creation' }
TRMouseWheelEvent class >> fromDirection: aDirection position: aPoint [
	^ self new
		position: aPoint;
		direction: aDirection;
		yourself
]

{ #category : #accessing }
TRMouseWheelEvent >> direction [
	^ direction
]

{ #category : #accessing }
TRMouseWheelEvent >> direction: anObject [
	direction := anObject
]

{ #category : #testing }
TRMouseWheelEvent >> isDown [
	^ direction = Character arrowDown
]

{ #category : #testing }
TRMouseWheelEvent >> isLeft [
	^ direction = Character arrowLeft
]

{ #category : #testing }
TRMouseWheelEvent >> isRight [
	^ direction = Character arrowRight
]

{ #category : #testing }
TRMouseWheelEvent >> isUp [
	^ direction = Character arrowUp
]
