"
Attach point which does not select best point from predefined points, but calculates it continuously from simple geometric shapes
"
Class {
	#name : #RTContinuousAttachPoint,
	#superclass : #RTAttachPoint,
	#instVars : [
		'offset'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #initialization }
RTContinuousAttachPoint >> initialize [
	super initialize.
	self deprecated: 'Use class RTBorderAttachPoint instead.'.
	offset := 5
]

{ #category : #accessing }
RTContinuousAttachPoint >> offset [
	^ offset
]

{ #category : #accessing }
RTContinuousAttachPoint >> offset: anInteger [
	"In case fromElement and toElement have more than one edge between the same two extremities, offset is the distance between lines"

	offset := anInteger
]

{ #category : #public }
RTContinuousAttachPoint >> offsetNormalFor: anEdge [
	"Return the offset in case of multiple edges with the same starting and ending points"

	^ (RTShorterDistanceWithOffsetAttachPoint new offset: offset) offsetNormalFor: anEdge
]
