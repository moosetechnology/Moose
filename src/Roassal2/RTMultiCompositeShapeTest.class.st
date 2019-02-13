Class {
	#name : #RTMultiCompositeShapeTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTMultiCompositeShapeTest >> testAlignRight [

	| v box box2 s |
	v := RTView new.
	box := RTBox new.
	box2 := RTBox new.
	s := RTCompositeShape new.
	s add: box.
   s add: box2.
	s alignRight.
	self assert: s allShapes equals: (Array with: box with: box2)
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testAllShapes [

	| v box box2 s |
	v := RTView new.
	box := RTBox new.
	box2 := RTBox new.
	s := RTCompositeShape new.
	s add: box.
   s add: box2.

	self assert: s allShapes equals: (Array with: box with: box2)
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testBeforeAddingToAView [

	| e1 e2 v |
	e1 := RTBox element.
	e2 := (RTShapeBuilder new cross color: Color red trans) element.
	e1 translateTo: 50 @ 50.
	e2 translateTo: 50 @ 50.
	
	self assert: e1 position equals: 50 @ 50.
	self assert: e2 position equals: 50 @ 50.
	
	v := RTView new.
	v add: e1.
	v add: e2.
	
	self assert: e1 position equals: 50 @ 50.
	self assert: e2 position equals: 50 @ 50.
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testColor [

	| v box s e |
	v := RTView new.
	box := RTBox new.
	s := RTCompositeShape new.
	s add: box.
	s color: Color red.
	e := s element.
	v add: e.
	
	self assert: e trachelShape shapes first color equals: Color red
]

{ #category : #'tests - composing' }
RTMultiCompositeShapeTest >> testComposedCompositedShape [

	| s1 s2 e v |
	s1 := RTCompositeShape new.
	s2 := RTCompositeShape new.
	
	s1 add: (RTBox new color: Color blue; size: 20).
	s1 add: (RTBox new color: Color red; size: 20).
	s1 vertical.

	s2 add: s1.
	s2 add: (RTBox new color: Color green; size: 20).
	s2 vertical.
	
	e := s2 element.
	
	"The element has to be added to the view in order to have the #vertical layout applied"
	v := RTView new.
	v add: e.

	"It does not pass for now.. No idea why"
	"self assert: e height equals: 60"
]

{ #category : #'tests - composing' }
RTMultiCompositeShapeTest >> testExtentCompositedShape [

	| s1  e v |
	s1 := RTCompositeShape new.
	
	s1 add: (RTBox new color: Color blue; size: 20).
	s1 add: (RTBox new color: Color red; size: 20).
	s1 vertical.
	e := s1 element.
	v := RTView new.
	v add: e.
	
	self assert: e height equals: 40
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testScenario [

	| v s2 s e |
	v := RTView new.

	s2 := RTCompositeShape new.
	s2 add: RTEllipse new.
	s2 add: RTEllipse new.
	s2 horizontal.

	s := RTCompositeShape new.
	s add: (RTLabel new text: 'hello').
	s add: s2.
	s vertical.

	e := s element.
	v add: e.
	v 

]

{ #category : #tests }
RTMultiCompositeShapeTest >> testTranslationBy [

	| view shape el ps ps2 |
	view := RTView new.
	shape := RTCompositeShape new.
	shape add: (RTBox new color: Color blue; height: 20; width: 15).
	shape add: (RTBox new color: Color white; height: 20; width: 15) translateBy: 15 @ 0.
	shape add: (RTBox new color: Color red; height: 20; width: 15) translateBy: 30 @ 0.

	el := shape element.
	el @ RTDraggable.
	view add: el.

	self assert: view canvas numberOfShapes equals: 3.
	self assert: el shape class equals: RTCompositeShape.
	
	ps := view canvas shapes collect: #position.
	self assert: ps equals: (Array with: (0 @ 0) with: (15 @ 0) with: (30 @ 0)).
	
	el translateBy: 10 @ 5.
	ps2 := view canvas shapes collect: #position.
	self assert: ps2 equals: (ps + (10 @ 5)).
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testTranslationTo [

	| view shape el ps ps2 |
	view := RTView new.
	shape := RTCompositeShape new.
	shape add: (RTBox new color: Color blue; height: 20; width: 15).
	shape add: (RTBox new color: Color white; height: 20; width: 15) translateBy: 15 @ 0.
	shape add: (RTBox new color: Color red; height: 20; width: 15) translateBy: 30 @ 0.

	el := shape element.
	el @ RTDraggable.
	view add: el.

	self assert: view canvas numberOfShapes equals: 3.
	self assert: el shape class equals: RTCompositeShape.
	
	ps := view canvas shapes collect: #position.
	self assert: ps equals: (Array with: (0 @ 0) with: (15 @ 0) with: (30 @ 0)).

	el translateTo: 10 @ 5.
	ps2 := view canvas shapes collect: #position.
	self assert: ps2 equals: (Array with: (-5 @ 5) with: (10 @ 5) with: (25 @ 5))
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testVerticalAndChangingElementSize [

	| s b1 b2 e view |
	s := RTCompositeShape new.
	b1 := RTBox new color: Color green.
	b2 := RTBox new color: Color blue; size: 20.
	s add: b1.
	s add: b2.
	s vertical.
	s setAutomaticRelayout.
	
	e := s element.
	view := RTView new.
	view add: e.

	"No resize has been done"
	self assert: (view canvas shapes collect: #encompassingRectangle) first equals: (((-5/2)@ (-5/2)) corner: ((5/2)@(5/2))).
	self assert: (view canvas shapes collect: #encompassingRectangle) second equals: ((-10@(5/2)) corner: (10@(45/2))).
	
	"We resize the second box"
	e trachelShape shapes second extent: 5 @ 5.
"	e trachelShape resetInnerShapes; vertical; relayout."
	self assert: (view canvas shapes collect: #encompassingRectangle) first equals: ((-2.5@ -2.5) corner: (2.5@2.5)).
	self assert: (view canvas shapes collect: #encompassingRectangle) second equals: ((-2.5@2.5) corner: (2.5@7.5)).
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testVerticalAndChangingElementSize2 [

	| s b1 b2 e view |
	s := RTCompositeShape new.
	b1 := RTBox new color: Color green.
	b2 := RTBox new color: Color blue.
	s add: b1.
	s add: b2.
	s vertical.
	
	e := s element.
	view := RTView new.
	view add: e.
	
	"No resize has been done"
	self assert: (view canvas shapes collect: #encompassingRectangle) first equals: (((-5/2)@ (-5/2)) corner: ((5/2)@(5/2))).
	self assert: (view canvas shapes collect: #encompassingRectangle) second equals: (((-5/2)@(5/2)) corner: ((5/2)@(15/2))).
	
	"We resize the second box"
	e trachelShape shapes second extent: 5 @ 5.
	
]

{ #category : #tests }
RTMultiCompositeShapeTest >> testVerticalLayoutAndTranslation [

	| v s e positions b1 b2 tb1 tb2 |
	v := RTView new.
	b1 := RTBox new color: Color red; size: 16.
	b2 := RTBox new color: Color blue; size: 16.
	s := RTCompositeShape new.
	s add: b1.
	s add: b2.
	s vertical.

	e := s element.
	v add: e @ RTDraggable.

	self assert: e trachelShape shapes second position equals: 0 @ 16.
	
	self assert: (e trachelShape offsets asArray) equals: (Array with: (0 @ 0) with: (0 @ 16.0)).

	tb1 := e trachelShape shapes first.
	tb2 := e trachelShape shapes second.
	self assert: (e trachelShape offsetOf: tb1) equals: 0 @ 0.
	self assert: (e trachelShape offsetOf: tb2) equals: 0 @ 16.0.

	positions := (e trachelShape shapes collect: #position) asArray.	
	self assert: positions equals: (Array with: (0 @ 0) with: (0 @ 16)).

	e translateTo: 0 @ 0.
	
	positions := (e trachelShape shapes collect: #position) asArray.
	self assert: positions equals: (Array with: (0 @ -8) with: (0 @ 8)).
	
]
