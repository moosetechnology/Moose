"
I'm polygon builded on my vertices.


"
Class {
	#name : #GPolygon,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'edges'
	],
	#category : 'Geometry'
}

{ #category : #'as yet unclassified' }
GPolygon class >> convexHullOn: aCollection [
	| lastPoint nextPoint convexHull |
"self halt."
	convexHull := OrderedCollection new.	
	nextPoint := aCollection detectMin: #x.
	 [
		lastPoint := nextPoint.
		convexHull add: lastPoint.
		nextPoint := aCollection detect: [ :point | point ~= lastPoint ].
		(aCollection copyWithout: nextPoint) do: [ :point |
			| turn |		
			turn :=
				(nextPoint x - lastPoint x) * (point y - lastPoint y) -
				((point x - lastPoint x) * (nextPoint y - lastPoint y)).
			(turn < 0 or:
				[ turn = 0 and:
				[ (lastPoint dist: point) > (lastPoint dist: nextPoint) ] ]) ifTrue:
					[ nextPoint := point ] ] ] doWhileTrue: [
				convexHull first ~= nextPoint ].
		
	^ self newVertices: convexHull
				
]

{ #category : #'as yet unclassified' }
GPolygon class >> newVertices: aCollection [
	
	^ self new
		initializeVertices: aCollection;
		yourself.
]

{ #category : #accessing }
GPolygon >> center [
	| min max x y |
	min := vertices min.
	max := vertices max.
	x := (min x + max x)/2.0.
	y := (min y + max y)/2.0.
	^ x @ y
	

]

{ #category : #accessing }
GPolygon >> edges [
	| firstVert prevVert |
	edges := OrderedCollection new.	
	firstVert := vertices at: 1.
	prevVert := firstVert.
	vertices allButFirstDo: [ :curVert |
		edges add: (GSegment with: prevVert with: curVert).
		prevVert := curVert ].
	edges add: (GSegment with: (vertices at: (vertices size)) with: firstVert).
	^ edges
]

{ #category : #accessing }
GPolygon >> encompassingRectangle [
	|leftMost rightMost top bottom|
	leftMost := vertices first. 
	rightMost := vertices first.
	top := vertices first. 
	bottom:= vertices first.
	vertices allButFirst do:[ :v | 
		(v y > top y) ifTrue:[ top := v ].
		(v y < bottom y) ifTrue:[ bottom := v ].
		(v x < leftMost x) ifTrue:[ leftMost := v ].
		(v x > rightMost x) ifTrue:[ rightMost := v ]].
	^Rectangle left: leftMost x right: rightMost x top: top y bottom: bottom y
]

{ #category : #testing }
GPolygon >> includesPoint: point [

  ^ ( AthensPolygonTester new polygon: vertices ) includesPoint: point.
]

{ #category : #initialization }
GPolygon >> initializeVertices: aCollection [
	self initialize.
	
	vertices := aCollection 
]

{ #category : #comparing }
GPolygon >> intersectLineSegment: aLineSegment [
	^ aLineSegment intersectPolygon: self
]

{ #category : #accessing }
GPolygon >> vertices [
	
	^ vertices
]
