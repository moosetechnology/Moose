Class {
	#name : #RTOSMTest,
	#superclass : #RTTest,
	#category : #'Roassal2-OpenStreetMap'
}

{ #category : #tests }
RTOSMTest >> testBasic [
	RTView new add: RTOSM element
]

{ #category : #tests }
RTOSMTest >> testExtent [
	RTOSM new extent: 50 @ 50
]

{ #category : #tests }
RTOSMTest >> testLatLonDistance [
	self assert: (#(#Float #BoxedFloat64 #SmallFloat64) includes: (RTOSM new latLon: 48.85 @ 2.3 distance: 100) class name)
]

{ #category : #tests }
RTOSMTest >> testLonToRoassal [
	self assert: (RTOSM new latLonToRoassal: 48.85 @ 2.3) class equals: Point
]

{ #category : #tests }
RTOSMTest >> testPixelLength [
	self assert: (RTOSM new pixelLength) > 0
]

{ #category : #tests }
RTOSMTest >> testRatio [
	self assert: (RTOSM new ratio) equals: 1.0
]
