Class {
	#name : #TRAbstractBoxShape,
	#superclass : #TRShape,
	#instVars : [
		'rectangle',
		'strokeWidth',
		'dashes'
	],
	#classInstVars : [
		'nullRectangle'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #public }
TRAbstractBoxShape class >> nullRectangle [
	nullRectangle ifNotNil: [ ^ nullRectangle ].
	nullRectangle := (0 @ 0) extent: (0 @ 0).
	^ nullRectangle
]

{ #category : #visitor }
TRAbstractBoxShape >> accept: aVisitor [
	aVisitor visitAbstractBoxShape: self
]

{ #category : #private }
TRAbstractBoxShape >> basicEncompassingRectangle [
	^ rectangle
]

{ #category : #public }
TRAbstractBoxShape >> bottomPosition [
	"Return the shape center top position"
	^ self position + (0 @ (self height / 2))
]

{ #category : #public }
TRAbstractBoxShape >> bottomPosition: aPosition [
	"Move the shape by locating its center top position at aPosition"
	self position: (aPosition + (0 @ (self height / -2)))
]

{ #category : #accessing }
TRAbstractBoxShape >> center [
	^ self position
]

{ #category : #accessing }
TRAbstractBoxShape >> dashes [
	^ dashes
]

{ #category : #accessing }
TRAbstractBoxShape >> dashes: aDashSpecification [
	dashes := aDashSpecification
]

{ #category : #drawing }
TRAbstractBoxShape >> drawOn: athensCanvas [
	self shouldBeDrawn
		ifFalse: [ ^ self ].
	athensCanvas pathTransform
		restoreAfter: [ 
			athensCanvas pathTransform
				multiplyBy: matrix asFloatTransform.
			athensCanvas 
				setPaint: self themedColor;
				drawShape: self path.
			self drawStrokeIfNecessaryOn: athensCanvas ]
]

{ #category : #drawing }
TRAbstractBoxShape >> drawStrokeIfNecessaryOn: athensCanvas [
	| ratio |
	self canvas ifNil: [ ^ self ].
	ratio := self scaledStrokeWidth.
	^ strokePaint
		ifNotNil:
			[ (athensCanvas setStrokePaint: strokePaint)
				width: ratio asFloat;
				dashes: dashes offset: 0.
			athensCanvas drawShape: path ]
]

{ #category : #accessing }
TRAbstractBoxShape >> encompassingRectangle [
	^ self transformedEncompassingRectangle 
]

{ #category : #accessing }
TRAbstractBoxShape >> extent [
	^ self encompassingRectangle extent
]

{ #category : #geometry }
TRAbstractBoxShape >> extent: newExtent [
	"Set the extent of the shape"
	| oldExtent |
	newExtent = rectangle extent ifTrue: [ ^ self ].
	oldExtent := rectangle extent.
	rectangle := (0@0 - (newExtent / 2)) extent: newExtent.
	self resetPath.
	(oldExtent = (0 @ 0)) ifFalse: [ 
		self triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent ].

]

{ #category : #public }
TRAbstractBoxShape >> from: aPoint extent: anotherPoint [ 
	
	self fromRectangle: (aPoint corner: (aPoint + anotherPoint))
]

{ #category : #public }
TRAbstractBoxShape >> from: aPoint to: anotherPoint [ 
	
	self fromRectangle: (aPoint corner: anotherPoint)
]

{ #category : #public }
TRAbstractBoxShape >> from: aPoint to: anotherPoint color: aColor [
	self from: aPoint to: anotherPoint.
	self color: aColor.
]

{ #category : #public }
TRAbstractBoxShape >> fromRectangle: newRectangle [
	| step |
	step := newRectangle center - self position.
	rectangle := newRectangle translateBy: newRectangle center negated.
	self position: newRectangle center.
	self resetPath.
	self triggerCallbacksForStep: step.
]

{ #category : #public }
TRAbstractBoxShape >> fromRectangle: r color: aColor [
	self fromRectangle: r.
	self color: aColor
]

{ #category : #accessing }
TRAbstractBoxShape >> height [
	^ self encompassingRectangle height
]

{ #category : #accessing }
TRAbstractBoxShape >> height: newHeight [
	self extent: rectangle width @ newHeight
]

{ #category : #testing }
TRAbstractBoxShape >> includesPoint: aPoint [
	self subclassResponsibility
]

{ #category : #initialization }
TRAbstractBoxShape >> initialize [
	super initialize.
	rectangle := self class nullRectangle.
	strokeWidth := 1
]

{ #category : #public }
TRAbstractBoxShape >> leftPosition [
	"Return the shape center left position"
	^ self position - ((self width / 2) @ 0)
]

{ #category : #public }
TRAbstractBoxShape >> leftPosition: aPosition [
	"Move the shape by locating its center left position at aPosition"
	self position: (aPosition - ((self width / -2) @ 0))
]

{ #category : #geometry }
TRAbstractBoxShape >> rectangle [
	^ rectangle
]

{ #category : #geometry }
TRAbstractBoxShape >> rectangle: aRectangle [
	rectangle := aRectangle.
	self resetPath.
	
	"(oldExtent = (0 @ 0)) ifFalse: [ 
		self triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent ].
"
]

{ #category : #public }
TRAbstractBoxShape >> rightPosition [
	"Return the shape center right position"
	^ self position + ((self width / 2) @ 0)
]

{ #category : #public }
TRAbstractBoxShape >> rightPosition: aPosition [
	"Move the shape by locating its center right position at aPosition"
	self position: (aPosition - ((self width / 2) @ 0))
]

{ #category : #drawing }
TRAbstractBoxShape >> scaledStrokeWidth [
	| scale |
	scale := self canvas camera scale.
	^ scale < 1
		ifTrue: [ self strokeWidth ]
		ifFalse: [ self strokeWidth / scale ]
]

{ #category : #testing }
TRAbstractBoxShape >> shouldBeDrawn [
	^ rectangle width > 0 and: [ rectangle height > 0 ]
]

{ #category : #accessing }
TRAbstractBoxShape >> size: v [
	^ self extent: v @ v
]

{ #category : #hooks }
TRAbstractBoxShape >> strokeWidth [
	"Return the width of the border shape"
	^ strokeWidth
]

{ #category : #accessing }
TRAbstractBoxShape >> strokeWidth: aWidth [
	"Set the width of the border shape"
	strokeWidth := aWidth
]

{ #category : #public }
TRAbstractBoxShape >> topPosition [
	"Return the shape center top position"
	^ self position - (0 @ (self height / 2))
]

{ #category : #public }
TRAbstractBoxShape >> topPosition: aPosition [
	"Move the shape by locating its center top position at aPosition"
	self position: (aPosition - (0 @ (self height / -2)))
]

{ #category : #accessing }
TRAbstractBoxShape >> width [
	^ self encompassingRectangle width
]

{ #category : #accessing }
TRAbstractBoxShape >> width: newWidth [
	self extent: newWidth @ rectangle height.
]
