"
a Builder for points that return points with Z command
"
Class {
	#name : #RTLinearClosedPathBuilder,
	#superclass : #RTLinePathBuilder,
	#category : #'Roassal2-Experimental'
}

{ #category : #'as yet unclassified' }
RTLinearClosedPathBuilder >> closed [
	^ true
]

{ #category : #'as yet unclassified' }
RTLinearClosedPathBuilder >> interpolate: points [
	^ (RTLinearPathBuilder new interpolate: points),'Z'.
]
