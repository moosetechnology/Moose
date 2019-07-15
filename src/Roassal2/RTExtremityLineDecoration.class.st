"
A DCRTLineDecoration is an abstract handler of head or tail of a line.

Usage: 
	DCRTLineHead shape: DCRTEmptyArrow
	or
	DCRTEmptyArrow asHead
"
Class {
	#name : #RTExtremityLineDecoration,
	#superclass : #RTLineDecoration,
	#instVars : [
		'shape'
	],
	#category : #'Roassal2-LineDecorations'
}

{ #category : #'instance creation' }
RTExtremityLineDecoration class >> shape: aShape [
	^ self new
		shape: aShape;
		yourself
]

{ #category : #converting }
RTExtremityLineDecoration >> asHead [
	^ RTLineHead shape: self shape
]

{ #category : #converting }
RTExtremityLineDecoration >> asTail [
	^ RTLineTail shape: self shape
]

{ #category : #initialization }
RTExtremityLineDecoration >> initialize [
	super initialize.
	self shape: RTSimpleArrow
]

{ #category : #accessing }
RTExtremityLineDecoration >> shape [
	^ shape
]

{ #category : #accessing }
RTExtremityLineDecoration >> shape: aShape [
	shape := aShape
]

{ #category : #hooks }
RTExtremityLineDecoration >> trachelShapeClass [
	^ self shape trachelShapeClass
]

{ #category : #private }
RTExtremityLineDecoration >> trachelShapeFor: anEdge from: fromPoint to: toPoint [
	| tShape |
	tShape := self trachelShapeClass
		from: fromPoint
		to: toPoint
		width: (self widthFor: anEdge)
		size: (self mySize rtValue: anEdge)
		color: (self colorFor: anEdge)
		stroke: (self colorFor: anEdge).
	tShape baseSize: (baseSize rtValue: anEdge).
	^ tShape
]

{ #category : #private }
RTExtremityLineDecoration >> updateFor: anEdge trachelShape: trachelShape from: fromPoint to: toPoint [
	trachelShape
		from: fromPoint;
		to: toPoint;
		color: (self colorFor: anEdge);
		width: (self widthFor: anEdge);
		resetPath
]
