"
A RTSVGVisitor is a RTVisitor for SVG exporting.

"
Class {
	#name : #RTSVGVisitor,
	#superclass : #RTVisitor,
	#instVars : [
		'view',
		'stream',
		'afterStream',
		'canvas',
		'interactions',
		'markers',
		'center',
		'count'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream [
	self new view: view; stream: stream; visit; yourself.
]

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream canvas: aRectangle [
	self new view: view; stream: stream; canvas: aRectangle; visit; yourself.
]

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream center: aPoint [
	self new view: view; stream: stream; center: aPoint; visit; yourself.
]

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream with: interactions [
	self new view: view; stream: stream; interactions: interactions; visit; yourself.
]

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream with: interactions canvas: aRectangle [
	self new view: view; stream: stream; interactions: interactions; canvas: aRectangle; visit; yourself.
]

{ #category : #visitor }
RTSVGVisitor class >> visit: view on: stream with: interactions canvas: aRectangle center: aPoint [
	self new view: view; stream: stream; interactions: interactions; canvas: aRectangle; center: aPoint; visit; yourself.
]

{ #category : #interactions }
RTSVGVisitor >> addContainedInteractions: id element: e [
	| aNumber |
	aNumber := self alignPoint: e center.
	(interactions at: e ifAbsent: [OrderedCollection new]) 
		do: [ :i | i contained
			ifTrue: [ i addEventHandlers: stream id: id  element: e center: aNumber] ]
]

{ #category : #interactions }
RTSVGVisitor >> addEmbeddingInteractions: id element: e [
	|closings aNumber |
	aNumber := self alignPoint: e center.
	closings := OrderedCollection new.
	(interactions at: e ifAbsent: [OrderedCollection new]) 
		do: [ :i | (i external not and: [i contained not])
			ifTrue: [ 
				closings add: (i addEventHandlers: stream id: id  element: e center: aNumber)] ].
	^(closings reverse)
]

{ #category : #interactions }
RTSVGVisitor >> addExternalInteractions: id element: el [
	| aNumber |
	aNumber := self alignPoint: el center.
	(interactions at: el ifAbsent: [OrderedCollection new]) 
		do: [ :i | i external
			ifTrue: [ 
				self stream
					nextPutAll: ' onmousemove="showPopup(evt, ''';
					nextPutAll: id;
					nextPutAll: ''')" onmouseout="hidePopup(''';
					nextPutAll: id;
					nextPutAll: ''')"'.
		
				self afterStream add: [:e | 
					i addEventHandlers: stream id: id  element: el center: aNumber] ]]
]

{ #category : #accessing }
RTSVGVisitor >> afterStream [
	"Collection of evaluation promises, needed to write instructions, such as popups, after the actual svg code of the elements"
	^ afterStream
]

{ #category : #accessing }
RTSVGVisitor >> afterStream: anObject [
	afterStream := anObject
]

{ #category : #alignment }
RTSVGVisitor >> alignLine: aLine [
	|distanceX distanceY fromX fromY|
	distanceX := canvas topLeft x negated + center x.
	distanceY := canvas topLeft y negated + center y.
	fromX := aLine from x + distanceX.
	fromY := aLine from y + distanceY.
	^(TRLineShape new from: fromX@fromY; to: (fromX + aLine to x) @ (fromY + aLine to y))
	
]

{ #category : #alignment }
RTSVGVisitor >> alignPoint: aPoint [
	|distanceX distanceY originX originY|
	distanceX := canvas topLeft x negated + center x.
	distanceY := canvas topLeft y negated + center y.
	originX := aPoint x + distanceX.
	originY := aPoint y + distanceY.
	^originX@originY
	
]

{ #category : #alignment }
RTSVGVisitor >> alignRectangle: aRectangle [
	|distanceX distanceY originX originY|
	distanceX := canvas topLeft x negated + center x.
	distanceY := canvas topLeft y negated + center y.
	originX := aRectangle topLeft x + distanceX.
	originY := aRectangle topLeft y + distanceY.
	^Rectangle origin: originX@originY corner: (originX + aRectangle width) @ (originY + aRectangle height)
	
]

{ #category : #accessing }
RTSVGVisitor >> canvas [
	^canvas
]

{ #category : #accessing }
RTSVGVisitor >> canvas: aCanvas [

	canvas := aCanvas.
]

{ #category : #accessing }
RTSVGVisitor >> center [
	^center
]

{ #category : #accessing }
RTSVGVisitor >> center: aPoint [
	center := aPoint
]

{ #category : #alignment }
RTSVGVisitor >> fixedEncompassingRectangle [
 	| shapes |
	shapes := self view canvas shapes.
	canvas := shapes first encompassingRectangle.
	shapes do: [ :s| |rect|
				rect := s encompassingRectangle.
				rect height < 0 
					ifTrue: [ rect := Rectangle origin: rect bottomLeft corner: rect topRight].
				canvas := canvas merge: rect.
				 ].
	^canvas 
]

{ #category : #utils }
RTSVGVisitor >> getCorrespondingLine: decorator from: lines [
	lines do: [ :l |
		(l class = TRBezierShape) 
			ifTrue: [ decorator to = l points last 
				ifTrue: [
					lines remove: l. 
					^ Array with: l with: decorator ] ]
			ifFalse: [ decorator to = l to ifTrue: [ 
					lines remove: l. 
					^ Array with: l with: decorator ] ].
		 ].
	^nil
]

{ #category : #utils }
RTSVGVisitor >> getDecorationId: aLineDecorationShape [
	|t w c s lw|
	t := aLineDecorationShape class name.
	w := aLineDecorationShape mySize.
	c := aLineDecorationShape color.
	s := aLineDecorationShape strokePaint.
	lw := aLineDecorationShape width.
	^(t asString, w asString, ((c red * 256) + (s red * 256)) rounded asString, ((c green * 256) + (s green * 256)) rounded asString, ((c blue * 256) + (s blue * 256)) rounded asString, lw asString)
	
]

{ #category : #initialization }
RTSVGVisitor >> initialize [
	afterStream := OrderedCollection new.
	interactions := Dictionary new.
	markers := OrderedCollection new.
	center := 1@1.
	names := Dictionary new.
]

{ #category : #accessing }
RTSVGVisitor >> interactions [
	^ interactions
]

{ #category : #accessing }
RTSVGVisitor >> interactions: anObject [
	interactions := anObject
]

{ #category : #accessing }
RTSVGVisitor >> names [
	^ names
]

{ #category : #accessing }
RTSVGVisitor >> names: anObject [
	names := anObject
]

{ #category : #utils }
RTSVGVisitor >> separateDecorated: lines decorations: decorations [
	|decorated temp |
	decorated := OrderedCollection new.
	decorations do: [ :d | 
		temp := (self getCorrespondingLine: d from: lines).
		decorated add: temp.
		].
	^decorated
]

{ #category : #visitor }
RTSVGVisitor >> setCanvas [
	self canvas = nil
		ifTrue: [ self fixedEncompassingRectangle ]
]

{ #category : #accessing }
RTSVGVisitor >> stream [

	^stream
]

{ #category : #accessing }
RTSVGVisitor >> stream: aStream [

	stream := aStream.
]

{ #category : #accessing }
RTSVGVisitor >> view [

	^view
]

{ #category : #accessing }
RTSVGVisitor >> view: aView [

	view := aView.
]

{ #category : #visitor }
RTSVGVisitor >> visit [
	self setCanvas.
	self visitView: self view.
	self afterStream do: [ :s | s value: 1 ]
]

{ #category : #visitor }
RTSVGVisitor >> visitAbstractLine: anAbstractLine [
	anAbstractLine accept: anAbstractLine
	
]

{ #category : #visitor }
RTSVGVisitor >> visitAbstractLineDecorationShape: anAbstractLineDecoration [
	anAbstractLineDecoration accept: anAbstractLineDecoration
	
]

{ #category : #visitor }
RTSVGVisitor >> visitArcShape: aShape [
	|sCenter svgE|
	sCenter := self alignPoint: (aShape position).
	svgE := RTSVGArc new element: (aShape) center: sCenter r1: (aShape innerRadius) r2: (aShape externalRadius) aAngle: (aShape alphaAngle) bAngle: (aShape betaAngle) color: (aShape color).
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitArrowHeadShape: arrowHeadShape [
	| aid color bColor w s svgE|
	aid := self getDecorationId: arrowHeadShape.
	color := arrowHeadShape color.
	bColor := arrowHeadShape strokePaint.
	w := arrowHeadShape width.
	s := arrowHeadShape mySize.
	(markers contains: aid)
		ifFalse: [  
			svgE := RTSVGArrowHeadMarker new id: aid fillColor: color borderColor: bColor width: w size: s.
			svgE addOn: stream using: self. 
			markers add: aid. 
			]
		
	
]

{ #category : #visitor }
RTSVGVisitor >> visitArrowShape: arrowShape [
	| aid bColor w s svgE|
	aid := self getDecorationId: arrowShape.
	bColor := arrowShape strokePaint.
	w := arrowShape width.
	s := arrowShape mySize.
	(markers includes: aid)
		ifFalse: [ 
			svgE := RTSVGArrowMarker new id: aid fillColor: nil borderColor: bColor width: w size: s.
			svgE addOn: stream using: self. 
			markers add: aid. 
			]
		
	
]

{ #category : #visitor }
RTSVGVisitor >> visitBezierShape: aBezierShape [
	| points svgE |
	points := aBezierShape points.
	points := points collect: [ :p | self alignPoint: p ].
	svgE := RTSVGBezierLine new
		element: aBezierShape
		points: points
		width: aBezierShape width
		color: aBezierShape strokePaint.
	svgE addOn: stream using: self
]

{ #category : #visitor }
RTSVGVisitor >> visitBezierShape: aBezierShape with: aLineDecoration [
	|points svgE|
	points:= aBezierShape points copy.
	points := points collect: [ :p | self alignPoint: p].
	svgE := RTSVGBezierLine new element: (aBezierShape) points: points width: (aBezierShape width) color: (aBezierShape strokePaint) decoration: aLineDecoration.
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitBitMapShape: aBitmapShape [
	| form box svgE|
	"Not supported yet"
	"form := aBitmapShape form.
	box := self alignRectangle: (aBitmapShape encompassingRectangle).
	svgE := RTSVGBitmap new element: (aBitmapShape element) form: form box: box.
	svgE addOn: stream using: self."
	
]

{ #category : #visitor }
RTSVGVisitor >> visitBoxShape: aBox [
	|borderColor fillColor box svgE|
	((aBox color) isNil)
		ifTrue: [ fillColor := Color r: 0 g: 0 b: 0]
		ifFalse: [ fillColor := aBox color].
	((aBox strokePaint) isNil)
		ifFalse: [ borderColor := aBox strokePaint].
	box := self alignRectangle: (aBox encompassingRectangle).
	svgE := RTSVGRectangle new element: aBox box: box fillColor: fillColor borderWidth: 1 borderColor: borderColor.
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitCanvas: aCanvas [
	|elementShapes edgeShapes decoratedEdgeShapes decorationShapes nonDecorationShapes lineClasses lineDecorationClasses canvasShapes|
	
	
	canvasShapes := aCanvas shapes.
	lineClasses := Array with: TRLineShape with: TRBezierShape.
	lineDecorationClasses := TRAbstractLineDecoratorShape withAllSubclasses.
	elementShapes := canvasShapes reject: [ :e |  (lineClasses includes: e class)  or: [ lineDecorationClasses includes: e class  ]].
	edgeShapes := (canvasShapes select: [ :e |  (lineClasses includes: e class)] ) asOrderedCollection.
	nonDecorationShapes := (canvasShapes reject: [ :e | lineDecorationClasses includes: e class ]) asOrderedCollection.
	decorationShapes := canvasShapes select: [ :e |  lineDecorationClasses includes: e class].
	decoratedEdgeShapes := self separateDecorated: edgeShapes decorations: decorationShapes.
	
	stream 
		nextPutAll: '<defs>'.
	decorationShapes do: [:s | s accept: self ].
	stream 
		nextPutAll: '</defs>'.
	nonDecorationShapes do:[:s | s accept: self].
	decoratedEdgeShapes do:[:p | p first accept: self with: p second].
]

{ #category : #visitor }
RTSVGVisitor >> visitDiamondShape: diamondShape [
	| aid color bColor w s svgE|
	aid := self getDecorationId: diamondShape.
	color := diamondShape color.
	bColor := diamondShape strokePaint.
	w := diamondShape width.
	s := diamondShape mySize.
	(markers contains: aid)
		ifFalse: [  
			svgE := RTSVGDiamondMarker new id: aid fillColor: color borderColor: bColor width: w size: s.
			svgE addOn: stream using: self. 
			markers add: aid. 
			]
		
	
]

{ #category : #visitor }
RTSVGVisitor >> visitEllipseShape: anEllipse [	
	|borderColor fillColor box svgE|
	((anEllipse color) isNil)
		ifTrue: [ fillColor := Color r: 0 g: 0 b: 0]
		ifFalse: [ fillColor := anEllipse color].
	((anEllipse strokePaint) isNil)
		ifFalse: [ borderColor := anEllipse strokePaint].
	box := self alignRectangle: (anEllipse encompassingRectangle).
	svgE := RTSVGOval new element: anEllipse box: box color: fillColor borderWidth: 1 borderColor: borderColor.
	svgE addOn: stream using: self.
]

{ #category : #visitor }
RTSVGVisitor >> visitGroup: aRTGroup [
	aRTGroup accept: self.
]

{ #category : #visitor }
RTSVGVisitor >> visitLabelShape: aLabel [
	| color rectangle position text svgE|
	color := aLabel color.	
	rectangle := aLabel encompassingRectangle.
	position := self alignPoint: ((rectangle topLeft x + (rectangle width/4)) @ rectangle center y).
	text := aLabel text.
	svgE := RTSVGText new 
		element: aLabel 
		text: text 
		at: position 
		color: color 
		angle: aLabel angleInDegrees.
	svgE addOn: stream using: self.
]

{ #category : #visitor }
RTSVGVisitor >> visitLineShape: aLine [
	|startingPoint endingPoint svgE|
	startingPoint := self alignPoint: (aLine from).
	endingPoint := self alignPoint: (aLine to).
	svgE := RTSVGLine new element: (aLine) from: startingPoint to: endingPoint width: 1 color: (aLine strokePaint).
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitLineShape: aLine with: aLineDecoration [
	|startingPoint endingPoint svgE|
	startingPoint := self alignPoint: (aLine from).
	endingPoint := self alignPoint: (aLine to).
	svgE := RTSVGLine new element: (aLine) from: startingPoint to: endingPoint width: 1 color: (aLine strokePaint) decoration: aLineDecoration.
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitMondrianViewBuilder: aView [
	aView view accept: self
]

{ #category : #visitor }
RTSVGVisitor >> visitNoShape: aNoShape [
	"Do nothing"
]

{ #category : #visitor }
RTSVGVisitor >> visitPolygonShape: aPolygon [	
	|borderColor fillColor box svgE|
	((aPolygon color) isNil)
		ifTrue: [ fillColor := Color r: 0 g: 0 b: 0]
		ifFalse: [ fillColor := aPolygon color].
	((aPolygon strokePaint) isNil)
		ifFalse: [ borderColor := aPolygon strokePaint].
	box := self alignRectangle: (aPolygon encompassingRectangle).
	svgE := RTSVGPolygon new 
		element: aPolygon 
		box: box 
		color: fillColor 
		borderWidth: 1
		borderColor: borderColor.
	svgE addOn: stream using: self.
]

{ #category : #visitor }
RTSVGVisitor >> visitRotatedLabelShape: aRotatedLabel [
	| color rectangle position text angle svgE|
	color := aRotatedLabel color.	
	rectangle := aRotatedLabel encompassingRectangle.
	position := self alignPoint: ((rectangle topLeft x + (rectangle width/4)) @ rectangle center y).
	text := aRotatedLabel text.
	angle := aRotatedLabel angle.
	svgE := RTSVGText new element: aRotatedLabel text: text at: position color: color angle: angle.
	svgE addOn: stream using: self.
]

{ #category : #visitor }
RTSVGVisitor >> visitSVGPath: aSVGPath [
	| borderColor fillColor svgE |
	aSVGPath color isNil
		ifTrue: [ fillColor := Color r: 0 g: 0 b: 0]
		ifFalse: [ fillColor := aSVGPath color].
	aSVGPath strokePaint isNil
		ifTrue: [ borderColor := fillColor ]
		ifFalse: [ borderColor := aSVGPath strokePaint].
	
	svgE := RTSVGPathEntity new 
		element: aSVGPath
		path: aSVGPath pathString
		center: (self alignPoint: aSVGPath position)
		scale: aSVGPath scale
		fillColor: fillColor 
		borderColor: borderColor 
		width: 1.
	svgE addOn: stream using: self. 
]

{ #category : #visitor }
RTSVGVisitor >> visitShape: aShape [
	aShape accept: self 
]
