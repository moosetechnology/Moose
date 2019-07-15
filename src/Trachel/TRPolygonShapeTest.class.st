"
A TRPolygonShapeTest is a test class for testing the behavior of TRPolygonShape
"
Class {
	#name : #TRPolygonShapeTest,
	#superclass : #TRTest,
	#category : #'Trachel-Tests'
}

{ #category : #tests }
TRPolygonShapeTest >> testBasic [

	| s |
	s := TRPolygonShape new.
	self assert: s numberOfVertices equals: 0.
	self assert: s vertices equals: #().
	self assert: s encompassingRectangle equals: ((0 @ 0) corner: (0 @ 0))
]

{ #category : #tests }
TRPolygonShapeTest >> testPainting [

	| c s |
	c := TRCanvas new.

	s :=  TRPolygonShape new.
	c addShape: s.
	c buildMorph drawOnMockCanvas
]

{ #category : #tests }
TRPolygonShapeTest >> testTranslationAndEmpty [

	| c s |
	c := TRCanvas new.

	s :=  TRPolygonShape new.
	s color: nil.
	s vertices: (Array with: 10@10 with: 0@0 with: 10@0).
	c addShape: s.
	s translateBy: 3 @ 3.

	s :=  TRPolygonShape new.
	s color: nil.
	s vertices: (Array with: 10@10 with: 0@0 with: 10@0).
	c addShape: s.
	
	c buildMorph drawOnMockCanvas
]
