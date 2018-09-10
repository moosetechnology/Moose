Class {
	#name : #TRShapeTest,
	#superclass : #TRTest,
	#category : #'Trachel-Tests'
}

{ #category : #position }
TRShapeTest >> shapesForPositionTest [

	^ Array with: TRBoxShape with: TREllipseShape with: TRSVGPath with: TRBitmapShape with: TRLabelShape.
]

{ #category : #callback }
TRShapeTest >> testAddingCallback [

	| t c s canvas |
	t := OrderedCollection new.
	c := TRAddedCallback new.
	c block: [ :aShape | t add: aShape ].
	self assert: t isEmpty.
	
	s := TRBoxShape new size: 30.
	s addCallback: c.
	self assert: t isEmpty.
	
	canvas := TRCanvas new.
	canvas addShape: s.
	self deny: t isEmpty.
	self assert: t size equals: 1.
	self assert: t anyOne equals: s
]

{ #category : #callback }
TRShapeTest >> testAddingCallbackWithFixed [

	| t c s canvas |
	t := OrderedCollection new.
	c := TRAddedCallback new.
	c block: [ :aShape | t add: aShape ].
	self assert: t isEmpty.
	
	s := TRBoxShape new size: 30.
	s addCallback: c.
	self assert: t isEmpty.
	
	canvas := TRCanvas new.
	canvas addShape: s.
	s setAsFixed.
	self deny: t isEmpty.
	self assert: t size equals: 1.
	self assert: t anyOne equals: s
]

{ #category : #NoShape }
TRShapeTest >> testAddingNoShape [

	| c |
	c := TRCanvas new.
	c addShape: (TRNoShape new).
	self assert: c numberOfShapes = 0
]

{ #category : #bitmap }
TRShapeTest >> testBitmapIncludesPoint [

	| s c |
	s := TRBitmapShape new form: (TRPlatform current newFormWithExtent: 20 @ 20 depth: 32).
	c := TRCanvas new.
	c addShape: s.
	
	self assert: (s includesPoint: 0 @ 0).
	self assert: (s includesPoint: -9 @ -9).
	self assert: (s includesPoint: 9 @ 9).
	self deny: (s includesPoint: 19 @ 19).
]

{ #category : #bitmap }
TRShapeTest >> testBitmapWidth [

	self assert: (TRBitmapShape new form: (TRPlatform current newColorFormWithExtent: 20 @ 20 depth: 32)) width equals: 20
]

{ #category : #composite }
TRShapeTest >> testBoxTransformation [

	| canvas box |
	canvas := TRCanvas new.
	box := TRBoxShape new size: 10.
	canvas addShape: box.
	"regular rectangle"
	self assert: box position equals: 0 @ 0.
	self assert: box encompassingRectangle equals: (-5 @ -5 corner: 5 @ 5).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: 10.
	self assert: box height equals: 10.
	self assert: box extent equals: 10 @ 10.
	self assert: (box includesPoint: 0 @ 0).
	self deny: (box includesPoint: 10 @ 10).
	"translated rectangle"
	box translateTo: 10@10.
	self assert: box position equals: 10 @ 10.
	self assert: box encompassingRectangle equals: (5 @ 5 corner: 15 @ 15).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: box encompassingRectangle width.
	self assert: box height equals: box encompassingRectangle height.
	self assert: box extent equals: box encompassingRectangle extent.
	self assert: (box includesPoint: 5 @ 5).
	self deny: (box includesPoint: 4 @ 10).
	"rotated rectangle"
	box rotateByDegrees: 45.
	self assert: box position equals: 10 @ 10.
	self assert: box encompassingRectangle rounded equals: (3 @ 3 corner: 17 @ 17).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: box encompassingRectangle width.
	self assert: box height equals: box encompassingRectangle height.
	self assert: box extent equals: box encompassingRectangle extent.
	self assert: (box includesPoint: 10 @ 4).
	self deny: (box includesPoint: 6 @ 6).
	"scaled rectangle"
	box scaleBy: 2.
	self assert: box position equals: 10 @ 10.
	self assert: box encompassingRectangle rounded equals: (-4 @ -4 corner: 24 @ 24).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: box encompassingRectangle width.
	self assert: box height equals: box encompassingRectangle height.
	self assert: box extent equals: box encompassingRectangle extent.
	self assert: (box includesPoint: 10 @ -3).
	self deny: (box includesPoint: 0 @ 0).
	"translated rectangle"
	box translateTo: 20 @ 20.
	self assert: box position equals: 20 @ 20.
	self assert: box encompassingRectangle rounded equals: (6 @ 6 corner: 34 @ 34).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: box encompassingRectangle width.
	self assert: box height equals: box encompassingRectangle height.
	self assert: box extent equals: box encompassingRectangle extent.
	self assert: (box includesPoint: 20 @ 7).
	self deny: (box includesPoint: 10 @ 10).
	"back to regular rectangle"
	box rotateByDegrees: -45.
	box scaleBy: 0.5.
	self assert: box position equals: 20 @ 20.
	self assert: box encompassingRectangle equals: (15 @ 15 corner: 25 @ 25).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: box encompassingRectangle width.
	self assert: box height equals: box encompassingRectangle height.
	self assert: box extent equals: box encompassingRectangle extent.
	self assert: (box includesPoint: 16 @ 16).
	self deny: (box includesPoint: 10 @ 10).
	"set width"
	box width: 20.
	self assert: box position equals: 20 @ 20.
	self assert: box encompassingRectangle rounded equals: (10 @ 15 corner: 30 @ 25).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: 20.
	self assert: box height equals: 10.
	self assert: box extent equals: 20 @ 10.
	"set height"
	box height: 20.
	self assert: box position equals: 20 @ 20.
	self assert: box encompassingRectangle rounded equals: (10 @ 10 corner: 30 @ 30).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: 20.
	self assert: box height equals: 20.
	self assert: box extent equals: 20 @ 20.
	"set extent"
	box extent: 30 @ 30.
	self assert: box position equals: 20 @ 20.
	self assert: box encompassingRectangle rounded equals: (5 @ 5 corner: 35 @ 35).
	self assert: box encompassingRectangle center equals: box position.
	self assert: box width equals: 30.
	self assert: box height equals: 30.
	self assert: box extent equals: 30 @ 30.

]

{ #category : #lines }
TRShapeTest >> testCenterOnALine [

	| c l |
	c := TRCanvas new.
	
	l := TRLineShape new from: 50 @ 50 to: 120 @ 100.
	
	c addShape: l.
	
	self assert: l center = (85 @ 75)
	
]

{ #category : #composite }
TRShapeTest >> testEllipseTransformation [

	| canvas ellipse |
	canvas := TRCanvas new.
	ellipse := TREllipseShape new size: 10.
	canvas addShape: ellipse.
	"regular rectangle"
	self assert: ellipse position equals: 0 @ 0.
	self assert: ellipse encompassingRectangle equals: (-5 @ -5 corner: 5 @ 5).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: 10.
	self assert: ellipse height equals: 10.
	self assert: ellipse extent equals: 10 @ 10.
	self assert: (ellipse includesPoint: 0 @ 0).
	self deny: (ellipse includesPoint: 10 @ 10).
	"translated rectangle"
	ellipse translateTo: 10@10.
	self assert: ellipse position equals: 10 @ 10.
	self assert: ellipse encompassingRectangle equals: (5 @ 5 corner: 15 @ 15).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: ellipse encompassingRectangle width.
	self assert: ellipse height equals: ellipse encompassingRectangle height.
	self assert: ellipse extent equals: ellipse encompassingRectangle extent.
	self assert: (ellipse includesPoint: 7 @ 7).
	self deny: (ellipse includesPoint: 4 @ 10).
	"rotated rectangle"
	ellipse rotateByDegrees: 45.
	self assert: ellipse position equals: 10 @ 10.
	self assert: ellipse encompassingRectangle rounded equals: (3 @ 3 corner: 17 @ 17).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: ellipse encompassingRectangle width.
	self assert: ellipse height equals: ellipse encompassingRectangle height.
	self assert: ellipse extent equals: ellipse encompassingRectangle extent.
	self assert: (ellipse includesPoint: 10 @ 7).
	self deny: (ellipse includesPoint: 6 @ 6).
	"scaled rectangle"
	ellipse scaleBy: 2.
	self assert: ellipse position equals: 10 @ 10.
	self assert: ellipse encompassingRectangle rounded equals: (-4 @ -4 corner: 24 @ 24).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: ellipse encompassingRectangle width.
	self assert: ellipse height equals: ellipse encompassingRectangle height.
	self assert: ellipse extent equals: ellipse encompassingRectangle extent.
	self assert: (ellipse includesPoint: 10 @ 0).
	self deny: (ellipse includesPoint: 0 @ 0).
	"translated rectangle"
	ellipse translateTo: 20 @ 20.
	self assert: ellipse position equals: 20 @ 20.
	self assert: ellipse encompassingRectangle rounded equals: (6 @ 6 corner: 34 @ 34).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: ellipse encompassingRectangle width.
	self assert: ellipse height equals: ellipse encompassingRectangle height.
	self assert: ellipse extent equals: ellipse encompassingRectangle extent.
	self assert: (ellipse includesPoint: 20 @ 14).
	self deny: (ellipse includesPoint: 10 @ 10).
	"back to regular rectangle"
	ellipse rotateByDegrees: -45.
	ellipse scaleBy: 0.5.
	self assert: ellipse position equals: 20 @ 20.
	self assert: ellipse encompassingRectangle equals: (15 @ 15 corner: 25 @ 25).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: ellipse encompassingRectangle width.
	self assert: ellipse height equals: ellipse encompassingRectangle height.
	self assert: ellipse extent equals: ellipse encompassingRectangle extent.
	self assert: (ellipse includesPoint: 17 @ 17).
	self deny: (ellipse includesPoint: 10 @ 10).
	"set width"
	ellipse width: 20.
	self assert: ellipse position equals: 20 @ 20.
	self assert: ellipse encompassingRectangle rounded equals: (10 @ 15 corner: 30 @ 25).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: 20.
	self assert: ellipse height equals: 10.
	self assert: ellipse extent equals: 20 @ 10.
	"set height"
	ellipse height: 20.
	self assert: ellipse position equals: 20 @ 20.
	self assert: ellipse encompassingRectangle rounded equals: (10 @ 10 corner: 30 @ 30).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: 20.
	self assert: ellipse height equals: 20.
	self assert: ellipse extent equals: 20 @ 20.
	"set extent"
	ellipse extent: 30 @ 30.
	self assert: ellipse position equals: 20 @ 20.
	self assert: ellipse encompassingRectangle rounded equals: (5 @ 5 corner: 35 @ 35).
	self assert: ellipse encompassingRectangle center equals: ellipse position.
	self assert: ellipse width equals: 30.
	self assert: ellipse height equals: 30.
	self assert: ellipse extent equals: 30 @ 30.

]

{ #category : #callback }
TRShapeTest >> testHasCallback [
	| s |
	s := TRBoxShape new.
	self deny: s hasEventCallback.
	s when: TRMouseClick do: [ :e | ].
	self assert: s hasEventCallback.
]

{ #category : #fixed }
TRShapeTest >> testIsFixed [

	| c s |
	c := TRCanvas new.
	
	s := TRBoxShape new size: 30.
	c addShape: s.
	s setAsFixed.

	self assert: s isFixed.
	self assert: (c fixedShapes includes: s).
	s remove.
	self deny: (c fixedShapes includes: s).
	
	
]

{ #category : #fixed }
TRShapeTest >> testIsFixed02 [

	| c s |
	c := TRCanvas new.
	
	s := TRBoxShape new size: 30.
	c addShape: s.
	s setAsFixed.

	s pushFront
]

{ #category : #callback }
TRShapeTest >> testNumberOfCallbacks [
	| s |
	s := TRBoxShape new.
	self assert: s numberOfCallbacks equals: 0.
	s addCallback: (TRExtentCallback new).
	self assert: s numberOfCallbacks equals: 1
]

{ #category : #position }
TRShapeTest >> testPosition [

	self shapesForPositionTest do: [ :s | | eachShapeClass |
		eachShapeClass := TRBoxShape new.
		eachShapeClass translateTo: 10 @ 20.
		self assert: eachShapeClass position = (10 @ 20)
	]
]

{ #category : #position }
TRShapeTest >> testPositionDefault [

	self shapesForPositionTest do: [ :eachShapeClass |
		self assert: eachShapeClass new position equals: (0 @ 0)
	]
]

{ #category : #position }
TRShapeTest >> testPositionDefaultCenteredSVGPath [
	| svg rectangle |
	svg := TRSVGPath new centeredPath: 'M 0 0 L 30 10 L 20 30 z'.
	rectangle := (Rectangle encompassing: (Array with: 0@0 with: 30@10 with: 20@30) ).
	self assert: svg position equals: (0 @ 0).
	self assert: svg center equals: (0 @ 0).
	self deny: svg position = rectangle center.
]

{ #category : #position }
TRShapeTest >> testPositionDefaultSVGPath [
	| svg rectangle |
	svg := TRSVGPath new path: 'M 0 0 L 30 10 L 20 30 z'.
	rectangle := (Rectangle encompassing: (Array with: 0@0 with: 30@10 with: 20@30)).
	self assert: svg position equals: (0 @ 0).
	self assert: svg center equals: rectangle center.
	self deny: svg position = rectangle center.
]

{ #category : #position }
TRShapeTest >> testPositionWithFloats [

	| box |
	box := TRBoxShape new.
	box translateTo: 1.1234 @ 1.1234.
	self assert: box position = (1.1234 @ 1.1234)
]

{ #category : #removing }
TRShapeTest >> testRemoving [
	| t callback shape canvas |
	t := nil.
	callback := TRRemoveCallback new.
	callback block: [ :aShape | t := aShape hash ].
	
	shape := TRBoxShape new size: 20.
	shape addCallback: callback.
	
	canvas := TRCanvas new.
	self assert: canvas numberOfShapes equals: 0.
	canvas addShape: shape.
	shape translateBy: 5 @ 5.
	self assert: t isNil.
	
	self assert: canvas numberOfShapes equals: 1.
	shape remove.
	self assert: t equals: shape hash.
	self assert: canvas numberOfShapes equals: 0.
]

{ #category : #replacing }
TRShapeTest >> testReplacing01 [
	| c s1 s2 |
	c := TRCanvas new.
	s1 := TRBoxShape new extent: 30 @ 40; color: Color red.
	s2 := TRBoxShape new extent: 50 @ 20; color: Color green.
	c addShape: s1.
	s1 translateBy: 5 @ 5.
	
	self assert: s1 canvas == c.
	self assert: s2 canvas ~~ c.
	
	self assert: s1 extent ~= s2 extent.
	self assert: s1 position ~= s2 position.
	
	s1 replaceShapeBy: s2.
	self assert: s1 canvas ~~ c.
	self assert: s2 canvas == c.
	
	self assert: s1 extent = s2 extent.
	self assert: s1 position = s2 position.

]

{ #category : #position }
TRShapeTest >> testScaleBox [

	| box |
	box := TRBoxShape new.
	box scaleBy: 2.0.
	self assert: box scale equals: 2.0 @ 2.0.
]

{ #category : #position }
TRShapeTest >> testScaleSVG [

	| svg rectangle scaledRectangle |
	svg := TRSVGPath new path: 'M 0 0 L 30 10 L 20 30 z'.
	rectangle := svg encompassingRectangle. 
	svg scaleBy: 2.0.
	scaledRectangle := svg encompassingRectangle.
	self assert: svg scale equals: 2.0 @ 2.0.
	self deny: rectangle = scaledRectangle.
	self assert: rectangle width * 2.0 equals: scaledRectangle width.
	self assert: rectangle height * 2.0 equals: scaledRectangle height.
]
