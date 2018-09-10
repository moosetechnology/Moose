"
The syntax of path data is concise in order to allow for minimal file size and efficient downloads, since many SVG files will be dominated by their path data. Some of the ways that SVG attempts to minimize the size of path data are as follows:
● All instructions are expressed as one character (e.g., a moveto is expressed as an M).
● Superfluous white space and separators such as commas can be eliminated (e.g., ""M 100 100 L 200 200""
contains unnecessary spaces and could be expressed more compactly as ""M100 100L200 200"").
● The command letter can be eliminated on subsequent commands if the same command is used multiple times
in a row (e.g., you can drop the second ""L"" in ""M 100 200 L 200 100 L -100 -200"" and use ""M 100 200 L 200
100 -100 -200"" instead).
● Relative versions of all commands are available (uppercase means absolute coordinates, lowercase means
relative coordinates).
● Alternate forms of lineto are available to optimize the special cases of horizontal and vertical lines (absolute and
relative).
● Alternate forms of curve are available to optimize the special cases where some of the control points on the
current segment can be determined automatically from the control points on the previous segment.
"
Class {
	#name : #ASPathConverter,
	#superclass : #ASConverter,
	#instVars : [
		'segments',
		'path',
		'absolute',
		'min',
		'max'
	],
	#category : #'Athens-SVG'
}

{ #category : #'path commands' }
ASPathConverter >> A [
	self absolute; ellipticalArc
]

{ #category : #'path commands' }
ASPathConverter >> C [

	^ self absolute; cubicBezier 
]

{ #category : #'path commands' }
ASPathConverter >> H [
	self absolute; hLineTo 
]

{ #category : #'path commands' }
ASPathConverter >> L [
	self absolute; lineTo.
]

{ #category : #'path commands' }
ASPathConverter >> M [
	"move-to absolute"
	" 
		Start a new sub-path at the given (x,y) coordinate. M (uppercase) indicates that absolute coordinates will follow; m (lowercase) indicates that relative coordinates will follow. 
		If a relative moveto (m) appears as the first element of the path, then it is treated as a pair of absolute coordinates. 
		If a moveto is followed by multiple pairs of coordinates, the subsequent pairs are treated as implicit lineto commands.
	
	"
	self absolute; moveTo.

]

{ #category : #'path commands' }
ASPathConverter >> Q [
	self absolute; quadraticBezier
]

{ #category : #'path commands' }
ASPathConverter >> S [
	self absolute; reflectedCubicBezier
]

{ #category : #'path commands' }
ASPathConverter >> T [
	self absolute; smoothQuadraticBezier
]

{ #category : #'path commands' }
ASPathConverter >> V [
	self absolute; vLineTo 
]

{ #category : #'path commands' }
ASPathConverter >> Z [
	self close
]

{ #category : #'path commands' }
ASPathConverter >> a [
	self relative; ellipticalArc
]

{ #category : #'builder commands' }
ASPathConverter >> absolute [
	absolute := true.
	self addSegment 
]

{ #category : #adding }
ASPathConverter >> addSegment [

	| sel args |
	sel := 	thisContext sender selector.
	args := thisContext sender arguments.
	"update min/max for calculatin bounding box"
	
	path add: { sel. args }
]

{ #category : #converting }
ASPathConverter >> assertValidCommand: aCharacter [ 

	( #( $M $m $Z $z $L $l $H $h $V $v $C $c $S $s $Q $q $T $t $A $a ) includes: aCharacter ) ifFalse: [
		self error: 'invalid path segment command' ]

]

{ #category : #accessing }
ASPathConverter >> bbox [
	^ 100@100
]

{ #category : #'path commands' }
ASPathConverter >> c [

	^ self relative; cubicBezier 
]

{ #category : #'builder commands' }
ASPathConverter >> close [
	self addSegment 
]

{ #category : #operations }
ASPathConverter >> convertPathData [

	path := OrderedCollection new.
	
	[ self skipBlanks. stream atEnd ] whileFalse: [
		| cmd |
		cmd := stream next.
		self assertValidCommand: cmd.
		self perform: cmd asString asSymbol.
	].

	^ path
	
]

{ #category : #operations }
ASPathConverter >> cubicBezier [


"
C/c (x1 y1 x2 y2 x y)+

Draws a cubic Bézier curve from the current point to (x,y) using (x1,y1) as the control point at the beginning of the curve and (x2,y2) as the control point at the end of the curve. 
C (uppercase) indicates that absolute coordinates will follow; c (lowercase) indicates that relative coordinates will follow. Multiple sets of coordinates may be specified to draw a polybézier. 
At the end of the command, the new current point becomes the final (x,y) coordinate pair used in the polybézier.
"
	| p1 p2 p3 |
	
	p1 := self readPoint.
	p2 := self readPoint.
	p3 := self readPoint.
	
	p3 ifNil: [ self error: 'Invalid path data: 3 points expected for cubic bezier '].

	self curveVia: p1 and:  p2 to: p3. 
	
	[ 
		(p1 := self readPoint) ifNil: [ ^ self ].
		p2 := self readPoint.
		p3 := self readPoint.

		p3 ifNil: [ self error: 'Invalid path data: 3 points expected for cubic bezier '].
		self curveVia: p1 and:  p2 to: p3. 
	] repeat.


]

{ #category : #'builder commands' }
ASPathConverter >> curveVia: aPoint and: aPoint2 to: aPoint3 [ 

	self addSegment 
]

{ #category : #'builder commands' }
ASPathConverter >> curveVia: aPoint to: aPoint2 [ 


	self addSegment 
]

{ #category : #operations }
ASPathConverter >> ellipticalArc [ 


"
A (absolute) a (relative)

elliptical arc
(rx ry x-axis-rotation large-arc-flag sweep-flag x y)+
Draws an elliptical arc from the current point to (x, y). The size and orientation of the ellipse are defined by two radii (rx, ry) and an x-axis-rotation, which indicates how the ellipse as a whole is rotated relative to the current coordinate system. The center (cx, cy) of the ellipse is calculated automatically to satisfy the constraints imposed by the other parameters. large-arc-flag and sweep- flag contribute to the automatic calculations and help determine how the arc is drawn.
"
	| r xrot large sweep pt |
	
	[
	r := self readPoint.
	r ifNil: [ ^ self ].
	
	self skipBlanksAndComma.
	
	xrot := self nextNumber.

	self skipBlanksAndComma.
	
	large := self nextNumber.

	self skipBlanksAndComma.

	sweep := self nextNumber.
	
	pt := self readPoint.
	
	pt ifNil: [ self error: 'Invalid path data for elliptical arc segment'].

	self ellipticalArc: r xrot: xrot large: large sweep: sweep to: pt.
	] repeat.


]

{ #category : #operations }
ASPathConverter >> ellipticalArc: r xrot: xrot large: large sweep: sweep to: pt [

	self addSegment
]

{ #category : #'path commands' }
ASPathConverter >> h [
	self relative; hLineTo 
]

{ #category : #operations }
ASPathConverter >> hLineTo [
"
H (absolute) h (relative)

x +
Draws a horizontal line from the current point (cpx, cpy) to (x, cpy). H (uppercase) indicates that absolute coordinates will follow; h (lowercase) indicates that relative coordinates will follow. Multiple x values can be provided (although usually this doesn't make sense). At the end of the command, the new current point becomes (x, cpy) for the final value of x.
"

	| x |
	
	self skipBlanks.
	x := self nextNumber ifNil: [ ^ self error: 'number expected for horizontal line segment'   ].
	
	self hLineTo: x.
	
	[ self skipBlanks. x := self nextNumber. x notNil ] whileTrue: [
		self hLineTo: x
	].

]

{ #category : #'builder commands' }
ASPathConverter >> hLineTo: aNumber [

	self addSegment 
]

{ #category : #'path commands' }
ASPathConverter >> l [
	self relative; lineTo.
]

{ #category : #operations }
ASPathConverter >> lastBezierPoint [
	path reverseDo: [ :arr | arr first caseOf: { 
		[ #relative ] -> [ "ignore" ] } ]
]

{ #category : #operations }
ASPathConverter >> lineTo [
" 
L (absolute) l (relative)
lineto

(x y)+
Draw a line from the current point to the given (x,y) coordinate which becomes the new current point. L (uppercase) indicates that absolute coordinates will follow; l (lowercase) indicates that relative coordinates will follow. A number of coordinates pairs may be specified to draw a polyline. At the end of the command, the new current point is set to the final set of coordinates provided.
"

	| pt |
	pt := self readPoint.
	
	pt ifNil: [ self error: 'point expected for line segment' ].
	
	self lineTo: pt.
	
	[ pt := self readPoint. pt notNil ] whileTrue: [ self lineTo: pt ]
]

{ #category : #'builder commands' }
ASPathConverter >> lineTo: aPoint [ 

	self addSegment 
]

{ #category : #'path commands' }
ASPathConverter >> m [
	"move-to relative"
	" 
		Start a new sub-path at the given (x,y) coordinate. M (uppercase) indicates that absolute coordinates will follow; m (lowercase) indicates that relative coordinates will follow. 
		If a relative moveto (m) appears as the first element of the path, then it is treated as a pair of absolute coordinates. 
		If a moveto is followed by multiple pairs of coordinates, the subsequent pairs are treated as implicit lineto commands.
	
	"
	| pt reset |

	pt := self readPoint.
	pt ifNil: [ self error: 'a point expected following after M/m command'].

	path isEmpty ifTrue: [ 
			self absolute; moveTo: pt; relative ] 
		ifFalse: [ self relative; moveTo: pt ].

	[ pt := self readPoint. pt notNil ] whileTrue: [ self lineTo: pt ]
]

{ #category : #operations }
ASPathConverter >> moveTo [
	"move-to"
	" 
		Start a new sub-path at the given (x,y) coordinate. M (uppercase) indicates that absolute coordinates will follow; m (lowercase) indicates that relative coordinates will follow. 
		If a relative moveto (m) appears as the first element of the path, then it is treated as a pair of absolute coordinates. 
		If a moveto is followed by multiple pairs of coordinates, the subsequent pairs are treated as implicit lineto commands.
	
	"
	| pt |

	pt := self readPoint.
	pt ifNil: [ self error: 'a point expected following after M/m command'].
	
	self moveTo: pt.
	
	[ pt := self readPoint. pt notNil ] whileTrue: [ self lineTo: pt ]

]

{ #category : #'builder commands' }
ASPathConverter >> moveTo: aPoint [ 

	self addSegment 
]

{ #category : #'path commands' }
ASPathConverter >> q [
	self relative; quadraticBezier
]

{ #category : #operations }
ASPathConverter >> quadraticBezier [ 


"
Q/q (x1 y1 x y)+

Draws a quadratic Bézier curve from the current point to (x,y) using (x1,y1) as the control point. Q (uppercase) indicates that absolute coordinates will follow; q (lowercase) indicates that relative coordinates will follow. Multiple sets of coordinates may be specified to draw a polybézier. At the end of the command, the new current point becomes the final (x,y) coordinate pair used in the polybézier."
	| p1 p2 |
	
	p1 := self readPoint.
	p2 := self readPoint.
	
	p2 ifNil: [ self error: 'Invalid path data: 2 points expected for quadratic bezier '].
	
	self curveVia: p1 to: p2. 
	
	[ 
		(p1 := self readPoint) ifNil: [ ^ self ].
		p2 := self readPoint.

		p2 ifNil: [ self error: 'Invalid path data: 2 points expected for quadratic bezier '].
		self curveVia: p1 to: p2. 
	] repeat.


]

{ #category : #operations }
ASPathConverter >> readPoint [
	" A path data permits specifying points without comma separator "
	| x y pos |
	self skipBlanksAndComma.
	pos := stream position.
	x := self nextNumber ifNil: [ ^ nil ].
	
	self skipBlanksAndComma.
	
	y := self nextNumber ifNil: [ stream position: pos. ^ nil ].
	
	^ x @ y
]

{ #category : #operations }
ASPathConverter >> reflectedCubicBezier [

"
S/s (x2 y2 x y)+

cubic Bézier curve from the current point to (x,y). The first control point is assumed to be the reflection of the second control point on the previous command relative to the current point. (If there is no previous command or if the previous command was not an C, c, S or s, assume the first control point is coincident with the current point.) (x2,y2) is the second control point (i.e., the control point at the end of the curve). S (uppercase) indicates that absolute coordinates will follow; s (lowercase) indicates that relative coordinates will follow. Multiple sets of coordinates may be specified to draw a polybézier. At the end of the command, the new current point becomes the final (x,y) coordinate pair used in the polybézier.
"
	| p1 p2 |
	
	p1 := self readPoint.
	p2 := self readPoint.
	
	p2 ifNil: [ self error: 'Invalid path data: 2 points expected for reflected cubic bezier '].

	self reflectedCurveVia: p1 to: p2. 
	
	[ 
		(p1 := self readPoint) ifNil: [ ^ self ].
		p2 := self readPoint.

		p2 ifNil: [ self error: 'Invalid path data: 2 points expected for reflected cubic bezier '].
		self reflectedCurveVia: p1 to: p2. 
	] repeat.


]

{ #category : #'builder commands' }
ASPathConverter >> reflectedCurveVia: aPoint to: aPoint2 [ 


	self addSegment 
]

{ #category : #'builder commands' }
ASPathConverter >> relative [
	absolute := false.
	self addSegment 
]

{ #category : #'path commands' }
ASPathConverter >> s [
	self relative; reflectedCubicBezier
]

{ #category : #operations }
ASPathConverter >> smoothQuadraticBezier [
	self notYetImplemented 
]

{ #category : #'path commands' }
ASPathConverter >> t [
	self relative; smoothQuadraticBezier
]

{ #category : #'path commands' }
ASPathConverter >> v [
	self relative; vLineTo 
]

{ #category : #operations }
ASPathConverter >> vLineTo [
"
V (absolute) v (relative)

Draws a vertical line from the current point (cpx, cpy) to (cpx, y). V (uppercase) indicates that absolute coordinates will follow; v (lowercase) indicates that relative coordinates will follow. Multiple y values can be provided (although usually this doesn't make sense). At the end of the command, the new current point becomes (cpx, y) for the final value of y."

	| y |
	
	self skipBlanks.
	y := self nextNumber ifNil: [ ^ self error: 'number expected for horizontal line segment'   ].
	
	self vLineTo: y.
	
	[ self skipBlanks. y := self nextNumber. y notNil ] whileTrue: [
		self vLineTo: y
	].

]

{ #category : #'builder commands' }
ASPathConverter >> vLineTo: aNumber [
	
	self addSegment 
]

{ #category : #'path commands' }
ASPathConverter >> z [
	self close
]
