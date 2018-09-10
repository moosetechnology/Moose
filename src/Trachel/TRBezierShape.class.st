Class {
	#name : #TRBezierShape,
	#superclass : #TRAbstractLineShape,
	#instVars : [
		'listOfPoints'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRBezierShape >> accept: aVisitor [
	aVisitor visitBezierShape: self
]

{ #category : #visitor }
TRBezierShape >> accept: aVisitor with: decoration [
	aVisitor visitBezierShape: self with: decoration
]

{ #category : #hooks }
TRBezierShape >> computePath [
	
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: listOfPoints first.
			
			(2 to: (listOfPoints size -2)) do: [ :index |
				builder 
					curveVia: (listOfPoints at: index) asFloatPoint
					to: (((listOfPoints at: index) + (listOfPoints at: (index + 1))) / 2) asFloatPoint.
			].
			builder 
				curveVia: (listOfPoints at: (listOfPoints size -1) )
				to: (listOfPoints at: (listOfPoints size) ) asFloatPoint.
		
		]
	
]

{ #category : #drawing }
TRBezierShape >> drawOn: athensCanvas [

	athensCanvas pathTransform restoreAfter: [
		
		athensCanvas setShape: self path.
		(athensCanvas setStrokePaint: self themedColor) width: width.
		athensCanvas draw  ]
]

{ #category : #accessing }
TRBezierShape >> encompassingRectangle [
	^ Rectangle encompassing: listOfPoints
]

{ #category : #testing }
TRBezierShape >> includesPoint: aPoint [ 
	| delta points p1 p2 |
	delta := 5.
	points := self points.
	1 to: points size -1 do: [ :i |
		p1 := points at: i.
		p2 := points at: i + 1.
		(aPoint onLineFrom: p1 to: p2 within: delta) ifTrue: [ ^ true ] ].
	^ false.
]

{ #category : #initialization }
TRBezierShape >> initialize [
	super initialize.
	listOfPoints := Array with: 0 @ 0 with: 0 @ 0
]

{ #category : #accessing }
TRBezierShape >> numberOfPoints [
	^ self points size
]

{ #category : #accessing }
TRBezierShape >> points [
	^ listOfPoints copy
]

{ #category : #public }
TRBezierShape >> points: points [
	listOfPoints := points
]

{ #category : #public }
TRBezierShape >> points: aListOfPoints color: aColor [

	self points: aListOfPoints.
	self strokePaint: aColor.
	self color: aColor
]

{ #category : #accessing }
TRBezierShape >> position [
	^ self encompassingRectangle center
]

{ #category : #accessing }
TRBezierShape >> strokePaint: aColor [
	"set the color of the border line"
	self color: aColor
]

{ #category : #actions }
TRBezierShape >> translateBy: aPoint [
	listOfPoints := listOfPoints collect: [ :p | p + aPoint ]

]
