Class {
	#name : #RTShapeBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'builder',
		'shapes'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #running }
RTShapeBuilderTest >> setUp [
	super setUp.
	builder := RTShapeBuilder new
]

{ #category : #'attach point' }
RTShapeBuilderTest >> testAttachPoint01 [

	builder line; verticalAttachPoint.
	self assert: RTVerticalAttachPoint equals: builder shape attachPoint class
]

{ #category : #'attach point' }
RTShapeBuilderTest >> testAttachPoint02 [

	builder line; horizontalAttachPoint.
	self assert: builder shape attachPoint class equals: RTHorizontalAttachPoint
]

{ #category : #'attach point' }
RTShapeBuilderTest >> testAttachPoint03 [

	builder line; centeredAttachPoint.
	self assert: builder shape attachPoint class equals: RTCenteredAttachPoint
]

{ #category : #tests }
RTShapeBuilderTest >> testBasic [

	self assert: builder shape class == RTNoShape
]

{ #category : #'bezier line' }
RTShapeBuilderTest >> testBezierLine01 [

	| v es eb centralPoint |
	v := RTView new.
	es := (RTEllipse new size: 15) elementsOn: (1 to: 15).
	v addAll: es.
	RTCircleLayout on: es.

	centralPoint := (RTEllipse new size: 10; color: Color red) elementOn: -1.
	centralPoint translateTo: es encompassingRectangle center.
	v add: centralPoint.

	es @ RTLabeled.

	eb := RTEdgeBuilder new.
	eb view: v.
	eb shape bezierLineUsingObjects: (Array with: -1)  inView: v.
	eb useAssociations: (Array with: 1->10 with: 2 -> 10 with: 3 -> 10 ).

]

{ #category : #'composite shapes' }
RTShapeBuilderTest >> testBorderColorAndCompositeShape [

	| s label box |
	builder box; withTextAbove; borderColor: Color black.
	s := builder current.
	shapes := s allShapes.
	 
	"Checking the label"
	self assert: shapes first class equals: RTLabel.
	label := shapes first.
	self assert: label color equals: RTLabel defaultColor.
	
	"Checking the box"
	self assert: shapes second class equals: RTBox.
	box := shapes second.
	self assert: (box borderColorFor: RTElement new) equals: Color black.
]

{ #category : #tests }
RTShapeBuilderTest >> testBox [
	builder rectangle.
	self assert: builder shape class == RTBox
]

{ #category : #tests }
RTShapeBuilderTest >> testBoxWithDimensions [
	| shape |
	builder rectangle width: [ :v | v + 3 ].
	shape := builder shape.
	self assert: shape class == RTBox.
	self assert: (shape widthFor: (RTElement on: 5)) = 8
]

{ #category : #tests }
RTShapeBuilderTest >> testColor [

	| e |
	builder rectangle color: Color blue.
	e := builder elementOn: 1.
	
	self assert: (e shape colorFor: e) equals: Color blue.
	self assert: e trachelShape color equals: Color blue.
]

{ #category : #tests }
RTShapeBuilderTest >> testColorIf [

	| e |
	builder box 
		if: true color: Color blue;
		if: true color: Color red.
	e := builder elementOn: 1.
	
	self assert: (e shape colorFor: e) equals: Color red.
	self assert: e trachelShape color equals: Color red.
]

{ #category : #'created elements' }
RTShapeBuilderTest >> testCreatingElements [
	builder rectangle.
	self assert: builder createdElements size = 0.
	builder elementsOn: (1 to: 10).
	self assert: builder createdElements size = 10.
	builder reset.
	self assert: builder createdElements size = 0.
]

{ #category : #ensure }
RTShapeBuilderTest >> testEnsure [

	builder rectangle color: Color red.
	self assert: builder current class equals: RTBox.
	self assert: ((builder current color) rtValue: RTElement new) equals: Color red.
	builder ensure: RTBox.
	self assert: ((builder current color) rtValue: RTElement new) equals: Color red.
]

{ #category : #ensure }
RTShapeBuilderTest >> testEnsure2 [

	builder rectangle color: Color red.
	builder ensure: RTEllipse.
	self assert: ((builder current color) rtValue: RTElement new) equals: (RTEllipse new color).
]

{ #category : #tests }
RTShapeBuilderTest >> testFillColor [

	self assert: builder color isColor.
	self assert: builder fillColor isColor.
]

{ #category : #'composite shapes' }
RTShapeBuilderTest >> testFillColorAndCompositeShape [

	| s label box |
	builder box; withTextAbove; fillColor: Color black.
	s := builder current.
	shapes := s allShapes.
	 
	"Checking the label"
	self assert: shapes first class equals: RTLabel.
	label := shapes first.
	self assert: (label colorFor: RTElement new) equals: RTLabel defaultColor.
	
	"Checking the box"
	self assert: shapes second class equals: RTBox.
	box := shapes second.
	self assert: (box colorFor: RTElement new) equals: Color black.
]

{ #category : #'composite shapes' }
RTShapeBuilderTest >> testFillColorAndCompositeShape02 [

	| s label box |
	builder box; withTextAbove; textColor: Color black; fillColor: Color red.
	s := builder current.
	shapes := s allShapes.
	 
	"Checking the label"
	self assert: shapes first class equals: RTLabel.
	label := shapes first.
	self assert: (label colorFor: RTElement new) equals: Color black.
	
	"Checking the box"
	self assert: shapes second class equals: RTBox.
	box := shapes second.
	self assert: (box colorFor: RTElement new) equals: Color red.
]

{ #category : #hasSetShape }
RTShapeBuilderTest >> testHasSetShape [

	self deny: builder hasSetShape.
	builder rectangle.
	self assert: builder hasSetShape.
	self deny: builder hasSetLineShape.
	
	builder line.
	self assert: builder hasSetShape.
	self assert: builder hasSetLineShape.
]

{ #category : #'border color' }
RTShapeBuilderTest >> testIfBorderColor [

	| e |
	builder 
		box;
		if: true borderColor: Color red.
		
	self assert: (builder borderColor rtValue: RTElement new) equals: Color red.
	e := builder elementOn: 42.
	
	self assert: (e shape borderColorFor: e) equals: Color red
]

{ #category : #tests }
RTShapeBuilderTest >> testLine [
	builder line.
	self assert: builder shape class == RTLine
]

{ #category : #'linear fill color' }
RTShapeBuilderTest >> testLinearFillColorWithin [
	| elements m |
	m := (Array with: #(0) with: #(1) with: #(2)).
	builder rectangle linearFillColor: #first within: m.
	elements := builder elementsOn: m.
	
	self assert: elements first trachelShape color red > 0.9.
	self assert: elements first trachelShape color green > 0.9.
	self assert: elements first trachelShape color blue > 0.9.	
	self assert: elements third trachelShape color = Color black.
]

{ #category : #tests }
RTShapeBuilderTest >> testOrthoLine [

	| v eb |
	v := RTView new.
	v addAll: (RTBox new elementsOn: (1 to: 4)).

	eb := RTEdgeBuilder new.
	eb shape orthoHorizontalLine color: Color veryLightGray.
	eb view: v.
	eb objects: (1 to: 4);
		connectFrom: #yourself to: [ :vv | vv - 1 ].
	self assert: (v canvas shapes noneSatisfy: [ :s | s class == TRCompositeShape ])

]

{ #category : #tests }
RTShapeBuilderTest >> testShape [
	| e1 e2 e3 |
	builder rectangle
		if: [ :o | o = 3 ] fillColor: Color blue;
		if: [ :o | o = 4 ] fillColor: Color red.
	e1 := builder elementOn: 3.
	e2 := builder elementOn: 4.
	e3 := builder elementOn: 5.
	
	self assert: (e1 shape colorFor: e1) = Color blue.
	self assert: e1 trachelShape color = Color blue.
	self assert: e2 trachelShape color = Color red.
	self assert: e3 trachelShape color = Color veryVeryLightGray.
]

{ #category : #tests }
RTShapeBuilderTest >> testShape2 [
	| e1 e2 e3 |
	builder rectangle
		ifElement: [ :el | el model = 3 ] fillColor: Color blue;
		ifElement: [ :el | el model = 4 ] fillColor: Color red.
	e1 := builder elementOn: 3.
	e2 := builder elementOn: 4.
	e3 := builder elementOn: 5.
	
	self assert: (e1 shape colorFor: e1) = Color blue.
	self assert: e1 trachelShape color = Color blue.
	self assert: e2 trachelShape color = Color red.
	self assert: e3 trachelShape color = Color veryVeryLightGray.
]

{ #category : #withText }
RTShapeBuilderTest >> testWithText [

	| v el |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder circle 
				size: 50; 
				fillColor: (Color purple alpha: 0.3);
				withText.
	el := builder elementOn: 'hello'.
	v add: el.
	
	self assert: el shape class == RTCompositeShape.
	
]

{ #category : #withText }
RTShapeBuilderTest >> testWithTextAndColor [

	| v el |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder circle 
				size: 50; 
				fillColor: (Color purple alpha: 0.3);
				withText;
				withTextColor: Color red.
	el := builder elementOn: 'hello'.
	v add: el.
	
	self assert: el shape class == RTCompositeShape.
	
]

{ #category : #withText }
RTShapeBuilderTest >> testWithTextAndTranslation [

	| v el |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder circle 
				size: 50; 
				fillColor: (Color purple alpha: 0.3);
				withText.
	el := builder elementOn: 'hello'.
	el translateTo: 20 @ 20.
	v add: el.
	
	self assert: el shape class == RTCompositeShape.
	
]

{ #category : #tests }
RTShapeBuilderTest >> testWithTextHeightColor [
	| b |
	b := RTMondrian new.
	b shape box
		borderColor: Color black;
		width: 40;
		height: 30;
		withText: #yourself height: 2 color: Color red.
		
	b node: 'hello'.
	b build.
	
	self assert: b view numberOfElements equals: 1.
	self assert: b view canvas numberOfShapes equals: 2.
	
	"That is weird... why 4 and not 2?"
	self assert: b view canvas shapes second height equals: b view canvas shapes second font height.
]
