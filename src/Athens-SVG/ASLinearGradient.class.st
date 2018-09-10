Class {
	#name : #ASLinearGradient,
	#superclass : #ASGradient,
	#instVars : [
		'x1',
		'y1',
		'x2',
		'y2'
	],
	#category : #'Athens-SVG'
}

{ #category : #converting }
ASLinearGradient >> asAthensPaintOn: anAthensCairoCanvas [ 
	^ self
]

{ #category : #operations }
ASLinearGradient >> fill: aShape on: aCanvas [

	| ramp grad p1 p2 fo |
	aCanvas paintTransform restoreAfter: [
		ramp := self colorRampWithOpacity: aShape fill_opacity * aShape opacity. 
		p1 := gradientTransform transform: x1@y1.
		p2 := gradientTransform transform: x2@y2.
		
		grad := aCanvas surface createLinearGradient:  ramp start: p1  stop: p2.
		
		aCanvas setPaint: grad.
		aCanvas draw
	].
]

{ #category : #initialize }
ASLinearGradient >> initialize [ 
	super initialize.
	gradientTransform := AthensAffineTransform new.
]

{ #category : #operations }
ASLinearGradient >> stroke: aShape on: aCanvas [

	| ramp grad p1 p2 |
	aCanvas paintTransform restoreAfter: [
		ramp := self colorRampWithOpacity: aShape stroke_opacity * aShape opacity. 

		p1 := gradientTransform transform: x1@y1.
		p2 := gradientTransform transform: x2@y2.
		
		grad := aCanvas surface createLinearGradient:  ramp start: p1  stop: p2.
		
		aCanvas setStrokePaint: grad.
		aCanvas draw
	].
]

{ #category : #translate }
ASLinearGradient >> translate: node [
	super translate: node.
	stops := children 
]

{ #category : #accessing }
ASLinearGradient >> x1: aString [ 

	x1 := self translateNumber: aString
]

{ #category : #accessing }
ASLinearGradient >> x2: aString [ 

	x2 := self translateNumber: aString
]

{ #category : #accessing }
ASLinearGradient >> y1: aString [ 

	y1 := self translateNumber: aString
]

{ #category : #accessing }
ASLinearGradient >> y2: aString [ 

	y2 := self translateNumber: aString

]
