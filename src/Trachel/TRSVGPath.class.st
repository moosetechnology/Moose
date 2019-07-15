"
In Roassal-Trachel I am the common class to define and draw SVG shapes, and draw it in an instance of TRCanvas.

Description
--------------------
I can use an string with a common SVG commands and convert it into an array of curves or commands that (Athens|Canvas ) can handle it. To do that I use the class  ASPathConverter.

I use my curves to calculate my emcompassing rectangle, this rectangle chanages, when you use the method path to update the #path:

Publick AI and Key Messages
--------------------

- #new	creates an empy TRSVGPath, but you need at least 2 curves.

- path:aString 	allow set the curves of this SVG and recalculate the new encompassing rectangle.

 - #curves: anArrayOfCurves	allow set the curves directly, usefull when you want to modifly the curves directly and update it in an animation

#includesPoint: aPoint 	SVG uses 
Private methods
----------------
#computeRectangle	internal method to recalculate the encomcompassing rectangle
#computePolygons	we create polygons from curves
#correctCurvesAndPolygonsToZero	in roassal each shape the position is in the center and TRSVGPath is not the exception, for that reason after calculate the curves from the pathString, TRSVG moves the coordinates of the  curves.
#separateSubPaths	an SVG can be a set of sub paths, in this part we create the polygons as a collection of polygons

"
Class {
	#name : #TRSVGPath,
	#superclass : #TRShape,
	#instVars : [
		'borderWidth',
		'fillColor',
		'pathString',
		'curves',
		'polygons',
		'rectangle'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRSVGPath >> accept: aVisitor [
	aVisitor visitSVGPath: self
]

{ #category : #private }
TRSVGPath >> basicEncompassingRectangle [
	^ rectangle
]

{ #category : #accessing }
TRSVGPath >> borderWidth: width [
	borderWidth := width.
]

{ #category : #accessing }
TRSVGPath >> center [
	^ self encompassingRectangle center 
]

{ #category : #accessing }
TRSVGPath >> centeredPath: aPathString [
	self path: aPathString.
	self correctCurvesAndPolygonsToZero.
]

{ #category : #accessing }
TRSVGPath >> color [
	^ fillColor
]

{ #category : #accessing }
TRSVGPath >> color: aColor [
	^ self fillColor: aColor
]

{ #category : #private }
TRSVGPath >> computeCurves [
	"This method parse the path"
	"
	A complete description may be found on http://www.w3.org/TR/SVG/paths.html#PathData
	So far, we only consider the following SVG tokens:
	
	M = Move to - absolute
	m = Move to - relative
	
	Z or z = Close path
	
	L = Line to - absolute
	l = Line to - relative
	
	The description of SVG path, says that M and m may accept more than one coordinates. In practices, this is rarely the case. 	
	"
	| pathData |
	pathData := ASPathConverter new stream: pathString readStream.
	curves := pathData convertPathData.
]

{ #category : #hooks }
TRSVGPath >> computePath [
	path := TRPlatform current computeSVGPathFor: self.

]

{ #category : #private }
TRSVGPath >> computePolygons [
	| separatedPaths |
	separatedPaths := self separateSubPaths.
	polygons := separatedPaths.
]

{ #category : #private }
TRSVGPath >> computeRectangle [
	| allPoints |
	allPoints := polygons inject: #() into: [ :acc :next | acc , next ].
	rectangle := Rectangle encompassing: allPoints.
	^ allPoints
]

{ #category : #private }
TRSVGPath >> correctCurvesAndPolygonsToZero [
	"Center of polygons is stored in originalPosition and the center is moved to 0@0."
	| originalPosition absolute key args|
	self computeRectangle.
	originalPosition := rectangle center.
	absolute := true.
	curves do: [ :curve |
		key := curve first.
		args := curve second.
		key =#absolute ifTrue: [ absolute :=true ].
		key =#relative ifTrue: [ absolute :=false ].
		absolute ifTrue: [ 
			args doWithIndex: [ :eachPoint :index| 
				args at: index put: eachPoint - originalPosition] ].
		].
	polygons
		do: [ :eachPolygon | eachPolygon doWithIndex: [ :eachPoint :index | eachPolygon at: index put: eachPoint - originalPosition ] ].
	self computeRectangle.
]

{ #category : #accessing }
TRSVGPath >> curves [
	curves isNil ifFalse: [ ^ curves ].
	self computeCurves.
	self computePolygons.
	^ curves
]

{ #category : #accessing }
TRSVGPath >> curves: anArray [
	curves := anArray.
	self computePolygons.
	
]

{ #category : #drawing }
TRSVGPath >> drawOn: aCanvas [
	| pt |
	pt := aCanvas pathTransform.
	pt restoreAfter: [
		pt multiplyBy: matrix asFloatTransform.
		aCanvas setShape: self path.
		fillColor isNotNil ifTrue: [ aCanvas setPaint: fillColor; draw ].
		(aCanvas setStrokePaint: strokePaint) width: borderWidth.
		aCanvas draw
	]
]

{ #category : #accessing }
TRSVGPath >> encompassingRectangle [
	^ self transformedEncompassingRectangle
]

{ #category : #accessing }
TRSVGPath >> extent [
	^ rectangle extent.
]

{ #category : #accessing }
TRSVGPath >> fillColor: aColor [
	fillColor := aColor
]

{ #category : #accessing }
TRSVGPath >> height [
	^ self encompassingRectangle height
]

{ #category : #testing }
TRSVGPath >> includesPoint: aPoint [
	|apt invertedPoint |
	invertedPoint := matrix inverseTransform: aPoint.
	apt := TRPlatform current polygonTesterClass new.
	^ polygons anySatisfy: [ :eachPolygon | ((apt polygon: eachPolygon) includesPoint: invertedPoint) ]
]

{ #category : #initialization }
TRSVGPath >> initialize [
	super initialize.
	polygons := #().
	borderWidth := 0.
	fillColor := Color black.
	rectangle := Rectangle origin: 0@0 corner: 0@0.
]

{ #category : #accessing }
TRSVGPath >> path: aPathString [
	pathString := aPathString.
	curves := nil.
	self curves.
	self computeRectangle.
]

{ #category : #accessing }
TRSVGPath >> pathString [
	^ pathString
]

{ #category : #actions }
TRSVGPath >> reset [
	super resetPath.
	curves := nil
]

{ #category : #private }
TRSVGPath >> separateSubPaths [
	| separatedPaths subPath absolute p point key args |
	separatedPaths := OrderedCollection new.
	subPath := OrderedCollection new.
	absolute := true.
	p := 0@0.

	point := [:da | p := absolute 
		ifTrue:[ da ] 
		ifFalse: [ p + da ].
		subPath add: p ].
	curves do: [ :c |
		key := c first.
		args := c second.
		key = #absolute ifTrue: [ absolute := true ].
		key = #relative ifTrue: [ absolute := false ].
		key = #moveTo: ifTrue: [ 
			subPath ifNotEmpty: [ separatedPaths add: subPath ]. 
			subPath:= OrderedCollection new.
			point value: args first ].
		key = #curveVia:and:to: ifTrue: [ 
			point value: args third ].
		key = #curveVia:to: ifTrue: [ 
			point value: args second ].
		key = #ellipticalArc:xrot:large:sweep:to: ifTrue: [ 
			point value: args fifth ].
		key = #lineTo: ifTrue: [ 
			point value: args first ].
		key = #reflectedCurveVia:to: ifTrue: [ 
			point value: args second ].
		key = #hLineTo: ifTrue: [
			p := absolute
				ifTrue: [ args first @ p y ]
				ifFalse: [ p + (args first @ 0) ].
			subPath add: p ].
		key = #vLineTo: ifTrue: [ 
			p := absolute
				ifTrue: [ p x @ args first ]
				ifFalse: [ p + (0 @ args first) ].
			subPath add: p ].
	].
	separatedPaths add: subPath.
	^ separatedPaths
]

{ #category : #accessing }
TRSVGPath >> setExtent: anExtent [

	rectangle := rectangle topLeft extent: anExtent
]

{ #category : #accessing }
TRSVGPath >> strokeWidth [
	^ borderWidth
]

{ #category : #accessing }
TRSVGPath >> width [
	^ self encompassingRectangle width
]
