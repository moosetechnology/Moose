Class {
	#name : #RTPolyLineSegmentsTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTPolyLineSegmentsTest >> testLength [
	| segment segments |
	segment := RTLineSegment from: 0 @ 0 to: 8 @ 6.
	segments := RTPolyLineSegment with: segment.
	self assert: segments length equals: 10.
	segments := RTPolyLineSegment
		with: (RTLineSegment from: 0 @ 0 to: 10 @ 0)
		with: (RTLineSegment from: 10 @ 0 to: 10 @ 5).
	self assert: segments length equals: 15
]

{ #category : #tests }
RTPolyLineSegmentsTest >> testSegmentWithPointAbsolute [
	| segments |
	segments := RTPolyLineSegment
		with: (RTLineSegment from: 0 @ 0 to: 8 @ 6)
		with: (RTLineSegment from: 8 @ 6 to: 16 @ 0).
	self
		assert: (segments segmentWithPointFor: 5)
		equals: (Array with: segments first with: 4 @ 3).
	self
		assert: (segments segmentWithPointFor: 10)
		equals: (Array with: segments first with: 8 @ 6).
	self
		assert: (segments segmentWithPointFor: 15)
		equals: (Array with: segments second with: 12 @ 3).
	self
		assert: (segments segmentWithPointFor: 20)
		equals: (Array with: segments second with: 16 @ 0)
]

{ #category : #tests }
RTPolyLineSegmentsTest >> testSegmentWithPointNegative [
	| segments |
	segments := RTPolyLineSegment
		with: (RTLineSegment from: 0 @ 0 to: 8 @ 6)
		with: (RTLineSegment from: 8 @ 6 to: 16 @ 0).
	self
		assert: (segments segmentWithPointFor: -20)
		equals: (Array with: segments first with: 0 @ 0).
	self
		assert: (segments segmentWithPointFor: -15)
		equals: (Array with: segments first with: 4 @ 3).
	self
		assert: (segments segmentWithPointFor: -10)
		equals: (Array with: segments first with: 8 @ 6).
	self
		assert: (segments segmentWithPointFor: -5)
		equals: (Array with: segments second with: 12 @ 3)
]

{ #category : #tests }
RTPolyLineSegmentsTest >> testSegmentWithPointRelative [
	| segment segments |
	segment := RTLineSegment from: 0 @ 0 to: 8 @ 6.
	segments := RTPolyLineSegment with: segment.
	self assert: (segments segmentWithPointFor: 0) equals: (Array with: segment with: 0 @ 0).
	self assert: (segments segmentWithPointFor: 0.5) equals: (Array with: segment with: 4 @ 3).
	self assert: (segments segmentWithPointFor: 1) equals: (Array with: segment with: 8 @ 6)
]
