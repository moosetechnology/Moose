"
A ROCircleLayout is xxxxxxxxx.

"
Class {
	#name : #RTCircleLayout,
	#superclass : #RTAbstractCircleLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #'instance creation' }
RTCircleLayout class >> scaleBy: aNumber [
	
	^self new scaleBy: aNumber
]

{ #category : #hook }
RTCircleLayout >> doExecute: elements [
	| angleIncrement angle rad center |
	rad := self computeRadiusFor: elements.
	center := Point x: rad y: rad.
	angleIncrement := self computeIncrementalAngleFor: elements.
	angle := self initialAngle.
	elements
		do: [ :each | 
			| point |
			point := center + (Point r: rad theta: angle).
			angle := angle + angleIncrement.
			translator translateTopLeftOf: each to: point.
			self step ]
]
