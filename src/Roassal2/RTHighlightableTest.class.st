Class {
	#name : #RTHighlightableTest,
	#superclass : #RTTest,
	#instVars : [
		'box'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTHighlightableTest >> testBasic [
	box := (RTBox new color: Color green) element.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

	box @ RTHighlightable.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

	box announce: TRMouseEnter.
	"The Roassal shape remains the same"
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = RTHighlightable highlightedColor.
	
	box announce: TRMouseLeave.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

]

{ #category : #tests }
RTHighlightableTest >> testBasicWithSVGShape [
	box := (RTSVGPath new path: 'M 100 100 L 300 100 L 200 300 z'; color: Color green) element.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

	box @ RTHighlightable.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

	box announce: TRMouseEnter.
	"The Roassal shape remains the same"
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = RTHighlightable highlightedColor.
	
	box announce: TRMouseLeave.
	self assert: (box shape colorFor: box) = Color green.
	self assert: box trachelShape color = Color green.

]

{ #category : #tests }
RTHighlightableTest >> testDefaultColor [

	self assert: RTHighlightable new color equals: RTHighlightable highlightedColor
]

{ #category : #tests }
RTHighlightableTest >> testHighlightAllSibblings [

	| v e1 e2 e3 |
	v := RTView new.
	e1 := (RTBox new color: Color gray) elementOn: 1.
	e2 := (RTEllipse new color: Color gray) elementOn: 1.
	e3 := (RTBox new color: Color gray) elementOn: 2.
	
	v add: e1; add: e2; add: e3.
	
	e1 @ RTHighlightable allSibblings.
	self assert: e1 trachelShape color == Color gray.
	self assert: e2 trachelShape color == Color gray.
	self assert: e3 trachelShape color == Color gray.
	
	e1 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color == Color gray.
]

{ #category : #tests }
RTHighlightableTest >> testHighlightAllSibblings02 [

	| v e1 e2 e3 |
	v := RTView new.
	e1 := (RTBox new color: Color gray) element.
	e2 := (RTEllipse new color: Color gray) element.
	e3 := (RTBox new color: Color gray) element.
	
	v add: e1; add: e2; add: e3.
	
	e1 @ RTHighlightable allSibblings.
	self assert: e1 trachelShape color == Color gray.
	self assert: e2 trachelShape color == Color gray.
	self assert: e3 trachelShape color == Color gray.
	
	e1 announce: TRMouseEnter.
	self assert: e1 trachelShape color == Color gray.
	self assert: e2 trachelShape color == Color gray.
	self assert: e3 trachelShape color == Color gray.
]

{ #category : #tests }
RTHighlightableTest >> testHighlightMultipleObjects [

	| elements view originalColor |
	elements := RTBox elementsOn: (Array with: 1 with: 2 with: 2).
	view := RTView new.
	view addAll: elements.
	
	originalColor := elements first color. 
	
	"Not necessary, but useful when debugging the test"
	RTHorizontalLineLayout on: elements.

	elements @ (RTHighlightable highlight: [ :v | Array with: v + 1 ]).
	self assert: (elements allSatisfy: [ :e | e trachelShape color = originalColor ]).
	
	elements first announce: TRMouseEnter new.
	self assert: (elements first trachelShape color = originalColor ).
	self assert: (elements second trachelShape color = RTHighlightable highlightedColor).
	self assert: (elements third trachelShape color = RTHighlightable highlightedColor).
	
	elements first announce: TRMouseLeave new.
	self assert: (elements allSatisfy: [ :e | e trachelShape color = originalColor ]).
]

{ #category : #tests }
RTHighlightableTest >> testMultipleElements [
	| box1 box2 |
	box1 := (RTBox new color: Color green) element.
	box2 := (RTBox new color: Color red) element.
	
	box1 @ (RTHighlightable highlightElements: [ :e | Array with: box2 ]).
	box1 announce: TRMouseEnter.

	"The Roassal shape remains the same"
	self assert: (box1 shape colorFor: box1) = Color green.
	self assert: box1 trachelShape color = Color green.
	self assert: box2 trachelShape color = RTHighlightable highlightedColor.
	
	box1 announce: TRMouseLeave.
	self assert: box1 trachelShape color = Color green.
	self assert: box2 trachelShape color = Color red
]

{ #category : #tests }
RTHighlightableTest >> testMultipleElementsDoHighlight [
	| box1 box2 h |
	box1 := (RTBox new color: Color green) elementOn: 1.
	box2 := (RTBox new color: Color red) elementOn: 2.
	
	h := RTHighlightable new highlightElements: [ :e | Array with: box2 ].
	h doHighlight: box1.
	
	"The Roassal shape remains the same"
	self assert: (box1 shape colorFor: box1) = Color green.
	self assert: box1 trachelShape color = Color green.
	self assert: box2 trachelShape color = RTHighlightable highlightedColor.
	
	h doUnhighlight: box1.
	self assert: box1 trachelShape color = Color green.
	self assert: box2 trachelShape color = Color red
]

{ #category : #tests }
RTHighlightableTest >> testSetColor [

	| i |
	i := RTHighlightable new.
	i color: Color red.
	self assert: Color red equals: i color
]

{ #category : #tests }
RTHighlightableTest >> testhighlightElements [

	self assert: RTHighlightable new highlightElements notNil
]
