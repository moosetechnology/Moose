"
SmaCCRejectAction represents the LR reject action.


"
Class {
	#name : #SmaCCRejectAction,
	#superclass : #SmaCCPrimitiveAction,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCRejectAction class >> id [
	^ 2r11
]

{ #category : #testing }
SmaCCRejectAction >> isReject [
	^ true
]

{ #category : #merging }
SmaCCRejectAction >> mergeWith: aSmaCCAction prefer: aClass [
	^ aSmaCCAction
]
