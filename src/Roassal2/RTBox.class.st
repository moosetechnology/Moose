"
A RTBox is a rectangular box. E.g.,

| v |
v := RTView new.
v add: (RTBox new width: 10; height: 20) element.
v open
"
Class {
	#name : #RTBox,
	#superclass : #RTAbstractElementShape,
	#instVars : [
		'borderStyle'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #visitor }
RTBox >> accept: aVisitor [
	aVisitor visitBox: self
]

{ #category : #accessing }
RTBox >> borderStyle [
	^ borderStyle ifNil: [ borderStyle := RTBorderStyle new ]
]

{ #category : #accessing }
RTBox >> borderStyle: aStyleSelector [
	self borderStyle style: aStyleSelector
]

{ #category : #hooks }
RTBox >> trachelShapeClass [
	^ TRBoxShape
]

{ #category : #rendering }
RTBox >> updateFor: anElement trachelShape: trachelShape [
	| ex |
	trachelShape isNil
		ifTrue: [ ^ self ].
	ex := (self widthFor: anElement) @ (self heightFor: anElement).
	trachelShape 
		extent: ex;
		color: (self colorFor: anElement);
		strokePaint: (self borderColorFor: anElement);
		strokeWidth: (self borderWidthFor: anElement);
		dashes: self borderStyle style;
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement)
]
