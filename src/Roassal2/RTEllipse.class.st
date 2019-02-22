"
A RTEllipse is an ellipse. e.g., RTEllipse new width: 10; height: 20


| v |
v := RTView new.
v add: (RTEllipse new width: 10; height: 20) element.
v open
"
Class {
	#name : #RTEllipse,
	#superclass : #RTAbstractElementShape,
	#category : #'Roassal2-Shapes'
}

{ #category : #visitor }
RTEllipse >> accept: aVisitor [
	aVisitor visitEllipse: self
]

{ #category : #accessing }
RTEllipse >> geometryFor: anElement [
	^ GEllipse center: anElement position a: anElement width / 2 b: anElement height / 2
]

{ #category : #initialization }
RTEllipse >> initialize [
	super initialize.
	color := self defaultColor.
	self borderWidth: self trachelShapeClass defaultStrokeWidth
]

{ #category : #hooks }
RTEllipse >> trachelShapeClass [
	^ TREllipseShape

]

{ #category : #rendering }
RTEllipse >> updateFor: anElement trachelShape: trachelShape [
	| ex rec |
	trachelShape isNil ifTrue: [ ^ self ].
	ex := (self widthFor: anElement) @ (self heightFor: anElement).
	rec := (anElement position - (ex / 2)) extent: ex.
	
	trachelShape 
		fromRectangle: rec color: (self colorFor: anElement);
		strokeWidth: (self borderWidthFor: anElement);
		strokePaint: (self borderColorFor: anElement);
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement).
	^ trachelShape
	
]
