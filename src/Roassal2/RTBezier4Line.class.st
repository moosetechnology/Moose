"
Wow! I am  the biezer shape 4 4 control points.

Maybe we need roassal3 now with a better system for bezier lines
"
Class {
	#name : #RTBezier4Line,
	#superclass : #RTBezier3Line,
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTBezier4Line >> controllingElements: arr [
	controlElement := arr
	
]

{ #category : #private }
RTBezier4Line >> pointsFor: edge [
	| cp1 cp2 cp3 cp4 arr point |
	cp1 := attachPoint startingPointOf: edge.
	cp4 := attachPoint endingPointOf: edge.
	arr := controlElement rtValue: edge.
	point := [ :e | e isPoint ifTrue: [ e ] ifFalse: [ e position ] ].
	cp2 := point value: arr first.
	cp3 := point value: arr second.
			
	^ Array with: cp1 with: cp2 with: cp3 with: cp4.
]

{ #category : #hooks }
RTBezier4Line >> trachelShapeClass [
	^ TRBezier4Shape

]
