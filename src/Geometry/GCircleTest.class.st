Class {
	#name : #GCircleTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GCircleTest >> test [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) boundaryContains: (5@57))
		equals: true.
		
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) boundaryContains: (74@77))
		equals: true.
		
	self
		"assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) boundaryContains: ((74@72)))
		equals: true."
]

{ #category : #'as yet unclassified' }
GCircleTest >> testBoundaryContains1 [
	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) boundaryContains: 5 @ 2)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testBoundaryContains4 [
	
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) boundaryContains: ((74@72)))
		equals: false.
]

{ #category : #'as yet unclassified' }
GCircleTest >> testBoundaryContainsThis [
	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) boundaryContainsThis: { 2 @ 2 . 5 @ 2 })
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testBoundaryContainsWhich [
	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) boundaryContainsWhichOf: { 2 @ 2 . 5 @ 2 })
		equals: {5 @ 2}
]

{ #category : #'as yet unclassified' }
GCircleTest >> testContains [
	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) contains: 2 @ 2)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testContains1 [
	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) contains: 6 @ 2)
		equals: false
]

{ #category : #'as yet unclassified' }
GCircleTest >> testContains2 [
	self
		assert: ((GCircle  center: 30 @ 30 radius: 20) contains: 50 @ 30)
		equals: false.
	self
		assert: ((GCircle  center: 30 @ 30 radius: 20) contains: 10 @ 30)
		equals: false.
	self
		assert: ((GCircle  center: 30 @ 30 radius: 20) contains: 30 @ 10)
		equals: false.
	self
		assert: ((GCircle  center: 30 @ 30 radius: 20) contains: 30 @ 30)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testContains3 [
	self
		assert: ((GCircle  center: 0 @ 0 radius: 31.62277660168381) contains: -30 @ -10)
		equals: false.
	self
		assert: ((GCircle  center:  0 @ 0 radius: 31.62277660168381) contains: 10 @ -30)
		equals: false.
	self
		assert: ((GCircle  center: 0 @ 0 radius: 31.62277660168381) contains: 30 @ 10)
		equals: false.
	self
		assert: ((GCircle  center: 0 @ 0 radius: 31.62277660168381) contains: 30 @ 30)
		equals: false.
	self
		assert: ((GCircle  center: 0 @ 0 radius: 31.62277660168381) contains: 10 @ 10)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testCosBetweenAnd [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) cosBetween: 74@72 and: 74@74 )
		equals: 0.9987089260705257
]

{ #category : #'as yet unclassified' }
GCircleTest >> testCosBetweenAnd2 [
	self
		assert: ((GCircle  center: 0@0 radius: 15) cosBetween: 15 @ 0 and: 0 @ 15 )
		equals: 0
]

{ #category : #'as yet unclassified' }
GCircleTest >> testCosBetweenAnd3 [
	self
		assert: ((GCircle  center: 0@0 radius: 15) cosBetween: 15 @ 0 and: 15 @ 0 )
		equals: 1
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEncompassingRectangle [
	self
		assert: (GCircle center: 2 @ 2 radius: 3) encompassingRectangle
		equals: (-1 @ -1 corner: 5 @ 5)
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) = (GCircle  center: 1 @ 1 radius: 3)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel1 [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) = (GCircle  center: 1.002 @ 1.009 radius: 3)
		equals: false
	
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel2 [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) = (GCircle  center: 1 @ 1 radius: 2.999999999)
		equals: true
	
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel3 [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) = (GCircle  center: 1.00000001 @ 0.9999991 radius: 2.999999999)
		equals: true
	
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel4 [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) = (GCircle  center: 1 @ 1 radius: 34)
		equals: false
	
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquel5 [
	self
		assert: (GCircle  center: 1.4 @ 1 radius: 3) = (GCircle  center: 1 @ 1 radius: 34)
		equals: false
	
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquelWithApproximation [
	|cos|
	cos := (GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) cosBetween: 74@72 and: 74@74 .
	self
		assert: ((GCircle  center: ((609/17)@(10837/136)) radius: 38.27069133568686) 
		equal: 
		(GCircle  center: ((36819/1022)@(82249/1022)) radius: 38.90857726043159) withApproximation: cos)
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testEquelWithApproximation2 [
	|cos|
	cos := (GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) cosBetween: 52@45 and: 74@74 .
	self
		assert: ((GCircle  center: ((609/17)@(10837/136)) radius: 38.27069133568686) 
		equal: 
		(GCircle  center: ((36819/1022)@(82249/1022)) radius: 38.90857726043159) withApproximation: cos)
		equals: false
]

{ #category : #'as yet unclassified' }
GCircleTest >> testInscribedRectangle2 [

	self
		assert: ((GCircle  center: 2 @ 2 radius: 3) inscribedRectangle)
		equals: (Rectangle origin: (2 - (3/(2 sqrt)))@(2 - (3/(2 sqrt))) corner: (2 + (3/(2 sqrt)))@(2 + (3/(2 sqrt)))).
]

{ #category : #'as yet unclassified' }
GCircleTest >> testLength [

	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) length)
		equals: 240.46184549599278

]

{ #category : #'as yet unclassified' }
GCircleTest >> testPointIsTooCloseTo [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) point: 74@72 isTooCloseTo: 74@74 )
		equals: true
]

{ #category : #'as yet unclassified' }
GCircleTest >> testPointIsTooCloseTo1 [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) point: 74@72 isTooCloseTo: 52@45 )
		equals: false
]

{ #category : #'as yet unclassified' }
GCircleTest >> testPolygonOn [
	self
		assert: (((GCircle  center: 1 @ 1 radius: 3) polygonOn: { -20 @ 10 ". 10 @ 40" . 40 @ 10 . 10 @ -20 }) at:1 )v1
		equals: -20 @ 10
]

{ #category : #'as yet unclassified' }
GCircleTest >> testWithBoundaryContains [
		
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686)  with: (74@77) boundaryContains:(74@72))
		equals: true.

]

{ #category : #'as yet unclassified' }
GCircleTest >> testWithBoundaryContains1 [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) with: (5@57) boundaryContains:(74@77))
		equals: true.


]

{ #category : #'as yet unclassified' }
GCircleTest >> testWithBoundaryContains2 [
	self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686) with: (5@57) boundaryContains:(74@74))
		equals: false.


]

{ #category : #'as yet unclassified' }
GCircleTest >> testWithBoundaryContains4 [
		
	"self
		assert: ((GCircle  center: (609/17)@(10837/136) radius: 38.27069133568686)  with: (74@77) boundaryContains1:(74@72))
		equals: false."

]

{ #category : #'as yet unclassified' }
GCircleTest >> testupperPoint [
	self
		assert: (GCircle  center: 1 @ 1 radius: 3) upperPoint
		equals: 1 @ 4
]
