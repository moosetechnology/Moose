Class {
	#name : #RTCircleGeometryTest,
	#superclass : #RTTest,
	#instVars : [
		'circle'
	],
	#category : #'Roassal2-AttachPoint-Tests'
}

{ #category : #tests }
RTCircleGeometryTest >> testIncludesPoint [
	circle := RTCircleGeometry center: 10 @ 10 radius: 10.
	self assert: (circle includesPoint: 10 @ 0).
	self assert: (circle includesPoint: 20 @ 10).
	self assert: (circle includesPoint: 10 @ 20).
	self assert: (circle includesPoint: 0 @ 10).
	self deny: (circle includesPoint: 0 @ 0).
	self deny: (circle includesPoint: 20 @ 0).
	self deny: (circle includesPoint: 20 @ 20).
	self deny: (circle includesPoint: 0 @ 20)
]

{ #category : #tests }
RTCircleGeometryTest >> testIntersectCircleIntersect [
	| circleLeft circleRight |
	circleLeft := RTCircleGeometry center: 0 @ 0 radius: 10.
	circleRight := RTCircleGeometry center: 10 @ 10 radius: 10.
	self assert: ((circleLeft intersectCircle: circleRight) first closeTo: 10 @ 0).
	self assert: ((circleLeft intersectCircle: circleRight) second closeTo: 0 @ 10)
]

{ #category : #tests }
RTCircleGeometryTest >> testIntersectCircleNot [
	| circleLeft circleRight |
	circleLeft := RTCircleGeometry center: 0 @ 0 radius: 10.
	circleRight := RTCircleGeometry center: 30 @ 0 radius: 10.
	self assert: (circleLeft intersectCircle: circleRight) isEmpty
]

{ #category : #tests }
RTCircleGeometryTest >> testIntersectCircleTouch [
	| circleLeft circleRight |
	circleLeft := RTCircleGeometry center: 0 @ 0 radius: 10.
	circleRight := RTCircleGeometry center: 20 @ 0 radius: 10.
	self assert: (circleLeft intersectCircle: circleRight) equals: (Array with: (10 @ 0))
]

{ #category : #tests }
RTCircleGeometryTest >> testNew [
	self should: [ RTCircleGeometry new ] raise: Error.
	circle := RTCircleGeometry center: 0 @ 0 radius: 10.
	self assert: circle center equals: 0 @ 0.
	self assert: circle radius equals: 10
]
