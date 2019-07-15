Class {
	#name : #ASRadialGradient,
	#superclass : #ASGradient,
	#instVars : [
		'cx',
		'cy',
		'r',
		'fx',
		'fy'
	],
	#category : #'Athens-SVG'
}

{ #category : #accessing }
ASRadialGradient >> cx: aString [ 

	cx := self translateLength: aString
]

{ #category : #accessing }
ASRadialGradient >> cy: aString [ 

	cy := self translateLength: aString
]

{ #category : #operations }
ASRadialGradient >> fill: shape on: aCanvas [
	
	| ramp grad p1 p2 |
	aCanvas paintTransform restoreAfter: [
		ramp := self colorRampWithOpacity: shape fill_opacity * shape opacity. 

		p1 := gradientTransform transform: cx@cy.
		
		fx ifNil: [ fx := cx ].
		fy ifNil: [ fy := cy ].
			
		p2 := gradientTransform transform: fx@fy.
		
		grad := aCanvas surface createRadialGradient: ramp center: p1 radius: r focalPoint: p2.
		
		aCanvas setPaint: grad.
		aCanvas draw
	].
]

{ #category : #accessing }
ASRadialGradient >> fx: aString [ 
	fx := self translateLength: aString
]

{ #category : #accessing }
ASRadialGradient >> fy: aString [ 
	fy := self translateLength: aString
]

{ #category : #accessing }
ASRadialGradient >> r: aString [ 
	r := self translateLength: aString
]

{ #category : #operations }
ASRadialGradient >> stroke: shape on: aCanvas [
	
	| ramp grad p1 p2 |
	aCanvas paintTransform restoreAfter: [
		ramp := self colorRampWithOpacity: shape stroke_opacity * shape opacity. 

		p1 := gradientTransform transform: cx@cy.
		
		fx ifNil: [ fx := cx ].
		fy ifNil: [ fy := cy ].
			
		p2 := gradientTransform transform: fx@fy.
		
		grad := aCanvas surface createRadialGradient: ramp center: p1 radius: r focalPoint: p2.
		
		aCanvas setStrokePaint: grad.
		aCanvas draw
	].
]
