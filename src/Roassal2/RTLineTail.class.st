"
A DCRTLineTail is a handler of tail of a line
"
Class {
	#name : #RTLineTail,
	#superclass : #RTExtremityLineDecoration,
	#category : #'Roassal2-LineDecorations'
}

{ #category : #converting }
RTLineTail >> asTail [
	^ self
]

{ #category : #public }
RTLineTail >> trachelShapeFor: anEdge [
	| fromPoint |
	fromPoint := attachPoint endingPointOf: anEdge.
	line
		ifNotNil: [ 
			| lineShape |
			lineShape := line trachelShapeFor: anEdge.
			lineShape class = TRBezierShape
				ifTrue: [ fromPoint := lineShape points second ] ].
	^ self trachelShapeFor: anEdge from: fromPoint
]

{ #category : #public }
RTLineTail >> trachelShapeFor: anEdge from: aPoint [
	^ self trachelShapeFor: anEdge from: aPoint to: (attachPoint startingPointOf: anEdge)
]

{ #category : #hooks }
RTLineTail >> updateFor: edge trachelShape: trachelShape [
	| fromPoint |
	fromPoint := attachPoint endingPointOf: edge.
	line
		ifNotNil: [ 
			| lineShape |
			lineShape := edge trachelShape shapes first.
			lineShape class = TRBezierShape
				ifTrue: [ fromPoint := lineShape points second ] ].
	self updateFor: edge trachelShape: trachelShape from: fromPoint
]

{ #category : #hooks }
RTLineTail >> updateFor: anEdge trachelShape: trachelShape from: aPoint [
	self
		updateFor: anEdge
		trachelShape: trachelShape
		from: aPoint
		to: (attachPoint startingPointOf: anEdge)
]
