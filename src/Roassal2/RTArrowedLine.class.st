"
A RTArrowedLine is an arrowed line between its extremities

Instance Variables
	head:		<Object>
	line:		<Object>

head
	- xxxxx

line
	- xxxxx

"
Class {
	#name : #RTArrowedLine,
	#superclass : #RTAbstractArrowedLine,
	#instVars : [
		'head'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #public }
RTArrowedLine class >> edgeFrom: el1 to: el2 [
	^ (RTEdge from: el1 to: el2) addShape: self new
]

{ #category : #accessing }
RTArrowedLine >> attachPoint: anAttachPoint [
	super attachPoint: anAttachPoint.
	head attachPoint: anAttachPoint.
]

{ #category : #accessing }
RTArrowedLine >> color: aColor [
	super color: aColor.
	head color: aColor.
	
]

{ #category : #public }
RTArrowedLine >> directed [

	self line: RTDirectedLine new
]

{ #category : #public }
RTArrowedLine >> empty [
	self head: RTEmptyArrowHead new
]

{ #category : #accessing }
RTArrowedLine >> head [
	^ head
]

{ #category : #accessing }
RTArrowedLine >> head: aLineDecorationShape [
	head := aLineDecorationShape.
	line ifNotNil: [ head line: line ].
]

{ #category : #accessing }
RTArrowedLine >> headOffset: aFloat [
	"aFloat is value between 0.0 and 1.0 indicating where the arrow is located between the two extremities"
	head percentage: aFloat
]

{ #category : #initialization }
RTArrowedLine >> initialize [
	super initialize.
	self simple
]

{ #category : #public }
RTArrowedLine >> inverted [
	attachPoint inverted
]

{ #category : #public }
RTArrowedLine >> simple [
	self head: RTSimpleArrowHead new
]

{ #category : #public }
RTArrowedLine >> trachelShapeFor: anEdge [
	| lineTrachelShape headTrachelShape |
	^ (self isSelfLoopAllowedFor: anEdge) ifTrue: [ 
		lineTrachelShape := line trachelShapeFor: anEdge.
		headTrachelShape := head trachelShapeFor: anEdge.
		TRCompositeShape new 
			addShape: lineTrachelShape; 
			addShape: headTrachelShape; 
			yourself ]
		ifFalse: [ TRNoShape instance ].
	
]

{ #category : #hooks }
RTArrowedLine >> updateFor: edge trachelShape: trachelShape [
	(self isSelfLoopAllowedFor: edge) 
		ifFalse: [ ^ self ].
	line updateFor: edge trachelShape: edge trachelShape shapes first.
	head updateFor: edge trachelShape: edge trachelShape shapes second
]

{ #category : #accessing }
RTArrowedLine >> withOffset [
	self headOffset: 0.7
]
