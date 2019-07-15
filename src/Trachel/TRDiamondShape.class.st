Class {
	#name : #TRDiamondShape,
	#superclass : #TRAbstractLineDecoratorShape,
	#instVars : [
		'left',
		'right',
		'end'
	],
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #visitor }
TRDiamondShape >> accept: aVisitor [
	aVisitor visitDiamondShape: self
]

{ #category : #hooks }
TRDiamondShape >> computePath [
	| vector r u unit middle endPoint |
	vector := self to - self from.
	r := vector r.
	r = 0 ifTrue: [ ^ false ].
	
	u := vector normal.
	unit := vector / r.
	endPoint := self to - (vector * (1-percentage)).
	"toPointWithOffset := self to - (offset * (vector r - size) * unit)." "add offset"
	end := endPoint - (2*unit * size). 
	middle := endPoint - (unit * size). 
	left :=  middle - (u * size * 0.7).
	right := middle + (u * size * 0.7).
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: end;
				lineTo: left;
				lineTo: endPoint;
				lineTo: right;
				lineTo: end. ]
]
