Class {
	#name : #GRectangleTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GRectangleTest >> testHasOnBoundary [
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasOnBoundary: 1 @ 3)
   		equals: true.
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasOnBoundary: 2 @ 3)
   		equals: true.
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasOnBoundary: 0 @ 0)
   		equals: false.
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testHasOnOneSideAnd [

self 
	assert:((Rectangle origin: -22 @ -42 corner: 62 @ 42) hasOnOneSide: -9 @ 42 and: 30 @ 42)
	equals: true. 
self 
	assert:((Rectangle origin: -22 @ -42 corner: 62 @ 42) hasOnOneSide: -22 @ 30 and: -22 @ -10)
	equals: true. 
self 
	assert:((Rectangle origin: -22 @ -42 corner: 62 @ 42) hasOnOneSide: -9 @ 42 and: -22 @ -10)
	equals: false. 
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testHasPoint [
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasPoint: 1 @ 3)
   		equals: true.
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasPoint: 2 @ 1)
   		equals: true.
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) hasPoint: 0 @ 0)
   		equals: false.
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testIntersectionPointWithRay [
 	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) intersectionPointWithRay: ((GRay origin: 2@1 direction: 4@1 )))
		  equals: {3@1}
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testIntersectionPointsWith1 [
 	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) intersectionPointsWithLine: ((GSegment with: 0 @ 					3 with: 4 @ 1) asLine)) first
		  equals:  1 @ 2.5 .
	self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) intersectionPointsWithLine: ((GSegment with: 0 @ 					3 with: 4 @ 1) asLine)) second
		  equals:  3 @ 1.5 
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testIntersectionPointsWith2 [
 	self assert:((Rectangle origin:  -60 @ -80 corner: 80 @ 60) intersectionPointsWithLine: ((GSegment with: 174.8683298050514@ -174.86832980505142 with: -14.868329805051376@14.868329805051385) asLine)) first
		  =~  (-60 @ 60) .
	self assert:((Rectangle origin:  -60 @ -80 corner: 80 @ 60) intersectionPointsWithLine: ((GSegment with: 174.8683298050514@ -174.86832980505142 with: -14.868329805051376@14.868329805051385) asLine)) second
		  =~  (80 @ -80) .
]

{ #category : #'as yet unclassified' }
GRectangleTest >> testSideWhichHas [

self assert:((Rectangle origin:  1 @ 3 corner: 3 @ 0) sideWhichHas: 1 @ 2.5)
	equals: (GSegment with: 1 @ 3 with: 1 @ 0)  
]
