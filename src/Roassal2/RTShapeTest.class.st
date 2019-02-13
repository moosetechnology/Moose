Class {
	#name : #RTShapeTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTShapeTest >> testArcShape [

	| arc el |
	arc := RTArc new.
	el := arc element.
	RTView new add: el.
	el encompassingRectangle
	
]

{ #category : #tests }
RTShapeTest >> testBitmapShape [
	| shape e |
	shape := RTBitmap new.
	shape form: (TRPlatform current colorFormClass extent: 600 @ 523 depth: 32).
	e := shape element.
	self assert: e encompassingRectangle extent equals: 600 @ 523
]

{ #category : #tests }
RTShapeTest >> testBitmapShape2 [
	| shape e form |
	shape := RTBitmap new.
	shape form: #yourself.
	form := TRPlatform current colorFormClass extent: 600 @ 523 depth: 32.
	e := shape elementOn: form.
	self assert: e trachelShape form equals: form.
]

{ #category : #tests }
RTShapeTest >> testBitmapShape3 [
	| shape e form |
	shape := RTBitmap new.
	shape formElement: [ :anElement | anElement model ].
	form := TRPlatform current colorFormClass extent: 600 @ 523 depth: 32.
	e := shape elementOn: form.
	self assert: e trachelShape form equals: form.
]

{ #category : #tests }
RTShapeTest >> testColoredShape [

	| shape el |
	shape := RTBox new color: Color red.
	el := shape element.
	RTView new add: el; setUpCanvas.
	self assert: el trachelShape color = Color red
]

{ #category : #composing }
RTShapeTest >> testComposing [
	| s1 s2 e v  |
	s1 := RTLabel new.
	s2 := RTBox new.
	e := RTElement on: 'hello'.
	e + s1 + s2.
	v := RTView new.
	v add: e.
	
	self assert: v canvas numberOfShapes = 2.

	self assert: v canvas shapes first class == TRLabelShape.
	self assert: v canvas shapes second class == TRBoxShape.
	

"	self assert: c shape2 extent = (5@5).
	self assert: c shape1 width > 10.
"	
]

{ #category : #composing }
RTShapeTest >> testComposingAndEvent [
	| s1 s2 e v t |
	s1 := RTLabel new.
	s2 := RTBox new.
	e := RTElement on: 'hello'.
	e + s1 + s2.
	t := false.
	e when: TRMouseClick do: [ :evt | t := true  ].
	v := RTView new.
	v add: e.
	
	self deny: t.
	e announce: TRMouseClick.
	self assert: t
]

{ #category : #tests }
RTShapeTest >> testElementCreation [

	| s |
	s := RTBox new.
	self assert: s element shape == s
]

{ #category : #tests }
RTShapeTest >> testInstance [

	| s |
	self assert: RTBox instance class == RTBox.
	self assert: RTBox instance ~~ RTBox instance.
	
	s := RTBox instance.
	self assert: s instance == s.
]

{ #category : #tests }
RTShapeTest >> testShapeAndElements [

	| es |
	es := RTBox elementsOn: #(1 2 3 4).
	self assert: es first shape == es second shape
]

{ #category : #tests }
RTShapeTest >> testShapeCreation [

	self assert: RTBox element shape class == RTBox
]
