"
A RTMultiColoredLine is a colored shape for lines from a color array  (Can be a Color Palete Sequential.

Instance Variables
	colorArray:		<Object>
	path :

colorArray
	- xxxxx

"
Class {
	#name : #RTMultiColoredLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'colorArray',
		'path'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTMultiColoredLine >> block: aTwoArgBlock [
	"The argument is a two arg block. The two arguments are the two points one has to draw the line. The block has to return a collection of point.
	
	The arg follows [ :fromPoint :toPoint | Array with: ... with: ... with: ... ]"
	path := aTwoArgBlock 
]

{ #category : #rendering }
RTMultiColoredLine >> colorShape [
	self block: [ :fromPoint :toPoint | 
		| tab |
		
		tab := Array with: fromPoint.
		
		(fromPoint = toPoint) ifFalse: [
	
			1 to: (colorArray size - 1) do: [ :i |
				tab := tab copyWith: ( (i * (toPoint x - fromPoint x)/(colorArray size)) + (fromPoint x)) @ ( ((i* (fromPoint dist: toPoint)/(colorArray size)) / (fromPoint dist: toPoint) * (toPoint y - fromPoint y)) + (fromPoint y)).
			]
		].
		tab := tab copyWith: toPoint.
	 ]
]

{ #category : #accessing }
RTMultiColoredLine >> colors [
	"Return the colors used by the line"
	^ colorArray 
]

{ #category : #accessing }
RTMultiColoredLine >> colors: someColors [
	colorArray := someColors
]

{ #category : #configuration }
RTMultiColoredLine >> defaultColors [
	^ Array with: Color blue with: Color red
]

{ #category : #initialization }
RTMultiColoredLine >> initialize [
	super initialize.
	self straight.
	self colors: self defaultColors
]

{ #category : #rendering }
RTMultiColoredLine >> path [
	^ path
]

{ #category : #configuration }
RTMultiColoredLine >> straight [
	"A single color line"
	self block: [ :fromPoint :toPoint | Array with: fromPoint with: toPoint ]
]

{ #category : #public }
RTMultiColoredLine >> trachelShapeFor: anEdge [
	| shape multiShape fromPoint toPoint p |
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	p := path value: fromPoint value: toPoint.
	
	multiShape := TRCompositeShape new.
	2 to: p size do: [ :i |
		shape := TRLineShape new.
		shape width: width.
		shape from: (p at: i - 1) to: (p at: i).
		shape color: (colorArray atWrap: (i - 1)).
		multiShape addShape: shape.
	].
	^ multiShape
]

{ #category : #public }
RTMultiColoredLine >> updateFor: anEdge trachelShape: trachelShape [
	| shape fromPoint toPoint p|
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	p := path value: fromPoint value: toPoint.
	(trachelShape shapes size < p size) ifTrue: [ 
		trachelShape shapes size to: p size do: [ :i | | s |
			s := TRLineShape new.
			s addedIn: trachelShape canvas.
			trachelShape addShape: s. ].
		trachelShape 
			propagateElement;
			positionShapesAfterBeingAdded.
		 ].
	2 to: p size do: [ :i |
		shape := trachelShape shapes at: i - 1.
		shape width: width.
		shape from: (p at: i - 1) to: (p at: i).
		shape color: (colorArray atWrap: (i - 1)).
	].
	^ trachelShape
]
