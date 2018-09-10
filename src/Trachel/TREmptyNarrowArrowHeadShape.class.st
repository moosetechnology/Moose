Class {
	#name : #TREmptyNarrowArrowHeadShape,
	#superclass : #TRAbstractArrowHeadShape,
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #hooks }
TREmptyNarrowArrowHeadShape >> computePath [
	| vector r u unit middle endPoint |
	vector := self to - self from.
	r := vector r.
	r = 0
		ifTrue: [ ^ false ].
	u := vector normal.
	unit := vector / r.
	endPoint := self to - (vector * (1 - percentage)).
	middle := endPoint - (unit * size).
	left := middle - (u * size * 0.5).
	right := middle + (u * size * 0.5).
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: endPoint;
				lineTo: left;
				lineTo: right;
				lineTo: endPoint ]
]
