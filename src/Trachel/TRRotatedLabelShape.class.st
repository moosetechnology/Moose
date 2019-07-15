Class {
	#name : #TRRotatedLabelShape,
	#superclass : #TRLabelShape,
	#instVars : [
		'angle'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRRotatedLabelShape >> accept: aVisitor [
	aVisitor visitRotatedLabelShape: self
]

{ #category : #accessing }
TRRotatedLabelShape >> angle [
	^angle
]

{ #category : #accessing }
TRRotatedLabelShape >> angleInDegree: anAngle [
	angle := anAngle
]

{ #category : #drawing }
TRRotatedLabelShape >> drawOn: athensCanvas [
	"self drawEncompassingRectangleOn: athensCanvas color: (Color green alpha: 0.1)."
	athensCanvas pathTransform restoreAfter: [
		"Draw the label centered on the position"
		athensCanvas pathTransform 
			translateBy: self position asIntegerPoint;
			rotateByDegrees: angle value;
			translateBy: ((self notRotatedWidth value / -2) @ (self notRotatedHeight value / 2)) asIntegerPoint;
			translateBy: (0 @ font descent negated) asIntegerPoint.
		athensCanvas setFont: font.
		athensCanvas setPaint: self themedColor.
		athensCanvas drawString: text
	].
]

{ #category : #accessing }
TRRotatedLabelShape >> encompassingRectangle [

	| w h transformation translation notRotatedRectangle rotatedRectangle topLeft topRight bottomRight bottomLeft p1 p2 p3 p4 |
	w := self notRotatedWidth.
	h := self notRotatedHeight.
	transformation := TRPlatform current affineTransformClass new 
						rotateByDegrees: angle value;
						translateBy: ((w / -2) @ (h / 2)) asIntegerPoint.
	notRotatedRectangle  := 0 @ h negated corner: (w @ 0).
	topLeft := transformation transform: notRotatedRectangle topLeft.
	topRight := transformation transform: notRotatedRectangle topRight.
	bottomRight := transformation transform: notRotatedRectangle bottomRight.
	bottomLeft := transformation transform: notRotatedRectangle bottomLeft.
	
	p1 := OrderedCollection new add: topLeft x; add: topRight x; add: bottomRight x; add: bottomLeft x; yourself.
	p2 := OrderedCollection new add: topLeft y; add: topRight y; add: bottomRight y; add: bottomLeft y; yourself.
	p3 := OrderedCollection new add: topLeft x; add: topRight x; add: bottomRight x; add: bottomLeft x; yourself.
	p4 := OrderedCollection new add: topLeft y; add: topRight y; add: bottomRight y; add: bottomLeft y; yourself.
	
	rotatedRectangle := 
		(p1 min @ p2 min) corner:
		(p3 max @ p4 max).
	translation := TRPlatform current affineTransformClass new
					translateBy: self position asIntegerPoint.
	^ (translation transform: rotatedRectangle topLeft)
	 	corner: (translation transform: rotatedRectangle bottomRight)
	
]

{ #category : #testing }
TRRotatedLabelShape >> includesPoint: aPoint [
	| w h p rec wh |
	w := self notRotatedWidth.
	h := self notRotatedHeight.
	wh := (w/2)@(h/2).
	p := TRPlatform current affineTransformClass new 
		rotateByDegrees: angle value negated; 
		transform: aPoint - self position.
	rec:= wh negated corner: wh.
	
	^ rec containsPoint: p.
]

{ #category : #initialization }
TRRotatedLabelShape >> initialize [
	super initialize.
	angle := 0.
]

{ #category : #accessing }
TRRotatedLabelShape >> notRotatedHeight [
	^ font height
]

{ #category : #accessing }
TRRotatedLabelShape >> notRotatedWidth [
	^ (font widthOfString: text)
]
