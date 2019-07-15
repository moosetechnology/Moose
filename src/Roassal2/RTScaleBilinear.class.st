"
I represent a bilinear range for 2 limits, start and end
"
Class {
	#name : #RTScaleBilinear,
	#superclass : #RTScale,
	#instVars : [
		'u',
		'i'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #hooks }
RTScaleBilinear >> rescale [
	u := uninterpolate uninterpolate: domain first and: domain second.
	i := interpolate interpolate: range first and: range second.
]

{ #category : #accessing }
RTScaleBilinear >> scale: x [
	^ i interpolate: (u uninterpolate: x)
]
