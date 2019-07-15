Class {
	#name : #TREmptyArrowHeadShape,
	#superclass : #TRAbstractArrowHeadShape,
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #visitor }
TREmptyArrowHeadShape >> accept: aVisitor [
	aVisitor visitArrowHeadShape: self
]

{ #category : #hooks }
TREmptyArrowHeadShape >> computePath [
	| vector r u unit middle endPoint |
	vector := self to - self from. 
	r := vector r.
	r = 0 ifTrue: [ ^ false ].
	u := vector normal.
	unit := vector / r.
	endPoint := self to - (vector * (1-percentage)).
	middle := endPoint - (unit * size). 
	left :=  middle - (u * size).
	right := middle + (u * size).
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: endPoint;
				lineTo: left;
				lineTo: right;
				lineTo: endPoint. ]
]

{ #category : #initialization }
TREmptyArrowHeadShape >> initialize [
	super initialize.

]
