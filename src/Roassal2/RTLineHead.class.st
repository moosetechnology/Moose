"
A DCRTLineHead is a handler of head of a line
"
Class {
	#name : #RTLineHead,
	#superclass : #RTExtremityLineDecoration,
	#category : #'Roassal2-LineDecorations'
}

{ #category : #converting }
RTLineHead >> asHead [
	^ self
]

{ #category : #public }
RTLineHead >> trachelShapeFor: anEdge [
	| fromPoint |
	fromPoint := attachPoint startingPointOf: anEdge.
	line ifNotNil: [ | lineShape |
		lineShape := line trachelShapeFor: anEdge.
		lineShape class = TRBezierShape ifTrue: [ 
			fromPoint := lineShape points allButLast last ] ].
	
	anEdge shape class = RTArcLine & (attachPoint class = RTBorderAttachPoint) ifTrue: [
		fromPoint := (TRArcLineShape new 
			line: (RTLineSegment from: fromPoint to: (attachPoint endingPointOf: anEdge));
			distance: (anEdge shape distanceFor: anEdge)) normal to.
		].
	^ self trachelShapeFor: anEdge from: fromPoint
]

{ #category : #public }
RTLineHead >> trachelShapeFor: anEdge from: aPoint [
	^ self trachelShapeFor: anEdge from: aPoint to: (attachPoint endingPointOf: anEdge)
]

{ #category : #hooks }
RTLineHead >> updateFor: edge trachelShape: trachelShape [
	| fromPoint |
	fromPoint := attachPoint startingPointOf: edge.
	line ifNotNil: [ | lineShape |
		lineShape := edge trachelShape.
		lineShape class = TRBezierShape
			ifTrue: [ fromPoint := lineShape points allButLast last ] ].
	edge shape class = RTArcLine & (attachPoint class = RTBorderAttachPoint) ifTrue:[ 
		fromPoint := edge trachelShape shapes first normal to ].
	self updateFor: edge trachelShape: trachelShape from: fromPoint
]

{ #category : #hooks }
RTLineHead >> updateFor: anEdge trachelShape: trachelShape from: aPoint [
	self
		updateFor: anEdge
		trachelShape: trachelShape
		from: aPoint
		to: (attachPoint endingPointOf: anEdge)
]
