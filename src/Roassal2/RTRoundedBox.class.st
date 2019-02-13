"
Rounded rectangle.
-=-=-=
v := RTView new.

e1 :=((RTRoundedBox new borderRadius: 10; size: 50) + RTLabel )  elementOn: 1.

e2 := (RTEllipse new size: 50) elementOn: 2.
v add: e1; add: e2.

e2 translateBy: 80 @ 60.

e1 @ RTDraggable.
e2 @ RTDraggable.

s := RTArrowedLine new color: Color black.
s attachPoint: RTRectangleAttachPoint new.
l := s edgeFrom: e1 to: e2.
v add: l.

v
-=-=-=
"
Class {
	#name : #RTRoundedBox,
	#superclass : #RTBox,
	#instVars : [
		'borderRadius'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTRoundedBox >> borderRadius [
	^ borderRadius
]

{ #category : #accessing }
RTRoundedBox >> borderRadius: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self borderRadiusElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
	
]

{ #category : #accessing }
RTRoundedBox >> borderRadiusElement: aValueOrAOneArgBlock [
	borderRadius := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTRoundedBox >> borderRadiusFor: anElement [
	^ borderRadius rtValue: anElement
]

{ #category : #configuration }
RTRoundedBox >> defaultBorderRadius [
	^ 0
]

{ #category : #accessing }
RTRoundedBox >> geometryFor: anElement [
	| rect |
	rect := GRectangle
		origin: anElement encompassingRectangle origin
		corner: anElement encompassingRectangle corner.
	^ GRoundedRectangle rectangle: rect borderRadius: (self borderRadiusFor: anElement)
]

{ #category : #initialization }
RTRoundedBox >> initialize [
	super initialize.
	borderRadius := self defaultBorderRadius
]

{ #category : #hooks }
RTRoundedBox >> trachelShapeClass [
	^ TRRoundedBoxShape
]

{ #category : #rendering }
RTRoundedBox >> updateFor: anElement trachelShape: trachelShape [
	| ex |
	trachelShape isNil ifTrue: [ ^ self ].
	ex := (self widthFor: anElement) @ (self heightFor: anElement).
	trachelShape
		extent: ex;
		color: (self colorFor: anElement);
		borderRadius: (self borderRadiusFor: anElement);
		strokePaint: (self borderColorFor: anElement);
		strokeWidth: (self borderWidthFor: anElement);
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement)
]
