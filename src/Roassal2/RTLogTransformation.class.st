Class {
	#name : #RTLogTransformation,
	#superclass : #RTScaleTransformation,
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #hooks }
RTLogTransformation >> invTrans: aValue [
	^ (10 raisedTo: aValue) - 1

]

{ #category : #hooks }
RTLogTransformation >> trans: aValue [
	^ (aValue + 1) log
]
