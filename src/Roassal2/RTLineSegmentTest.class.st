"
A RTLineSegmentTest is a test class for testing the behavior of RTLineSegment
"
Class {
	#name : #RTLineSegmentTest,
	#superclass : #RTTest,
	#instVars : [
		'lineX',
		'lineY',
		'lineDiagonal',
		'lineX0'
	],
	#category : #'Roassal2-AttachPoint-Tests'
}

{ #category : #running }
RTLineSegmentTest >> setUp [
	super setUp.
	lineX := RTLineSegment from: 10 @ -10 to: 110 @ -10.
	lineY := RTLineSegment from: 10 @ -10 to: 10 @ 90.
	lineDiagonal := RTLineSegment from: 10 @ -10 to: -90 @ -110.
	lineX0 := RTLineSegment from: 0 @ 0 to: 100 @ 0
]

{ #category : #tests }
RTLineSegmentTest >> testAngles [
	self assert: lineX angleInDeg = 0.
	self assert: lineY angleInDeg = 90.
	self assert: lineDiagonal angleInDeg = 225.
	self assert: lineX angleInRad = 0.
	self assert: (lineY angleInRad closeTo: 1.5707963268)
]

{ #category : #tests }
RTLineSegmentTest >> testEquals [
	| anotherX |
	anotherX := RTLineSegment from: lineX from to: lineX to.
	self assert: anotherX equals: lineX.
	self assert: anotherX = lineX.
	self assert: anotherX hash equals: lineX hash.

	self deny: lineX = lineY
]

{ #category : #tests }
RTLineSegmentTest >> testIntersectHorizontal [
	"assumes intersection: method is tested elsewhere"

	self assert: (lineX intersectHorizontal: lineY) = (lineX intersection: lineY).
	self assert: (lineX0 intersectHorizontal: lineY) = (lineX0 intersection: lineY).
	self assert: (lineX intersectHorizontal: lineDiagonal) = (lineX intersection: lineDiagonal).
	self assert: (lineX0 intersectHorizontal: lineDiagonal) = (lineX0 intersection: lineDiagonal).
	self assert: (lineX0 intersectHorizontal: lineX) = (lineX0 intersection: lineX).
	self assert: (lineX intersectHorizontal: lineX) = (lineX intersection: lineX)
]

{ #category : #tests }
RTLineSegmentTest >> testIntersectLines [
	self assert: (lineX intersectLines: lineY) = (10 @ -10).
	self assert: (lineX intersectLines: lineDiagonal) = (10 @ -10).
	self assert: (lineY intersectLines: lineDiagonal) = (10 @ -10).
	self assert: (lineX intersectLines: lineX0) isNil.
	self assert: (lineY intersectLines: lineX0) = (10 @ 0).
	self assert: (lineDiagonal intersectLines: lineX0) = (20 @ 0)
]

{ #category : #tests }
RTLineSegmentTest >> testIntersectVertical [
	self assert: (lineY intersectVertical: lineX0) = (lineY intersection: lineX0).
	self assert: (lineY intersectVertical: lineX) = (lineY intersection: lineX).
	self assert: (lineY intersectVertical: lineDiagonal) = (lineY intersection: lineDiagonal).
	self assert: (lineY intersectVertical: lineY) = (lineY intersection: lineY)
]

{ #category : #tests }
RTLineSegmentTest >> testIntersection [
	self assert: (lineX intersection: lineY) = (10 @ -10).
	self assert: (lineX intersection: lineDiagonal) = (10 @ -10).
	self assert: (lineY intersection: lineDiagonal) = (10 @ -10).
	self assert: (lineX intersection: lineX0) isNil.
	self assert: (lineY intersection: lineX0) = (10 @ 0).
	self assert: (lineDiagonal intersection: lineX0) isNil
]

{ #category : #tests }
RTLineSegmentTest >> testLength [
	self assert: lineX length = 100.
	self assert: lineY length = 100.
	self assert: (lineDiagonal length closeTo: 141.4213562)
]

{ #category : #tests }
RTLineSegmentTest >> testNormalForm [
	self assert: lineX a = 0.
	self assert: lineY a = 100.
	self assert: lineDiagonal a = -100.
	self assert: lineX b = -100.
	self assert: lineY b = 0.
	self assert: lineDiagonal b = 100.
	self assert: lineX c = -1000.
	self assert: lineY c = -1000.
	self assert: lineDiagonal c = 2000
]

{ #category : #tests }
RTLineSegmentTest >> testPointForBalance [
	self assert: (lineX pointForBalance: 0) equals: lineX from.
	self assert: (lineX pointForBalance: 0.5) equals: (lineX from + lineX to) / 2.
	self assert: (lineX pointForBalance: 1) equals: lineX to.

	self assert: (lineX pointForBalance: 10) equals: lineX from + (10 @ 0).
	self assert: (lineX pointForBalance: 90) equals: lineX to - (10 @ 0).
	self assert: (lineX pointForBalance: -10) equals: lineX to - (10 @ 0)
]

{ #category : #tests }
RTLineSegmentTest >> testSideOfPoint [
	self assert: (lineX sideOfPoint: 20 @ -20) equals: 1.
	self assert: (lineX sideOfPoint: 20 @ -10) equals: 0.
	self assert: (lineX sideOfPoint: 20 @ 0) equals: -1.

	self assert: (lineY sideOfPoint: 0 @ 0) equals: -1.
	self assert: (lineY sideOfPoint: 10 @ 0) equals: 0.
	self assert: (lineY sideOfPoint: 20 @ 0) equals: 1.

	self assert: (lineDiagonal sideOfPoint: -40 @ -30) equals: 1.
	self assert: (lineDiagonal sideOfPoint: 10 @ -10) equals: 0.
	self assert: (lineDiagonal sideOfPoint: -30 @ -70) equals: -1
]

{ #category : #tests }
RTLineSegmentTest >> testVector [
	self assert: lineX vector = (100 @ 0).
	self assert: lineY vector = (0 @ 100).
	self assert: lineDiagonal vector = (-100 @ -100)
]
