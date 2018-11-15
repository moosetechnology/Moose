"
a Builder for points that return points with Z command
"
Class {
	#name : #RTLinearClosedPathBuilder,
	#superclass : #RTLinePathBuilder,
	#category : #'Roassal2-Experimental'
}

{ #category : #testing }
RTLinearClosedPathBuilder >> closed [
	^ true
]

{ #category : #public }
RTLinearClosedPathBuilder >> interpolate: points [
	^ (RTLinearPathBuilder new interpolate: points),'Z'.
]
