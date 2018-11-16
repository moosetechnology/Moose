"
SmaCCAcceptAction represents the LR accept action.


"
Class {
	#name : #SmaCCAcceptAction,
	#superclass : #SmaCCPrimitiveAction,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCAcceptAction class >> id [
	^ 2r00
]

{ #category : #merging }
SmaCCAcceptAction >> mergeWith: aSmaCCAction prefer: aClass [
	^ self
]
