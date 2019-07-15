"
I am shape which builds closed path following ordered collection of vertices.

"
Class {
	#name : #TRPolygonShape,
	#superclass : #TRShape,
	#instVars : [
		'vertices',
		'strokeWidth'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRPolygonShape >> accept: aVisitor [
	aVisitor visitPolygonShape: self
]

{ #category : #accessing }
TRPolygonShape >> basicEncompassingRectangle [
	"Return the bounding box of all the vertices."

	self numberOfVertices = 0
		ifTrue: [ ^ 0 @ 0 corner: 0 @ 0 ].
	^ vertices min corner: vertices max
]

{ #category : #accessing }
TRPolygonShape >> center [
	"Return the center of the polygon. The center is determined as the center of encompassing rectangle, which may be different from the exact center of the shape (e.g., the value returned by this method may be actually outside the shape itself)."
	^ self encompassingRectangle center
]

{ #category : #private }
TRPolygonShape >> computePath [
	canvas ifNil: [ ^ self ].
	self numberOfVertices = 0 ifTrue: [ 
		path := self athensCanvas
		createPath: [ :builder | ].
		^ self ].
	path := self athensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: vertices last.
			vertices do: [ :v |
				builder lineTo: v ].
			builder closePath ]
]

{ #category : #drawing }
TRPolygonShape >> drawOn: athensCanvas [
	| pt  scale ratio |
	pt := athensCanvas pathTransform.
	pt restoreAfter: [
		pt scaleBy: matrix sx @ matrix sy.
		
		athensCanvas
			setShape: self path.
		color isNotNil ifTrue: [ athensCanvas setPaint: self themedColor; draw ].
		
		self canvas ifNil: [ ^ self ].
	scale := self canvas camera scale.
	scale < 1 
		ifTrue: [ ratio := self strokeWidth ] 
		ifFalse: [ ratio := self strokeWidth / scale].
	^ strokePaint
		ifNotNil: [ 
			(athensCanvas setStrokePaint: self themedStrokeColor) width: ratio asFloat.
			athensCanvas drawShape: path]]
]

{ #category : #accessing }
TRPolygonShape >> encompassingRectangle [
	^ self transformedEncompassingRectangle
]

{ #category : #accessing }
TRPolygonShape >> extent [
	^ self encompassingRectangle extent
]

{ #category : #accessing }
TRPolygonShape >> extent: newExtent [
	| oldExtent min max sx sy |
	oldExtent := self basicEncompassingRectangle extent.
	newExtent = oldExtent
		ifTrue: [ ^ self ].
	min := vertices min.
	max := vertices max.
	sx := newExtent x / (max x - min x).
	sy := newExtent y / (max y - min y).
	vertices := vertices collect: [ :p | (p x * sx) @ (p y * sy) ].
	self resetPath.
	oldExtent = (0@0)
		ifFalse: [ self triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent ]
]

{ #category : #accessing }
TRPolygonShape >> height [
	^ self encompassingRectangle height 
]

{ #category : #accessing }
TRPolygonShape >> height: newHeight [
	self extent: self basicEncompassingRectangle width @ newHeight
]

{ #category : #testing }
TRPolygonShape >> includesPoint: point [
  ^ (TRPlatform current polygonTesterClass new polygon: vertices ) includesPoint: point.
]

{ #category : #initialization }
TRPolygonShape >> initialize [
	super initialize.
	strokeWidth := 1.0.
	self vertices: #()
]

{ #category : #accessing }
TRPolygonShape >> numberOfVertices [
	"Return the number of vertices contained in the polygon"
	^ vertices size
]

{ #category : #accessing }
TRPolygonShape >> strokeWidth [
	^ strokeWidth
]

{ #category : #accessing }
TRPolygonShape >> strokeWidth: aWidth [
	"Set the size of the stroke (i.e., line width)"
	strokeWidth := aWidth
]

{ #category : #actions }
TRPolygonShape >> translateBy: aPoint [
	vertices := vertices collect:[ :each | each + aPoint].
	self triggerCallbacksForStep: aPoint.
	self computePath
]

{ #category : #actions }
TRPolygonShape >> translateTo: aPoint [
	| dist |
	dist := aPoint - self encompassingRectangle center.
	self translateBy: dist.
]

{ #category : #accessing }
TRPolygonShape >> vertices [
	^ vertices
]

{ #category : #accessing }
TRPolygonShape >> vertices: aCollection [ 
	vertices := aCollection
]

{ #category : #accessing }
TRPolygonShape >> width [
	^ self encompassingRectangle width
]

{ #category : #accessing }
TRPolygonShape >> width: newWidth [
	self extent: newWidth @ self basicEncompassingRectangle
]
