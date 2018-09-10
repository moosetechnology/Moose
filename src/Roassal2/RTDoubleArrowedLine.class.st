"
A RTDoubleArrowedLine is a double arrowed line between its extremities.
-=-=-=
| v l e1 e2 eShape |
v := RTView new.
eShape := RTEllipse new size: 8; color: (Color blue alpha: 0.3).
e1 := eShape element.
e2 := eShape element.
e2 translateBy: 50 @ 30.
v add: e1; add: e2.
e1 @ RTDraggable.
e2 @ RTDraggable.

l := (RTDoubleArrowedLine new color: Color red) edgeFrom: e1 to: e2.
v add: l.

v
-=-=-=
"
Class {
	#name : #RTDoubleArrowedLine,
	#superclass : #RTAbstractArrowedLine,
	#instVars : [
		'headStart',
		'headEnd'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTDoubleArrowedLine >> attachPoint: anAttachPoint [
	super attachPoint: anAttachPoint.
	headStart attachPoint: anAttachPoint.
	headEnd attachPoint: anAttachPoint.
]

{ #category : #accessing }
RTDoubleArrowedLine >> color: aColor [
	super color: aColor.
	headStart color: aColor.
	headEnd color: aColor.	
]

{ #category : #accessing }
RTDoubleArrowedLine >> headEnd [
	^ headEnd
]

{ #category : #accessing }
RTDoubleArrowedLine >> headEnd: aHead [
	headEnd := aHead
]

{ #category : #accessing }
RTDoubleArrowedLine >> headStart [
	^ headStart
]

{ #category : #accessing }
RTDoubleArrowedLine >> headStart: aHead [
	headStart := aHead
]

{ #category : #initialization }
RTDoubleArrowedLine >> initialize [
	super initialize.
	self simple
]

{ #category : #public }
RTDoubleArrowedLine >> simple [
	self headStart: RTSimpleArrowHead new.
	self headEnd: RTSimpleArrowHead new.
	self headEnd attachPoint inverted.
]

{ #category : #public }
RTDoubleArrowedLine >> trachelShapeFor: anEdge [
	| lineTrachelShape headStartTrachelShape headEndTrachelShape |
	(self isSelfLoopAllowedFor: anEdge) ifFalse: [ 
		^ TRNoShape instance ].
	lineTrachelShape := line trachelShapeFor: anEdge.
	headStartTrachelShape := headStart trachelShapeFor: anEdge.
	headEndTrachelShape := headEnd trachelShapeFor: anEdge.
	^ TRCompositeShape new 
			addShape: lineTrachelShape; 
			addShape: headStartTrachelShape; 
			addShape: headEndTrachelShape;
			yourself
	
]

{ #category : #rendering }
RTDoubleArrowedLine >> updateFor: edge trachelShape: trachelShape [
	(self isSelfLoopAllowedFor: edge) ifFalse: [ ^ self ].
	line updateFor: edge trachelShape: edge trachelShape shapes first.
	headStart updateFor: edge trachelShape: edge trachelShape shapes second.
	headEnd updateFor: edge trachelShape: edge trachelShape shapes third
]
