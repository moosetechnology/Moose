"
I am a shape which builds the polygon sequentialy conecting my vertices.

For example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
| v  shape element |
v := RTView new.
shape := 
	RTPolygon new 
		vertices:{
		25 @ 00 .
		10 @ 50 .
		50 @ 20 .
		00 @ 20 .
		40 @ 50 }.
element := shape element.
v add: element.
v open
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTPolygon,
	#superclass : #RTAbstractElementShape,
	#instVars : [
		'vertices'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #'instance creation' }
RTPolygon class >> diamond [
	^ self new
		vertices:
			(Array
				with: 0 @ 1
				with: 1 @ 0
				with: 0 @ -1
				with: -1 @ 0);
		yourself
]

{ #category : #public }
RTPolygon class >> fitPolygonToSquare: points [
	| maxx minx maxy miny sx sy x y |
	minx := maxx :=  points first x.
	miny := maxy :=  points first y.
	points do: [ :p | 
		minx := minx min: p x.
		miny := miny min: p y.
		maxx := maxx max: p x.
		maxy := maxy max: p y ].
	"stretch factors"
	sx := 2/(maxx - minx).
	sy := 2/(maxy - miny).
	points doWithIndex: [ :p :i|
		x := p x * sx.
		y := p y * sy.
		points at: i put: x@y.
		minx := minx min: x.
		miny := miny min: y.
		maxx := maxx max: x.
		maxy := maxy max: y ].
	miny < -1 ifTrue: [ 
		points doWithIndex: [ :p :i |
			points at: i put: p x @ ( p y - 1 - miny ) ] ].
	^ points.
]

{ #category : #public }
RTPolygon class >> generateUnitNgonPoints: sides rotation: rotationAngle [
	"
	RTPolygon generateUnitNgonPoints: 3 rotation: 0
	"
	| increment startAngle points currentAngle |
	increment := 1.0 / sides * 2 * Float pi.
	startAngle := sides even
		ifTrue: [ (Float pi / 2) + (increment / 2) ]
		ifFalse: [ Float pi / 2 ].
	startAngle := startAngle + rotationAngle.
	
	points := Array new: sides.
	0 to: sides - 1 do: [ :i | 
		currentAngle := i * increment + startAngle.
		points at: i+1 put: currentAngle cos @ currentAngle negated sin ].
	^ points
]

{ #category : #public }
RTPolygon class >> generateUnitNgonPointsFitToSquare: sides rotation: rotationAngle [
	| points |
	points := self generateUnitNgonPoints: sides rotation: rotationAngle.
	points := self fitPolygonToSquare: points.
	^ points.
]

{ #category : #'instance creation' }
RTPolygon class >> heptagon [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 7 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> hexagon [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 6 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> octagon [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 8 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> pentagon [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 5 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> rectangle [
	^ self square
]

{ #category : #'instance creation' }
RTPolygon class >> rhomboid [
	^ self new
		vertices:
			(Array
				with: -1 @ -1
				with: 0.333 @ -1
				with: 1 @ 1
				with: -0.333 @ 1);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> square [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 4 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> star [
	"
		self star
	"

	| star5Points outerPoints innerPoints innerRadius ar |
	star5Points := Array new: 10.
	outerPoints := self generateUnitNgonPoints: 5 rotation: 0.
	innerPoints := self generateUnitNgonPoints: 5 rotation: Float pi / -5.
	"Outer radius is 1; inner radius of star is smaller"
	innerRadius := 0.5 * (3 - 5 sqrt) * 1.57.
	innerPoints
		doWithIndex: [ :p :i | innerPoints at: i put: (p x * innerRadius) @ (p y * innerRadius) ].
	star5Points
		doWithIndex: [ :p :i | 
			ar := i even
				ifTrue: [ outerPoints ]
				ifFalse: [ innerPoints ].
			star5Points at: i put: (ar at: i // 2 + (i % 2)) ].
	star5Points := self fitPolygonToSquare: star5Points.
	^ self new
		vertices: star5Points;
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> triangle [
	^ self new
		vertices: (self generateUnitNgonPointsFitToSquare: 3 rotation: 0);
		yourself
]

{ #category : #'instance creation' }
RTPolygon class >> vee [
	^ self new
		vertices:
			(Array
				with: -1 @ -1
				with: 0 @ -0.333
				with: 1 @ -1
				with: 0 @ 1);
		yourself
]

{ #category : #initialization }
RTPolygon >> initialize [
	super initialize.
	self vertices: #().
	width := height := nil.
]

{ #category : #hooks }
RTPolygon >> trachelShapeClass [
	^ TRPolygonShape

]

{ #category : #hooks }
RTPolygon >> updateFor: anElement trachelShape: trachelShape [

	trachelShape isNil ifTrue: [ ^ self ].
	trachelShape
		color: (self colorFor: anElement);
		strokeWidth: (self borderWidthFor: anElement);
		strokePaint: (self borderColorFor: anElement);
		vertices: (self verticesFor: anElement);
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement).
		
	(width notNil and: [height notNil])
		ifTrue: [ trachelShape extent: (self widthFor: anElement) @ (self heightFor: anElement) ]
	
]

{ #category : #accessing }
RTPolygon >> vertices [
	^ vertices
]

{ #category : #accessing }
RTPolygon >> vertices: arrayOfPoints [
	self verticesElement: [ :e | arrayOfPoints rtValue: e model ].
]

{ #category : #accessing }
RTPolygon >> verticesElement: arrayOfPoints [
	vertices := arrayOfPoints
]

{ #category : #hooks }
RTPolygon >> verticesFor: anElement [
	^ vertices rtValue: anElement.
]
