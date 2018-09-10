Class {
	#name : #TRSimpleArrowShape,
	#superclass : #TRAbstractArrowHeadShape,
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #visitor }
TRSimpleArrowShape >> accept: aVisitor [
	aVisitor visitArrowShape: self
]

{ #category : #hooks }
TRSimpleArrowShape >> computePath [
	| vector u unit middle endPoint |
	self shouldBeDrawn ifFalse: [ ^ self ].
	vector := self to - self from. 
	u := vector normal.
	unit := vector / vector r.
	endPoint := self to - (vector * (1-percentage)).
	middle := endPoint - (unit * size). 
	left :=  middle - (u * baseSize / 2).
	right := middle + (u * baseSize / 2).
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: left;
				lineTo: endPoint;
				lineTo: right. ]
]

{ #category : #initialization }
TRSimpleArrowShape >> initialize [
	super initialize.
	open := true.
	
]

{ #category : #hooks }
TRSimpleArrowShape >> shouldBeDrawn [
	"Return true if the arrow head should be drawn"
	^ self to ~= self from
]
