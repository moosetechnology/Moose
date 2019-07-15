Class {
	#name : #RTSqrtTransformation,
	#superclass : #RTScaleTransformation,
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #hooks }
RTSqrtTransformation >> invTrans: value [
	^ value * value
]

{ #category : #hooks }
RTSqrtTransformation >> trans: aValue [
	^ aValue sqrt
]
