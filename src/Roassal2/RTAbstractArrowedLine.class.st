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

{ #category : #hooks }
RTAbstractArrowedLine >> trachelShapeClass [
	self subclassResponsibility
]

{ #category : #public }
RTAbstractArrowedLine >> width: aBlockOrValue [
	super width: aBlockOrValue.
	"line width: aBlockOrValue"
]

{ #category : #public }
RTAbstractArrowedLine >> widthElement: aBlockOrValue [
	"Set the width of the shape"
	super widthElement: aBlockOrValue.
	line widthElement: aBlockOrValue
]

{ #category : #public }
RTAbstractArrowedLine >> withOffsetIfMultiple [
	self attachPoint: RTShorterDistanceWithOffsetAttachPoint new.
]
