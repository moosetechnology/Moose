Class {
	#name : #TRBezier4Shape,
	#superclass : #TRBezier3Shape,
	#category : #'Trachel-Shapes'
}

{ #category : #hooks }
TRBezier4Shape >> computePath [
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: listOfPoints first.
			builder 
				curveViaX: listOfPoints second x asFloat Y: listOfPoints second y asFloat
				viaX: listOfPoints third x asFloat Y: listOfPoints third y asFloat 
				toX: listOfPoints fourth x asFloat Y: listOfPoints fourth y asFloat.
		]
]

{ #category : #'instance creation' }
TRBezier4Shape >> from: a to: b [
	"for layout process"
]

{ #category : #public }
TRBezier4Shape >> points: points [
	self assert: [ points size = 4 ] description: 'Only 3 points may be provided'.
	listOfPoints := points
]

{ #category : #public }
TRBezier4Shape >> points: aListOfPoints color: aColor [
	self assert: [ aListOfPoints size = 4 ] description: 'Only 3 points may be provided'.
	
	self points: aListOfPoints.
	self strokePaint: aColor.
	self color: aColor
]
