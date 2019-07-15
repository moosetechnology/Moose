Class {
	#name : #GPolygonTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GPolygonTest >> testConvexHullOn [
self
	assert: ((GPolygon convexHullOn:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 40 @ 0 . -10 @ 0 . 40 @ -20 } ) vertices )
	equals:{ -10 @ 0 . 0 @ -20 . 30 @ -30 . 40 @ -20 . 40 @ 0 . 0 @ 10 } asOrderedCollection
]

{ #category : #'as yet unclassified' }
GPolygonTest >> testConvexHullOn1 [
self
	assert: ((GPolygon convexHullOn:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 0 @ 0 . 40 @ 0 . -10 @ 0 . 40 @ -20 } ) vertices )
	equals:{ -10 @ 0 . 0 @ -20 . 30 @ -30 . 40 @ -20 . 40 @ 0 . 0 @ 10 } asOrderedCollection
]

{ #category : #'as yet unclassified' }
GPolygonTest >> testEdges [
self
	assert: ((GPolygon convexHullOn:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 40 @ 0 . -10 @ 0 . 40 @ -20 } ) edges first )
	equals: (GSegment with: -10 @ 0 with: 0 @ -20).
	
self
	assert: ((GPolygon convexHullOn:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 40 @ 0 . -10 @ 0 . 40 @ -20 } ) edges second )
	equals: (GSegment with: 0 @ -20 with: 30 @ -30).
	
self
	assert: ((GPolygon convexHullOn:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 40 @ 0 . -10 @ 0 . 40 @ -20 } ) edges last )
	equals: (GSegment with:  -10 @ 0 with: 0 @ 10).
	
]

{ #category : #'as yet unclassified' }
GPolygonTest >> testEncompasingRectangle [
self
	assert: (GPolygon newVertices:{ 0 @ -20 . 0 @ 10 . 30 @ -30 . 40 @ 0 . -10 @ 0 . 40 @ -20 }) encompassingRectangle 
	equals: (Rectangle left: -10  right:40  top: 10 bottom: -30)
]

{ #category : #'as yet unclassified' }
GPolygonTest >> testIncludesPoint [
self
	assert: ((GPolygon newVertices:{ 10 @ 10 . -10 @ 10 . -10 @ -10  }  )includesPoint: -5@5)
	equals: true
]
