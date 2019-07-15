Class {
	#name : #GLineTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GLineTest >> testCutWith [
	self
		assert: ((GLine a: -20  b: 30  c: -500 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1
		equals: (-15@(20/3)).
	self
		assert: ((GLine a: -20  b: 30  c: -500 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2
		equals: ((-5/2)@15).	
	self
		assert: ((GLine a: -30  b: 50  c: -900 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1 
		equals: (-15 @ 9) .	
	self
		assert: ((GLine a: -30  b: 50  c: -900 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2 
		equals: (-5 @ 15).
	self
		assert: ((GLine a: 0  b: 1  c: -25 ) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 ))
		equals: nil.	
]

{ #category : #'as yet unclassified' }
GLineTest >> testDist [
self
	assert: ((GLine a:1 b:0 c: -7)dist: 7 @ 0)
	equals: 0.
self
	assert: ((GLine a:1 b:0 c: -7)dist: 7 @ 7)
	equals: 0.
self
	assert: ((GLine a:1 b:0 c: -7)dist: 0 @ 0)
	equals: 7.

	
]

{ #category : #'as yet unclassified' }
GLineTest >> testEquel [
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: -78))
	equals: true.
self
	assert: ((GLine a:0 b:1 c: -13)= (GLine a:0 b:6 c: -78))
	equals: true.
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:1 b:6 c: -78))
	equals: false.
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: -7))
	equals: false.
self
	assert: ((GLine a:1 b:0 c: -13)= (GLine a:6 b:0 c: -78))
	equals: true.
self
	assert: ((GLine a:0 b:1 c: 0)= (GLine a:0 b:6 c: 0))
	equals: true.
self
	assert: ((GLine a:1 b:0 c: 0)= (GLine a:1 b:0 c: 0))
	equals: true.

]

{ #category : #'as yet unclassified' }
GLineTest >> testEquel1 [
self
	assert: ((GLine a:1 b:1 c: -13)= (GLine a:6 b:6 c: 0))
	equals: false.
self
	assert: ((GLine a:0 b:1 c: -13)= (GLine a:0 b:6 c: -78))
	equals: true.

	
]

{ #category : #'as yet unclassified' }
GLineTest >> testEquel2 [
self
	assert: ( ( GLine a: -48.989794855663575 b: 48.98979485566357 c: 4.547473508864641e-13 ) = ( GLine a:
	-138.58803762173304 b: 138.58803762173304 c: 1.8189894035458565e-12 ) )
	equals: true.

]

{ #category : #'as yet unclassified' }
GLineTest >> testEquel3 [
self
	assert: ( ( 
	( GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ) ) asLine
	= (
	( GSegment with: ( -99.30232333601874 @ -99.30232333601876 ) with: ( 39.285714285714285 @ 39.28571428571428 ) ) asLine )
	) )
	equals: true.

]

{ #category : #'as yet unclassified' }
GLineTest >> testEquel4 [
self
	assert: ( ( 
	( GSegment with: ( -24.494897427831784 @ -24.494897427831795 ) with: ( 24.494897427831784 @ 24.49489742783178 ) ) asLine
	= (
	( GSegment with: ( 24.494897427831784 @ 24.49489742783178 ) with: ( -24.494897427831784 @ -24.494897427831795 ) ) asLine )
	) )
	equals: true.

]

{ #category : #'as yet unclassified' }
GLineTest >> testHasPoint [
"self
	assert: ((GLine a:(-50634/18737)b:(1594971/37474)c: (-183016593/74948)) 
		hasPoint: (57.998905906959145@61.11074842728413) withApproximation: 0.02757564283371476 )
	equals: true."
"self
	assert: ((GSegment with:	((838/41)@(4811/82)) with:((57583/914)@(56095/914))) asLine
		hasPoint: (57.998905906959145@61.11074842728413) withApproximation: 0.02757564283371476 )
	equals: true."
]

{ #category : #'as yet unclassified' }
GLineTest >> testHasPoint2 [

self
	assert: ((GSegment with:	((17674/229)@(14582/229)) with:(76.82622578909061@64.97050543967634)) 
			asLine hasPoint: ((-28206/397)@(50382/397)) withApproximation: 0.525738602984892 )
	equals: false.
"self
	assert: ((GSegment with:	((17674/229)@(14582/229)) with:(76.82622578909061@64.97050543967634)) 
			asLine hasPoint: ((9244/147)@(1090/21)) withApproximation: 0.525738602984892 )
	equals: true."
]

{ #category : #'as yet unclassified' }
GLineTest >> testIntersect [
self
	assert: ((GLine a: 2 b: -3 c: 0.5) intersect: (GLine a: 1 b: 1 c: -2))
	equals: 1.1 @ 0.9
]

{ #category : #'as yet unclassified' }
GLineTest >> testIntersect1 [
self
	assert: ((GLine a: 2 b: -3 c: 0.5) intersect: (GLine a: -2 b: -2 c: 4))
	equals: 1.1 @ 0.9
]

{ #category : #'as yet unclassified' }
GLineTest >> testParallelTo [
self
	assert: ((GLine a: 0 b: -3 c: 0.5) parallelTo: (GLine a: -2 b: 0 c: 4))
	equals: false.
self
	assert: ((GLine a: 0 b: -3 c: 0.5) parallelTo: (GLine a: -2 b: 1 c: 4))
	equals: false.
self
	assert: ((GLine a: 1 b: 2 c: 0.5) parallelTo: (GLine a: 2 b: 4 c: 4))
	equals: true.
self
	assert: ((GLine a: 0 b: 2 c: 0.5) parallelTo: (GLine a: 0 b: 2 c: 0.5))
	equals: true.
]

{ #category : #'as yet unclassified' }
GLineTest >> testThroughAndHasPoint [
self
	assert: ((GLine through: 1@1 and: 3@3)through: 1@1 and: 3@3 hasPoint: 2@2 )
	equals: true.
self
	assert: ((GLine through: 1@1 and: 2@2)through: 1@1 and: 2@2 hasPoint: 3@3 )
	equals: true.
self
	assert: ((GLine through: 1@1 and: 2@2)through: 1@1 and: 2@2 hasPoint: 2@1 )
	equals: false.
]
