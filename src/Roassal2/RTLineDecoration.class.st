"
A RTLineDecoration is a shape decoration, intended to be combined with a line.
"
Class {
	#name : #RTLineDecoration,
	#superclass : #RTShape,
	#instVars : [
		'width',
		'size',
		'attachPoint',
		'line',
		'baseSize',
		'percentage'
	],
	#category : #'Roassal2-LineDecorations'
}

{ #category : #accessing }
RTLineDecoration >> attachPoint [
	^ attachPoint
]

{ #category : #accessing }
RTLineDecoration >> attachPoint: anObject [
	attachPoint := anObject
]

{ #category : #accessing }
RTLineDecoration >> baseSize: aNumberOrBlockOrIdentifier [
	baseSize := [ :e | aNumberOrBlockOrIdentifier rtValue: e].
	
]

{ #category : #configuration }
RTLineDecoration >> defaultBaseSize [
	"Set the size of the base size of the line head decoration"
	^ 10
]

{ #category : #initialization }
RTLineDecoration >> initialize [
	super initialize.
	attachPoint := RTCenteredAttachPoint new.
	baseSize := self defaultBaseSize.
	self percentage: 1.
]

{ #category : #accessing }
RTLineDecoration >> line: aRTLine [
	line := aRTLine
]

{ #category : #accessing }
RTLineDecoration >> mid [
	self percentage: 0.5.
]

{ #category : #accessing }
RTLineDecoration >> mySize [
	^size
]

{ #category : #accessing }
RTLineDecoration >> percentage: aNumberOrBlockOrIdentifier [
	percentage := [ :e | aNumberOrBlockOrIdentifier rtValue: e ].
	
]

{ #category : #hooks }
RTLineDecoration >> percentageFor: anElement [
	^ percentage rtValue: anElement
]

{ #category : #accessing }
RTLineDecoration >> size: aNumberOrBlockOrIdentifier [
	size := [ :e | aNumberOrBlockOrIdentifier rtValue: e ].
	
]

{ #category : #hooks }
RTLineDecoration >> trachelShapeClass [
	^ TRAbstractLineDecoratorShape 
]

{ #category : #public }
RTLineDecoration >> trachelShapeFor: anEdge [
	| f shape |
	f := attachPoint startingPointOf: anEdge.
	anEdge shape class = RTArcLine & (attachPoint class = RTBorderAttachPoint)
		ifTrue:
			[ f := attachPoint
				attachPointFor: anEdge
				from: (anEdge to encompassingRectangle expandBy: 1)
				to: anEdge to encompassingRectangle ].
	line ~= nil
		ifTrue:
			[ | tShape |
			tShape := line trachelShapeFor: anEdge.
			(tShape class = TRBezierShape or: [ tShape class = TRBezier3Shape ])
				ifTrue: [ f := tShape points allButLast last ] ].
	shape := self trachelShapeClass
		from: f
		to: (attachPoint endingPointOf: anEdge)
		width: (self widthFor: anEdge)
		size: (self mySize rtValue: anEdge)
		color: (self colorFor: anEdge)
		stroke: (self colorFor: anEdge).
	shape 
		baseSize: (baseSize rtValue: anEdge);
		percentage: (self percentageFor: anEdge).
	^ shape
]

{ #category : #hooks }
RTLineDecoration >> updateFor: edge trachelShape: trachelShape [
	| f |
	f := attachPoint startingPointOf: edge.
	(edge shape class = RTArcLine and: [ attachPoint class = RTBorderAttachPoint ])
		ifTrue:
			[ f := attachPoint
				attachPointFor: edge
				from: (edge to encompassingRectangle expandBy: 1)
				to: edge to encompassingRectangle ].
	line ~= nil ifTrue: [ | tShape |
		tShape := edge trachelShape shapes first.
		(tShape class = TRBezierShape or: [ tShape class = TRBezier3Shape ])
			ifTrue: [ f := tShape points at: tShape points size - 1 ] ].
	trachelShape from: f.
	trachelShape to: (attachPoint endingPointOf: edge).
	trachelShape color: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape percentage: (self percentageFor: edge).
	trachelShape resetPath.
]

{ #category : #accessing }
RTLineDecoration >> width: aBlockOrValue [
	width := aBlockOrValue
]

{ #category : #hooks }
RTLineDecoration >> widthFor: anElement [
	^ width rtValue: anElement
]
