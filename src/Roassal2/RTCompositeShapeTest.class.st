Class {
	#name : #RTCompositeShapeTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTCompositeShapeTest >> testAddingAfterLayout [

	| v s es |
	v := RTView new.
	s := RTCompositeShape new.
	s add: RTBox new.
	"s := RTEllipse new."
	es := s elementsOn: (1 to: 2).
	RTGridLayout on: es.
	v add: es first.
	v add: es second.

	self assert: (es collect: [ :e | e position asIntegerPoint ]) asArray equals: (Array with: (2@2) with: (12@2))
]

{ #category : #tests }
RTCompositeShapeTest >> testAddingAfterLayout02 [

	| v s es |
	v := RTView new.
	s := RTCompositeShape new.
	s add: RTBox new.
	"s := RTEllipse new."
	es := s elementsOn: (1 to: 2).
	v add: es first.
	v add: es second.
	RTGridLayout on: es.

	self assert: (es collect: [ :e | e position asIntegerPoint ]) asArray equals: (Array with: (2@2) with: (12@2))
]

{ #category : #'tests - all same size' }
RTCompositeShapeTest >> testAllSameSize01 [

	| box1 box2 combo v |
	box1 := RTBox new color: Color blue trans; size: 20.
	box2 := RTBox new color: Color red trans; size: 10.

	combo:= RTCompositeShape new allOfSameSize; add: box1; add: box2.

	v := RTView new.
	v add: combo element. 
	
	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 2.
	
	self assert: (v canvas shapes collect: #encompassingRectangle) asSet size equals: 1
]

{ #category : #'tests - all same size' }
RTCompositeShapeTest >> testAllSameSize01AndVertical [

	| box1 box2 combo v firstShape secondShape |
	box1 := RTBox new color: Color blue trans; size: 20.
	box2 := RTBox new color: Color red trans; size: 10.

	combo:= RTCompositeShape new allOfSameSize; add: box1; add: box2; vertical.

	v := RTView new.
	v add: combo element. 
	
	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 2.
	
	firstShape := v canvas shapes first.
	secondShape := v canvas shapes second.
	self assert: firstShape position x equals: secondShape position x.
	self assert: firstShape position y < secondShape position y.

	self assert: (v canvas shapes collect: [ :s | s encompassingRectangle extent ]) asSet size equals: 1
]

{ #category : #tests }
RTCompositeShapeTest >> testAttachPoint [

	| c l head attachPoint |
	c := RTCompositeShape new.
	l := RTLine new.
	c add: l.
	head := RTSimpleArrowHead new.
	c add: head.
	attachPoint := RTHorizontalAttachPoint instance.
	c attachPoint: attachPoint.
	self assert: l attachPoint equals: attachPoint.
	self assert: head attachPoint equals: attachPoint.
]

{ #category : #tests }
RTCompositeShapeTest >> testCallbacks [

	| compo ellipse v shapes |
	compo := ((RTBox new size: 50; color: Color red; yourself) + RTBox new) element.
	ellipse := RTEllipse new size: 20; color: Color blue; element.
	"compo will have two callbacks after the call to stick:below:"
	TRConstraint stick: ellipse below: compo.
	v := RTView new.
	v add: compo; add: ellipse.

	self assert: ellipse trachelShape numberOfCallbacks equals: 0.
	self assert: compo trachelShape numberOfCallbacks equals: 2.
	
	shapes := compo trachelShape shapes.
	self assert: shapes first numberOfCallbacks equals: 2
]

{ #category : #tests }
RTCompositeShapeTest >> testCallbacks02 [

	| compo ellipse v |
	compo := ((RTBox new size: 50; color: Color red; yourself)) element.
	ellipse := RTEllipse new size: 20; color: Color blue; element.
	"compo will have two callbacks after the call to stick:below:"
	TRConstraint stick: ellipse below: compo.
	v := RTView new.
	v add: compo; add: ellipse.

	self assert: ellipse trachelShape numberOfCallbacks equals: 0.
	self assert: compo trachelShape numberOfCallbacks equals: 2.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenter [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).

	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	
	self assert: es first position equals: 0 @ 0.
	self assert: es second position equals: 0 @ 0.
	self assert: es third position equals: 0 @ 0.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenter2 [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape horizontal.
	
	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	
	"Ideally, we should have 0 @ 0"
	self assert: es first position equals: 50 @ 0.
	self assert: es second position equals: 25 @ 0.
	self assert: es third position equals: 0 @ 0.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenter2AndTranslation [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape horizontal.
	
	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	es translateTo: 10 @ 10.
	
	self assert: es first position equals: 35 @ 10.
	self assert: es second position equals: 10 @ 10.
	self assert: es third position equals: -15 @ 10.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenter3 [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape vertical.
	
	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	
	self assert: es first position equals: 0 @ 5.
	self assert: es second position equals: 0 @ 5.
	self assert: es third position equals: 0 @ 5.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenter3AndTranslation [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape vertical.
	
	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	es translateTo: 10 @ 10.
	
	self assert: es first position equals: 10 @ 10.
	self assert: es second position equals: 10 @ 10.
	self assert: es third position equals: 10 @ 10.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenterAndTranslation [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).

	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	es translateTo: 10 @ 10.
	
	self assert: es first position equals: 10 @ 10.
	self assert: es second position equals: 10 @ 10.
	self assert: es third position equals: 10 @ 10.

]

{ #category : #centering }
RTCompositeShapeTest >> testCenterVerticalLineLayout [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape horizontal.
	
	es := shape elementsOn: #(0 50 100).
	v addAll: es.
	RTVerticalLineLayout on: es.

	self assert: es second width equals: 100.0.
	
	self assert: (es collect: [ :e | e width ]) asArray equals: #(100 100 100).
	self assert: (es collect: [ :e | e position x ]) asArray equals: #(50 50 50).
	
	self assert: es first trachelShape shapes first encompassingRectangle  equals: ( (0.0@0.0) corner: (0.0@10.0)).
	self assert: es first trachelShape shapes second encompassingRectangle  equals: ( (0.0@0.0) corner: (100.0@10.0)).
	
	self assert: es second trachelShape shapes first encompassingRectangle equals: ( (0.0@20.0) corner: (50.0@30.0)).
	self assert: es second trachelShape shapes second encompassingRectangle  equals: ( (50.0@20.0) corner: (100.0@30.0)).
	
	self assert: es third trachelShape shapes first encompassingRectangle equals: ( (0.0@40.0) corner: (100.0@50.0)).
	self assert: es third trachelShape shapes second encompassingRectangle equals: ( (100.0@40.0) corner: (100.0@50.0)).
]

{ #category : #centering }
RTCompositeShapeTest >> testCenterVerticalLineLayout2 [
	| v es shape |
	v := RTView new. 
	shape := RTCompositeShape new.
	shape add: (RTBox new height: 10; color: Color green; width: #yourself).
	shape add: (RTBox new height: 10; color: Color red; width: [ :cc | 100 - cc ]).
	shape horizontal.
	
	es := shape elementsOn: #(0 100).
	v addAll: es.
	RTVerticalLineLayout on: es.
			
	self assert: es first trachelShape shapes first encompassingRectangle  equals: ( (0.0@0.0) corner: (0.0@10.0)).
	self assert: es first trachelShape shapes second encompassingRectangle  equals: ( (0.0@0.0) corner: (100.0@10.0)).
	
	self assert: es second trachelShape shapes first encompassingRectangle equals: ( (0.0@20.0) corner: (100.0@30.0)).
	self assert: es second trachelShape shapes second encompassingRectangle  equals: ( (100.0@20.0) corner: (100.0@30.0)).
	

]

{ #category : #tests }
RTCompositeShapeTest >> testHeightFor [

	| shape e |
	shape := RTCompositeShape new.
	shape allOfSameSizeWithPadding.
	shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
	shape add: (RTLabel new height: 30).
	shape height: 50.
	e := shape elementOn: 'hello'.
	"RTView new add: e; open"
	
	
]

{ #category : #tests }
RTCompositeShapeTest >> testRemoving [

	| s e v |
	s := RTCompositeShape new.
	s add: RTLabel new.
	s add: RTBox new.
	e := s element.
	
	v := RTView new.
	v add: e.
	self assert: v numberOfElements equals: 1.
	
	e remove.
	self assert: v numberOfElements equals: 0.
]

{ #category : #tests }
RTCompositeShapeTest >> testSimpleCompositionWithTranslation [

	| v c b |
	v := RTView new.
	c := RTCompositeShape new.
	c add: (RTBox new size: 10).
	c add: (RTEllipse new size: 10) translateBy: 5 @ 5.
	b := c element.
	b @ RTPopup.
	b translateBy: 5 @ 5.
	v add: b.
	self assert: v canvas shapes first position equals: 5 @ 5.
	self assert: v canvas shapes second position equals: 10 @ 10
]

{ #category : #tests }
RTCompositeShapeTest >> testSimpleCompositionWithTranslation02 [

	| v c b |
	v := RTView new.
	c := RTCompositeShape new.
	c add: (RTBox new size: 10).
	c add: (RTEllipse new size: 10).
	c vertical.
	b := c element.
	b @ RTPopup.
	b translateBy: 5 @ 5.
	v add: b.
	self assert: v canvas shapes first position equals: 5 @ 5.
	self assert: v canvas shapes second position equals: 5 @ 15
]

{ #category : #tests }
RTCompositeShapeTest >> testWidth [

	| c s1 s2 |
	c := RTCompositeShape new.
	s1 := RTBox new size: 5.
	s2 := RTBox new size: 9.
	c add: s1; add: s2.
	
	c width: 20.
	self assert: (s1 width rtValue: RTElement new) equals: 20.
	self assert: (s2 width rtValue: RTElement new) equals: 20.
]

{ #category : #tests }
RTCompositeShapeTest >> testWidthWithLabel [

	| c s1 s2 |
	c := RTCompositeShape new.
	s1 := RTBox new size: 5.
	s2 := RTLabel new.
	c add: s1; add: s2.
	
	c width: 20.
	self assert: (s1 width rtValue: RTElement new) equals: 20.
	
]
