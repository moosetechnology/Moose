Class {
	#name : #GTriangleTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GTriangleTest >> testArea [
	self
		assert:
			((GTriangle with: 0 @ 0 with: 2 @ 0 with: 0 @ 2) area closeTo: 2)
]

{ #category : #'as yet unclassified' }
GTriangleTest >> testCircumscribedCircle [
	| circle |
	circle := (GTriangle with: -1 @ 2 with: 0 @ 0 with: 2 @ 1) circumscribedCircle.
	self assert: circle center equals: 0.5 @ 1.5.
	self assert: (circle radius closeTo: 10 sqrt / 2)
	


]

{ #category : #'as yet unclassified' }
GTriangleTest >> testCircumscribedCircle1 [
	| circle |
	circle := (GTriangle with: -1 @ 1 with: 3 @ 0 with: 1 @ 3) circumscribedCircle.
	self assert: circle center equals: (11/10) @ (9/10).
	self assert: (circle radius closeTo: (1+(21*21)) sqrt / 10)
	


]

{ #category : #'as yet unclassified' }
GTriangleTest >> testCircumscribedCircle2 [
	| circle |
	circle := (GTriangle with: -1 @ 1 with: 2 @ 3  with: 5 @ -3) circumscribedCircle.
	self assert: circle center equals: (9 / 4) @ (-5 / 8).
	self assert: (circle radius closeTo: (5 sqrt)* 13 / 8 )

]

{ #category : #'as yet unclassified' }
GTriangleTest >> testCircumscribedCircle3 [
	| circle |
	circle := (GTriangle with: 2 @ 3 with: 7 @ 4 with: 5 @ 7) circumscribedCircle.
	self assert: circle center equals: (147/34) @ (149/34).

	


]

{ #category : #'as yet unclassified' }
GTriangleTest >> testIsDegenerate [
	self
		assert: (GTriangle with: 0 @ 0 with: 2 @ 0 with: 3 @ 0) isDegenerate.
	self
		assert: (GTriangle with: 0 @ 0 with: 2 @ 0 with: 0 @ 3) isDegenerate not.
	self
		assert: (GTriangle with: 1 @ 0 with: 1 @ 2 with: 1 @ -1) isDegenerate.	
]

{ #category : #'as yet unclassified' }
GTriangleTest >> testIsDegenerate2 [
self
	assert: (GTriangle with: 1@1 with: 3@3 with: 2@2 )isDegenerate.

self
	assert: (GTriangle with:  1@1 with: 2@2 with: 3@3 )isDegenerate.

self
	assert: (GTriangle with:  1@1 with: 2@2 with: 2@1 )isDegenerate not.

]

{ #category : #'as yet unclassified' }
GTriangleTest >> testIsDegenerate3 [
self
	assert: (GTriangle with: (1.9357176033002985e-6@212.13203242024665) with: (1.1175870793405243e-6@122.47448602157178) with: (1.5805068047363063e-6@173.2050791763809))isDegenerate.

self
	assert: (GTriangle with: (1.9357176033002985e-6@212.13203242024665) with: (-2.7375180875116245e-6@299.9999972624819) with: (1.5805068047363063e-6@173.2050791763809))isDegenerate not.

self
	assert: (GTriangle with: (1.9357176033002985e-6@212.13203242024665) with: (-2.7375180875116245e-6@299.9999972624819) with: (1.1175870793405243e-6@122.47448602157178))isDegenerate not.

]

{ #category : #'as yet unclassified' }
GTriangleTest >> testIsDegenerate4 [
self
	assert: (GTriangle with: (-10@ -30) with:(-30@ -10) with:(-10@ -30))isDegenerate.


]

{ #category : #'as yet unclassified' }
GTriangleTest >> testPerimeter [
	self
		assert: (GTriangle with: 0 @ 0 with: 2 @ 0 with: 0 @ 2) perimeter
		equals: 4 + 8 sqrt
]

{ #category : #'as yet unclassified' }
GTriangleTest >> testSemiperimeter [
	self
		assert: (GTriangle with: 0 @ 0 with: 2 @ 0 with: 0 @ 2) semiperimeter
		equals: 2 + 2 sqrt
]
