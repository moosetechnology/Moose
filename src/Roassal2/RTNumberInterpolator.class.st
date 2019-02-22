"
I am the basic interpolator for numbers
"
Class {
	#name : #RTNumberInterpolator,
	#superclass : #RTInterpolator,
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #accessing }
RTNumberInterpolator >> interpolate: t [
	^ (start * (1 - t)) + (stop * t).
]
