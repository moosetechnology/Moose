Class {
	#name : #GRayTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GRayTest >> test [
	self skip.
	self
		assert: (( GRay origin: 28 @ 30 direction: (-14.19823766979061@ -21.67099433810146) )asLine intersect: 
		(( GRay origin: 20 @ 23 direction: (-16.331370027835703@ -32.66274005567141))asLine) )
		equals: 9@1.

]

{ #category : #'as yet unclassified' }
GRayTest >> test1 [
	self
		assert: (( GRay origin: 28 @ 30 direction: (-14.19823766979061@ -21.67099433810146)) hasPoint:
		(9@1)). 
	self
		assert: ((GRay origin: 20 @ 23 direction: (-16.331370027835703@ -32.66274005567141)) hasPoint: (9@1)).

]

{ #category : #'as yet unclassified' }
GRayTest >> testCutWith [
	self
		assert: ((GRay origin: -10 @ 10 direction: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1
		equals: (-5/2)@15.
	self
		assert: ((GRay origin: -10 @ 10 direction: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2
		equals: -10 @ 10.	
	self
		assert: ((GRay origin: -30 @ 0 direction: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v1 
		equals: (-15 @ 9) .	
	self
		assert: ((GRay origin: -30 @ 0 direction: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 )) v2 
		equals: (-5 @ 15).
	self
		assert: ((GRay origin: -30 @ 30 direction: 20 @ 30) cutWith: (Rectangle origin: -15 @ 0 corner: 15 @ 15 ))
		equals: nil.	
]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy [

	self
		assert: (( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy1: 1 ) direction
		equals: (13@(39/4)).
	self
		assert: (( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy1: 5 ) direction
		equals: (17@(51/4)).

]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy0 [
	self skip.
	self
		assert: (( GRay origin: 0 @ 0 direction: 4 @ 2) extendBy: 1 ) direction
		equals: ( 5 @ ( 5/2 )).

	self
		assert: (( GRay origin: 0 @ 0 direction: -4 @ -2) extendBy: 1 ) direction
		equals: ( -5 @ ( -5/2 )).

]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy1 [
	self skip.
	self
		assert: (( GRay origin: 0 @ 0 direction: -4 @ 2) extendBy: 1 ) direction
		equals: ( -5 @ ( 5/2 )).

	self
		assert: (( GRay origin: 0 @ 0 direction: 4 @ -2) extendBy: 1 ) direction
		equals: ( 5 @ ( -5/2 )).
]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy3 [

	self
		assert: 
	 ((( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 1 ) asLine = (( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 5 ) asLine)
	equals: true.
	
self
		assert: 
	 ((( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 1 ) asLine ~= (( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 5 ) asLine)
	equals: false.
]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy4 [
	self skip.
	self
		assert: (( GRay origin: 4 @ 2 direction: 0 @ 2) extendBy: 1 ) direction
		equals: ( -1 @ 2).
	self
		assert: (( GRay origin: 4 @ 2 direction: 4 @ 0) extendBy: 1 ) direction
		equals: ( 4 @ -1).
	self
		assert: (( GRay origin: 4 @ 2 direction: 0 @ 0) extendBy: 1 ) direction
		equals: ( -1 @ ( -1/2 )).
	self
		assert: (( GRay origin: 4 @ 2 direction: 2 @ 1) extendBy: 1 ) direction
		equals: ( 1 @ ( 1/2 )).
]

{ #category : #'as yet unclassified' }
GRayTest >> testExtendBy5 [
	self skip.
	self
		assert: 	((( GRay origin: 63@61 direction: (62@61) ) extendBy: 5 ) direction)
		equals: ( 57 @ 61).
		
]

{ #category : #'as yet unclassified' }
GRayTest >> testFlipped [
	self
		assert: ((GRay origin: 100 @ 100 direction: 80 @ 110) flipped )direction
		equals: 120 @ 90.
	self
		assert: ((GRay origin: 100 @ 100 direction:  120 @ 90) flipped )direction
		equals: 80 @ 110
]

{ #category : #'as yet unclassified' }
GRayTest >> testHas [

	self
		assert: (( GRay origin: 0 @ 0 direction: 12 @ 9 ) hasPoint: (13@(39/4)) ) 
		equals: true.
	self
		assert: (( GRay origin: 0 @ 0 direction: 12 @ 9 )asSegment has: (13@(39/4)) ) 
		equals: false.
	self
		assert: (( GRay origin: 0 @ 0 direction: (13@(39/4))) hasPoint: 12 @ 9  ) 
		equals: true.
	self
		assert: (( GRay origin: 0 @ 0 direction: (13@(39/4))) asSegment has: 12 @ 9  ) 
		equals: true.
	

]

{ #category : #'as yet unclassified' }
GRayTest >> testHasPoint [
	self
		assert: ((GRay origin: 100 @ 100 direction: 80 @ 110) hasPoint: 120 @ 90)
		equals: false.
	self
		assert: ((GRay origin: 100 @ 100 direction: 120 @ 90) hasPoint: 120 @ 90)
		equals: true.
	self
		assert: ((GRay origin: 100 @ 100 direction: 120 @ 90) hasPoint: 100 @ 100)
		equals: true.
	self
		assert: ((GRay origin: 100 @ 100 direction: 110 @ 110) hasPoint: 150 @ 150)
		equals: true.	
]

{ #category : #'as yet unclassified' }
GRayTest >> testHasPoint1 [
	self skip.
	self
		assert: 	((( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 1 ) asSegment has: 13@(39/4))
		equals: true.
	self
		assert: ((( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 5 ) asSegment has: 13@(39/4))
		equals: true.
	self
		assert: 	((( GRay origin: 0 @ 0 direction: 12 @ 9 ) extendBy: 1 ) asSegment has: 17@(51/4))
		equals: false.
]

{ #category : #'as yet unclassified' }
GRayTest >> testHasPoint2 [
	self skip.
"	self
		assert: 	((( GRay origin: ((57583/914)@(56095/914)) direction: (62.998905906959145@61.37297058105469) ) extendBy: 5 ) asSegment has: (62.998905906959145@61.37297058105469))
		equals: true."
		self
		assert: 	((( GRay origin: 63@61 direction: (62@61) ) extendBy: 5 ) asSegment has: (62@61))
		equals: true.

]

{ #category : #'as yet unclassified' }
GRayTest >> testLength [
	self
		assert: (( GRay origin: 0 @ 0 direction: -12 @ 16 ) length )
		equals: 400 sqrt.
	self
		assert: (( GRay origin: 0 @ 0 direction: 12 @ 9) length )
		equals: 225 sqrt.	
]

{ #category : #'as yet unclassified' }
GRayTest >> testMultiply [
	self
		assert: (( GRay origin: 0 @ 0 direction: -12 @ 16 ) * ( GRay origin: 0 @ 0 direction: 12 @ 9)  )
		equals: 0.
		
]
