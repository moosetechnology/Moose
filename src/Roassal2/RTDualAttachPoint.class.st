"
I am a new class to combine attach points
"
Class {
	#name : #RTDualAttachPoint,
	#superclass : #RTAttachPoint,
	#instVars : [
		'attachFrom',
		'attachTo'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #public }
RTDualAttachPoint class >> on: els attachFrom: anAttachPoint [
	^ self on: els thenDo: [ :ins | ins attachFrom: anAttachPoint ].
	
]

{ #category : #public }
RTDualAttachPoint class >> on: els attachFrom: anAttachPoint1 attachTo: anAttachPoint2 [
	^ self on: els thenDo: [ :ins | 
		ins
			attachFrom: anAttachPoint1;
			attachTo: anAttachPoint2
		 ].
	
]

{ #category : #public }
RTDualAttachPoint class >> on: els attachTo: anAttachPoint [
	^ self on: els thenDo: [ :ins | ins attachTo: anAttachPoint ].
	
]

{ #category : #accessing }
RTDualAttachPoint >> attachFrom [
	^ attachFrom
]

{ #category : #accessing }
RTDualAttachPoint >> attachFrom: anAttachPoint [
	attachFrom := anAttachPoint
]

{ #category : #accessing }
RTDualAttachPoint >> attachTo [
	^ attachTo
]

{ #category : #accessing }
RTDualAttachPoint >> attachTo: anAttachPoint [
	attachTo := anAttachPoint
]

{ #category : #'public - hooks' }
RTDualAttachPoint >> basicEndingPointOf: anEdge [
	^ attachTo basicEndingPointOf: anEdge.
]

{ #category : #'public - hooks' }
RTDualAttachPoint >> basicStartingPointOf: anEdge [
	^ attachFrom basicStartingPointOf: anEdge
]

{ #category : #initialization }
RTDualAttachPoint >> initialize [
	| default |
	super initialize.
	default := RTCenteredAttachPoint instance.
	self attachFrom: default;
		attachTo: default. 
]
