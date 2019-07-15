Class {
	#name : #GEllipseTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GEllipseTest >> testEncompassingRectangle [
	self
		assert: (GEllipse center: 2 @ 2 a: 3 b: 2) encompassingRectangle
		equals: (-1 @ 0 corner: 5 @ 4)
]

{ #category : #'as yet unclassified' }
GEllipseTest >> testEquals [
	self
		assert: (GEllipse center: 10 @ 10 a: 5 b: 10)
		equals: (GEllipse center: 10 @ 10 a: 5 b: 10).
	self
		assert: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
		equals: (GEllipse center: 10 @ 10 a: 5 b: 10) hash
]
