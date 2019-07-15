Class {
	#name : #GSegmentTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GSegmentTest >> testAlreadyExistIn [
	|segm1 segm2 segm aSet |
	segm1 := GSegment with:5@2  with: 3@4.
	segm2 := GSegment with:1@1  with:4@8.
	segm := GSegment with: 0@0 with: 3@3.
	aSet := Set new.
	aSet add: segm1.
	aSet add: segm2.
	self assert: (segm alreadyExistIn:aSet )
		equals: false
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testAlreadyExistIn1 [
	|segm1 segm2 segm aSet |
	segm1 := GSegment with:1@2  with: 3@4.
	segm2 := GSegment with:1@1  with:2@2.
	segm := GSegment with: 0@0 with: 3@3.
	aSet := Set new.
	aSet add: segm1.
	aSet add: segm2.
	self assert: (segm alreadyExistIn:aSet )
"equels:true"
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testAsLine [
|line|
	line := (GSegment with:  1 @ 3 with: 3 @ 0) asLine .
	self assert: line a equals: 3.
	self assert: line b equals: 2.
	self assert: line c equals: -9.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testAsLine1 [
|line|
	line := (GSegment with:  -2 @ 4 with: 2 @ 4) asLine .
	self assert: line a equals: 0.
	self assert: line b equals: 1.
	self assert: line c equals: -4.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testAsLine2 [
|line|
	line := (GSegment with:  1 @ 3 with: 1 @ 0) asLine .
	self assert: line a equals: 1.
	self assert: line b equals: 0.
	self assert: line c equals: -1.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testBelowPoint [
self assert:((GSegment with: -2 @ 4 with: 2 @ 4) belowPoint: -2 @ 4 ) 
	equals: false.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testBelowPoint1 [

self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) belowPoint: 0 @ 5 ) 
	equals: true.
self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) belowPoint: 0 @ -5 ) 
	equals: false.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testBelowPoint2 [
self assert:((GSegment with:  -2 @ 4 with: -2 @ 0) belowPoint: 0 @ 2 ) 
	equals: true.
self assert:((GSegment with:  -2 @ 4 with: -2 @ 0) belowPoint: -4 @ 2 ) 
	equals: false.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testCutWith [
	self
		assert: ((GSegment with: -10 @ 10 with: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1
		equals: (-5/2)@15.
	self
		assert: ((GSegment with: -10 @ 10 with: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2
		equals: -10 @ 10.	
	self
		assert: ((GSegment with: -30 @ 0 with: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1 
		equals: (-15 @ 9) .	
	self
		assert: ((GSegment with: -30 @ 0 with: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2 
		equals: (-5 @ 15).
	self
		assert: ((GSegment with: -30 @ 30 with: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 ))
		equals: nil.	
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testDist1 [
self assert:(  ((GSegment with: ((838/41)@(4811/82)) with:((57583/914)@(56095/914))) dist: (57.998905906959145@61.11074842728413)) lesserOrDifferentThan: (2 * 0.02757564283371476 )  ) 
	equals: true.
	
"self
	assert: ((GSegment with:	((838/41)@(4811/82)) with:((57583/914)@(56095/914))) asLine
		hasPoint: (57.998905906959145@61.11074842728413) withApproximation: 0.02757564283371476 )
	equals: true."
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testDistTo [
self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) distTo: -2 @ 4 ) 
	equals: 0.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testDistTo1 [
self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) distTo: 2 @ 4 ) 
	equals: 0.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testDistTo2 [
self assert:((GSegment with: (477/11)@(149/2) with:(-56.73661227723915@143.3189209406019)) distTo: (36819/1022)@(82249/1022) ) 
	equals: 0.7697676365059569.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testEqual [
	|segm1 segm2 |
	segm1 := GSegment with: 1@2 with: 3@4.
	segm2 := GSegment with: 0@0 with: 3@3.

	self assert: (segm1 asLine = (segm2 asLine))
	equals:false
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testEqual1 [
	|segm1 segm2 |
	segm1 := GSegment with:1@1  with: 3@3.
	segm2 := GSegment with: 0@0 with: 3@3.

	self assert: (segm1 asLine = (segm2 asLine))
	equals:true
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testEqual2 [
	|segm1 segm2 |
	segm1 := GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ).
	segm2 := GSegment with: ( 24.494897427831784 @ 24.49489742783178 ) with: ( -24.494897427831784 @ -24.494897427831795 ).

	self assert: (segm1 asLine = (segm2 asLine))
	equals:true
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testEqual3 [
	|segm1 segm2 |
	segm1 := GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ).
	segm2 := GSegment with: ( 24.494897427831784 @ 24.49489742783178 ) with: ( -24.494897427831784 @ -24.494897427831795 ).

	self assert: (segm1 = segm2)
	equals:true
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testExtendSegmVert [
	| segm1 segm2 segm3 frame |
	segm1 := (GSegment with: -2 @ 4 with: 2 @ 4).
	segm2 := (GSegment with: -2 @ 2 with: -2 @ 4).
	segm3 := (GSegment with: -2 @ 2 with: 2 @ 4).
	frame := Rectangle origin: -5 @ 0 corner: 5 @ 5.
	self
		assert: ( segm1 extendSegmVert: 2 @ 4 to: frame )
		equals: ( GSegment with: -2 @ 4 with: 5 @ 4 ).
	self
		assert: ( segm1 extendSegmVert: -2 @ 4 to: frame )
		equals: ( GSegment with: -5 @ 4 with: 2 @ 4 ).	
	self
		assert: ( segm2 extendSegmVert: -2 @ 2 to: frame )
		equals: ( GSegment with: -2 @ 0 with: -2 @ 4 ).	
	self
		assert: ( segm2 extendSegmVert: -2 @ 4 to: frame ) 
		equals: ( GSegment with: -2 @ 2 with: -2 @ 5 ).
	self
		assert: ( segm3 extendSegmVert: -2 @ 2 to: frame )
		equals: ( GSegment with: -5 @ (1/2) with: 2 @ 4 ).
	self
		assert: ( segm3 extendSegmVert: 2 @ 4 to: frame )
		equals: ( GSegment with: -2 @ 2 with: 4 @ 5 ).	
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testHas [

	self
		assert: (( GSegment with: 0 @ 0 with: 12 @ 9 ) has: (13@(39/4)) ) 
		equals: false.
	self
		assert: (( GSegment with: 0 @ 0 with: (13@(39/4))) has: 12 @ 9  ) 
		equals: true.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testHasPoint [

	self assert:((GSegment with:  1 @ 3 with: 3 @ 0) hasPoint: 1 @ 3)
   		equals: true.
	self assert:((GSegment with:  1 @ 3 with: 3 @ 0) hasPoint: 3 @ 0)
   		equals: true.
	self assert:((GSegment with:  -1 @ 1 with: 1 @ -1) hasPoint: 0 @ 0)
   		equals: true.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIntersect [
	self
		assert: ((GSegment with: -1 @ -1 with: 1 @ 1) = (GSegment with: 1 @ 1 with: -1 @ -1))
		equals: true.
	self
		assert: ((GSegment with: -1 @ -1 with: 1 @ 1) = (GSegment with: -1 @ 1 with: -1 @ 1))
		equals: false.	
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIntersect1 [
	self
		assert: ((GSegment with: -1 @ -1 with: 1 @ 1) intersect:(GSegment with: -3 @ 3 with: -1 @ 1))
		equals: nil
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIntersect2 [
	self
		assert: ((GSegment with: -1 @ -1 with: 1 @ 1) intersect:(GSegment with: -3 @ 3 with: 2 @ -2))
		equals: (0@0)
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIntersectionPointWithVector [
	self
		assert: ((GSegment with: 2 @ 0 with: 2 @ 3) intersectionPointWithRay: (GRay origin: 0 @ 0  direction:  3 @ 2))
		equals: 2 @ (4/3).
	self
		assert: ((GSegment with: 2 @ 0 with: 2 @ 3) intersectionPointWithRay: (GRay origin: 0 @ 0  direction:  1 @ 1))
		equals: 2 @ 2.	
	self
		assert: ((GSegment with: -2 @ 0 with: -2 @ 3) intersectionPointWithRay: (GRay origin: 0 @ 0  direction:  1 @ 1))
		equals: nil.
	self
		assert: ((GSegment with: 0 @ 0 with: 0 @ 3) intersectionPointWithRay: (GRay origin: 0 @ 0  direction:  1 @ 1))
		equals: 0 @ 0.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIsOnLinePointWithRespectWith [
"self assert: ((GSegment with:((18427/974)@(57187/974)) with:(362.2460738148583@ -421.94450334080176)) hasOnLinePoint: ((838/41)@(4811/82)) withRespectTo: ((18427/974)@(57187/974)) withApprox: 0.8902246907382428)
equals: false."
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testIsOnLineWith [
	self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) isOnLineWith:  (GSegment with:  -2 @ 4 with: 2 @ 4) ) 
		equals: true.
	self assert:((GSegment with:  -4 @ 4 with: 4 @ 4) isOnLineWith:  (GSegment with:  -2 @ 4 with: 2 @ 4) ) 
		equals: true.
	self assert:((GSegment with:  -2 @ 3 with: 2 @ 4) isOnLineWith:  (GSegment with:  -2 @ 4 with: 2 @ 4) ) 
		equals: false.
	self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) isOnLineWith:  (GSegment with:  -2 @ 2 with: 2 @ 2) ) 
		equals: false.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testLength [
	self
		assert: (GSegment with: 0 @ 0 with: 3 @ 4) length
		equals: 5
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testLength1 [
	self
		assert: (GSegment with: -2 @ 1 with: 3 @ 4) length
		equals: 34 sqrt
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testMidPoint [
	self
		assert: (GSegment with: -1 @ 2 with: 2 @ 1) midPoint 
		equals: 0.5 @ 1.5
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testMidPoint1 [
	self
		assert: (GSegment with: 2 @ 1 with: 2 @ 1) midPoint 
		equals: 2 @ 1
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testPerpendicularBisector [
	self
		assert: (GSegment with: -1 @ 2 with: 0 @ 0) perpendicularBisector a
		equals: 1
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testPerpendicularBisector1 [
|line|
	line := (GSegment with: 1 @ 3 with: -1 @ 1) perpendicularBisector. 
		self assert: line a equals: -2.
		self assert: line b equals: -2.
		self assert: line c equals: 4.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testPerpendicularBisector2 [
	self
		assert: (GSegment with: -1 @ 2 with: 0 @ 0) perpendicularBisector b
		equals: -2
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testPerpendicularBisector3 [
|line|
	line := (GSegment with: 3 @ 0 with: 1 @ 3)  perpendicularBisector. 
		self assert: line a equals: -2.
		self assert: line b equals: 3.
		self assert: line c equals: -1/2.
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testextendWithAnd [
|frame|
frame := Rectangle origin: -5 @ 0 corner: 5 @ 5 .
self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) extendWith: 3 @ 4 and: frame) 
	equals: (GSegment with: -5 @ 4 with: 3 @ 4).
]

{ #category : #'as yet unclassified' }
GSegmentTest >> testextendWithAnd1 [
|frame|
frame := Rectangle origin: -5 @ 0 corner: 5 @ 5 .
self assert:((GSegment with:  -2 @ 4 with: 2 @ 4) extendWith: 3 @ 4 and: frame) 
	equals: (GSegment with: 3 @ 4 with: -5 @ 4).
]
