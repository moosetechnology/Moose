Class {
	#name : #GRoundedRectangleTest,
	#superclass : #TestCase,
	#category : 'Geometry-Test'
}

{ #category : #'as yet unclassified' }
GRoundedRectangleTest >> testCorners [
	| rect |
	rect := GRoundedRectangle
		rectangle: (GRectangle origin: -40 @ -20 corner: 40 @ 20)
		borderRadius: 10.
	self
		assert: rect corners
		equals:
			(Array
				with:
					(GCircleArc
						center: 30 @ -10
						radius: 10
						startAngle: 0
						endAngle: Float halfPi)
				with:
					(GCircleArc
						center: -30 @ -10
						radius: 10
						startAngle: Float halfPi
						endAngle: Float pi)
				with:
					(GCircleArc
						center: -30 @ 10
						radius: 10
						startAngle: Float pi
						endAngle: Float threePi / 2)
				with:
					(GCircleArc
						center: 30 @ 10
						radius: 10
						startAngle: Float threePi / 2
						endAngle: Float twoPi))
]
