Class {
	#name : #TRBoxShape,
	#superclass : #TRAbstractBoxShape,
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRBoxShape >> accept: aVisitor [
	aVisitor visitBoxShape: self
]

{ #category : #private }
TRBoxShape >> computePath [
	canvas ifNil: [ ^ self ].
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: rectangle topLeft;
				lineTo: rectangle topRight;
				lineTo: rectangle bottomRight;
				lineTo: rectangle bottomLeft;
				lineTo: rectangle topLeft;
				closePath ]
]

{ #category : #testing }
TRBoxShape >> includesPoint: aPoint [
	| invertedPoint |
	(matrix sx = 0 or: [ matrix sy = 0  ]) ifTrue: [ ^ false ].
	invertedPoint := matrix inverseTransform: aPoint.
	^ rectangle containsPoint: invertedPoint.
]
