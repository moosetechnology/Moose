Class {
	#name : #RTAbstractArrowedLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'line'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTAbstractArrowedLine >> attachPoint: anAttachPoint [
	super attachPoint: anAttachPoint.
	line attachPoint: anAttachPoint
]

{ #category : #accessing }
RTAbstractArrowedLine >> color: aColor [
	line color: aColor
]

{ #category : #initialization }
RTAbstractArrowedLine >> initialize [
	super initialize.
	self straight.
]

{ #category : #accessing }
RTAbstractArrowedLine >> line [
	^ line
]

{ #category : #accessing }
RTAbstractArrowedLine >> line: aLineShape [
	line := aLineShape
]

{ #category : #accessing }
RTAbstractArrowedLine >> straight [
	self line: RTLine new
]

{ #category : #public }
RTAbstractArrowedLine >> width: aValue [
	line width: aValue
]

{ #category : #public }
RTAbstractArrowedLine >> withOffsetIfMultiple [
	self attachPoint: RTShorterDistanceWithOffsetAttachPoint new.
]
