Class {
	#name : #RTComposerTest,
	#superclass : #RTTest,
	#instVars : [
		'composer',
		'view'
	],
	#category : #'Roassal2-Builder-Composer'
}

{ #category : #running }
RTComposerTest >> setUp [
	super setUp.
	composer := RTComposer new.
	view := composer view
]

{ #category : #tests }
RTComposerTest >> testAbove [
	| e1 e2 |
	e1 := RTBox element.
	view add: e1.
	composer group: #first.
	self assert: e1 position equals: (0 @ 0).

	e2 := RTBox element.
	view add: e2.
	composer group: #second. 
	composer move: #second above: #first.

	self assert: e1 position equals: (0 @ 0).	
	self assert: e1 position x equals: e2 position x.
	self assert: e2 position y equals: -25.0.
]

{ #category : #tests }
RTComposerTest >> testBackground [
	| compo b group1 group2 |
	compo := RTComposer new.
	b := RTMondrian new.
	b view: compo view.
	group1 := b nodes: (1 to: 3).
	b build.
	compo group: #g1.
	b := RTMondrian new.
	b view: compo view.
	group2 := b nodes: (1 to: 4).
	b build.
	compo group: #g2.
	compo layout: RTVerticalLineLayout new alignCenter.
	self assert: group1 center equals: 25 @ 3.
	self assert: group2 center equals: 25 @ 18.
	compo setBackgroundColor: Color red forGroup: #g1.
	self assert: group1 center equals: 25 @ 3.
	self assert: group2 center equals: 25 @ 18
]

{ #category : #tests }
RTComposerTest >> testBelow [
	| e1 e2 |
	e1 := RTBox element.
	view add: e1.
	composer group: #first.
	self assert: e1 position equals: (0 @ 0).

	e2 := RTBox element.
	view add: e2.
	composer group: #second. 
	composer move: #second below: #first.

	self assert: e1 position equals: (0 @ 0).	
	self assert: e1 position x equals: e2 position x.
	self assert: e2 position y equals: 25.0.
]

{ #category : #tests }
RTComposerTest >> testGap [
	composer gap: 30.
	self assert: composer gap equals: 30
]

{ #category : #tests }
RTComposerTest >> testGroup [

	| e |
	self assert: composer newElementsAsGroup isEmpty.
	self assert: composer allGroupedElements isEmpty.
	self assert: composer currentElementsAsGroup isEmpty.
	e := RTEllipse element.
	composer view add: e.
	
	self assert: composer allGroupedElements isEmpty.
	self assert: composer currentElementsAsGroup asArray equals: (Array with: e).
	"self assert: composer newElementsAsGroup asArray equals: (Array with: e)."
	composer group: #first.
		
	self assert: composer newElementsAsGroup isEmpty.
	self assert: composer allGroupedElements asArray equals: (Array with: e). 
]

{ #category : #tests }
RTComposerTest >> testGroup02 [

	| e |
	self assert: composer newElementsAsGroup isEmpty.
	self assert: composer allGroupedElements isEmpty.
	self assert: composer currentElementsAsGroup isEmpty.
	e := RTEllipse element.
	composer view add: e.
	
	self assert: composer allGroupedElements isEmpty.
	self assert: composer currentElementsAsGroup asArray equals: (Array with: e).
	"self assert: composer newElementsAsGroup asArray equals: (Array with: e)."
	composer group.
		
	self assert: composer newElementsAsGroup isEmpty.
	self assert: composer allGroupedElements asArray equals: (Array with: e). 
]

{ #category : #tests }
RTComposerTest >> testOnTheLeftOf [
	| e1 e2 |
	e1 := RTBox element.
	view add: e1.
	composer group: #first.
	self assert: e1 position equals: (0 @ 0).

	e2 := RTBox element.
	view add: e2.
	composer group: #second. 
	composer move: #second onTheLeftOf: #first.

	self assert: e1 position equals: (0 @ 0).	
	self assert: e1 position y equals: e2 position y.
	self assert: e2 position x equals: -25.5.
]

{ #category : #tests }
RTComposerTest >> testOnTheRightBelow [
	| e1 e2 |
	e1 := RTBox element.
	view add: e1.
	composer group: #first.
	self assert: e1 position equals: (0 @ 0).

	e2 := RTBox element.
	view add: e2.
	composer group: #second. 
	composer move: #second onTheRightBelowOf: #first.

	self assert: e1 position equals: (0 @ 0).	
	self assert: e2 position equals: (5.5 @ 25.5)
]

{ #category : #tests }
RTComposerTest >> testOnTheRightOf [
	| e1 e2 |
	e1 := RTBox element.
	view add: e1.
	composer group: #first.
	self assert: e1 position equals: (0 @ 0).

	e2 := RTBox element.
	view add: e2.
	composer group: #second. 
	composer move: #second onTheRightOf: #first.

	self assert: e1 position equals: (0 @ 0).	
	self assert: e1 position y equals: e2 position y.
	self assert: e2 position x equals: 25.
]

{ #category : #tests }
RTComposerTest >> testPropagate [

	| classesToAnalyze c b2 ds es |
	classesToAnalyze := TRShape withAllSubclasses.
	c := RTComposer new.
	c gap: 35.

	"-------"
	b2 := RTGrapher new.
	b2 view: c view.
	b2 extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: #(1 2 3).
	b2 add: ds.
	b2 build.
	c group: #stat.

	"-------"

	b2 := RTGrapher new.
	b2 view: c view.
	b2 extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: #(1 2 3).
	b2 add: ds.
	b2 build.
	c group: #pie.

	"-------"
	c layout: RTGridLayout new.
	c propagateHighlightToAll.

	es := c view elementsFromModel: 1.
	self assert: es size equals: 2.
	self assert: (es collect: [ :e | e position y ]) asSet size equals: 1
]

{ #category : #tests }
RTComposerTest >> testPropagateHighlight [

	| e1 e2 e3 |
	e1 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e1.
	composer group: #first.
	
	e2 := (RTEllipse new color: Color gray) elementOn: 1.
	composer view add: e2.
	composer group: #second.
	
	e3 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e3.
	composer group: #third.
	
	composer propagateHighlightToAll.
	composer move: #second onTheRightOf: #first.
	composer move: #third onTheRightOf: #second.
	
	e1 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e1 announce: TRMouseLeave.
	
	self assert: e1 trachelShape color == Color gray.
	self assert: e2 trachelShape color == Color gray.
	self assert: e3 trachelShape color == Color gray.

	e3 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e3 announce: TRMouseLeave.

	e2 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e2 announce: TRMouseLeave.

]

{ #category : #tests }
RTComposerTest >> testPropagateHighlightToAll [

	| e1 e2 e3 |
	e1 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e1. 
	composer group: #first.
	
	e2 := (RTEllipse new color: Color gray) elementOn: 1.
	composer view add: e2.
	composer group: #second.
	
	e3 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e3.
	composer group: #third.
	
	
	composer move: #second onTheRightOf: #first.
	composer move: #third onTheRightOf: #second.
	
	composer propagateHighlightToAll.
	
	e1 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e1 announce: TRMouseLeave.
	
	self assert: e1 trachelShape color == Color gray.
	self assert: e2 trachelShape color == Color gray.
	self assert: e3 trachelShape color == Color gray.

	e3 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e3 announce: TRMouseLeave.

	e2 announce: TRMouseEnter.
	self assert: e1 trachelShape color ~~ Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color ~~ Color gray.
	e2 announce: TRMouseLeave.

]

{ #category : #tests }
RTComposerTest >> testView [
	self assert: composer view equals: view.
	view := RTView new.
	composer view: view. 
	self assert: composer view equals: view.
]

{ #category : #tests }
RTComposerTest >> testopeningEmpty [

	composer open delete.
	self assert: composer gap > 0
]

{ #category : #tests }
RTComposerTest >> testpropagateHighlightUsing [

	| e1 e2 e3 |
	e1 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e1. 
	composer group: #first.
	
	e2 := (RTEllipse new color: Color gray) elementOn: 1.
	composer view add: e2.
	composer group: #second.
	
	e3 := (RTBox new color: Color gray) elementOn: 1.
	composer view add: e3.
	composer group: #third.
	
	composer move: #second onTheRightOf: #first.
	composer move: #third onTheRightOf: #second.
	
	composer propagateHighlightUsing: [ :element | Array with: e2 ].
	
	e1 announce: TRMouseEnter.
	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color equals: Color gray.
	e1 announce: TRMouseLeave.
	
	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color equals: Color gray.
	self assert: e3 trachelShape color equals: Color gray.

	e3 announce: TRMouseEnter.
	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color equals: Color gray.
	e3 announce: TRMouseLeave.

	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color equals: Color gray.
	self assert: e3 trachelShape color equals: Color gray.

	e2 announce: TRMouseEnter.
	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color ~~ Color gray.
	self assert: e3 trachelShape color equals: Color gray.
	e2 announce: TRMouseLeave.
	
	self assert: e1 trachelShape color equals: Color gray.
	self assert: e2 trachelShape color equals: Color gray.
	self assert: e3 trachelShape color equals: Color gray.


]
