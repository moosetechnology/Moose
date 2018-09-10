"
Box shape with (optionally) rounded corners.
"
Class {
	#name : #TRRoundedBoxShape,
	#superclass : #TRBoxShape,
	#instVars : [
		'borderRadius'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #accessing }
TRRoundedBoxShape >> borderRadius [
	^ borderRadius
]

{ #category : #accessing }
TRRoundedBoxShape >> borderRadius: aNumber [
	borderRadius := aNumber
]

{ #category : #private }
TRRoundedBoxShape >> computePath [
	path := TRPlatform current computeRoundBoxPathFor: self.
]
