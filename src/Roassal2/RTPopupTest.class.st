"
A ROAbstractPopupTest is xxxxxxxxx.

Instance Variables
	popup:		<Object>
	view:		<Object>

popup
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #RTPopupTest,
	#superclass : #RTTest,
	#instVars : [
		'view',
		'popup'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTPopupTest >> setUp [
	super setUp.
	view := RTView new.
]

{ #category : #running }
RTPopupTest >> tearDown [

	RTAbstractPopup withAllSubclassesDo: [ :c | c resetLastPopup ]
]

{ #category : #tests }
RTPopupTest >> test [
	| el |
	el := RTElement on: 123.
	el + RTBox.
	el @ RTPopup.

	view add: el.	

	self assert: el view == view.
	
	self assert: view numberOfElements = 1.
	el announce: TRMouseEnter.
	self assert: view numberOfElements = 3.
	el announce: TRMouseLeave.
	self assert: view numberOfElements = 1.
]

{ #category : #tests }
RTPopupTest >> testBackgroundColor [

	| v e background |
	v := RTView new.
	e := RTBox elementOn: 'Hello'.
	e @ (RTPopup new backgroundColor: Color red).
	v add: e.
	self assert: v numberOfElements equals: 1.
	
	e announce: TRMouseEnter new.
	self assert: v numberOfElements equals: 3.
	self assert: v canvas shapes size equals: 1.
	self assert: v canvas fixedShapes size equals: 2.
	
	background := v canvas fixedShapes first.
	self assert: background class equals: TRBoxShape.
]

{ #category : #tests }
RTPopupTest >> testBackgroundColor02 [
	self assert: (RTPopup new backgroundColor: Color red; backgroundColor) equals: Color red
]

{ #category : #tests }
RTPopupTest >> testBorderColor [

	self assert: (RTPopup new borderColor: Color red; borderColor) equals: Color red
]

{ #category : #tests }
RTPopupTest >> testHasBorder [

	self deny: RTPopup new hasBorder.
	self assert: (RTPopup new borderColor: Color black; hasBorder).
]

{ #category : #tests }
RTPopupTest >> testNamedBackgroundGroup [
	| v |
	v := RTView new.
	v addAll: (RTBox new elementsOn: (1 to: 100)).
	v elements
		@
			(RTPopup new
				namedBackground: Color black
				group: [ :group :element | 
					group
						add:
							(RTLabel new
								color: Color red;
								elementOn: 'x * x = ' , (element model * element model) asString);
						yourself ]).
	RTGridLayout on: v elements.
	v elements do: [ :el | el announce: TRMouseEnter new ]
]

{ #category : #tests }
RTPopupTest >> testPopup [

	| v es |
	v := RTView new.

	es := RTLabel elementsOn: (1 to: 10).

	v addAll: es.

	es @ (RTPopup new 
		named: #yourself
		background: Color blue
		group: [ :group :el |  
	 
			group addAll: (RTEllipse elementsOn: (1 to: el model)).
			RTWeightedCircleLayout new
				initialRadius: 50;
				on: group.
			]).

	RTHorizontalLineLayout on: es.
	
	es first announce: TRMouseEnter new
]

{ #category : #tests }
RTPopupTest >> testPopupView [
	| b |
	b := RTMondrian new.
	b interaction
		popupView: [ :group :el | 
			group addAll: (RTBox elementsOn: (1 to: 5)).
			RTGridLayout on: group ].
	b node: 42.
	b build.
	
	"No garbage collector happens"
	self assert: b view numberOfElements equals: 1.
	b view elements anyOne announce: TRMouseEnter.
	self assert: b view numberOfElements equals: 7.
	b view elements anyOne announce: TRMouseLeave.
	self assert: b view numberOfElements equals: 1.
	
	"We use the garbage collector"
	b view elements anyOne announce: TRMouseEnter.
	Smalltalk garbageCollect.
	RTPopup removeLastPopup.
	self assert: b view numberOfElements equals: 1.
]

{ #category : #tests }
RTPopupTest >> testPopupView02 [
	| b |
	b := RTMondrian new.
	"b interaction
		popupView: [ :group :el | 
			group addAll: (RTBox elementsOn: (1 to: 5)).
			RTGridLayout on: group ]."
	b node: 42.
	b build.
	
	"No garbage collector happens"
	self assert: b view numberOfElements equals: 1.
	b view elements anyOne announce: TRMouseEnter.
	self assert: b view numberOfElements equals: 3.
	b view elements anyOne announce: TRMouseLeave.
	self assert: b view numberOfElements equals: 1.
	
	"We use the garbage collector"
	b view elements anyOne announce: TRMouseEnter.
	Smalltalk garbageCollect.
	RTPopup removeLastPopup.
	self assert: b view numberOfElements equals: 1.
]

{ #category : #tests }
RTPopupTest >> testSimpleText [

	| v |
	v := RTView new.
	v addAll: (RTBox new elementsOn: (1 to: 100)).

	v elements @ (RTPopup new simpleText: [ :nb | 'hello ', nb asString ]).
	RTGridLayout on: v elements.
	
	v elements do: [ :el | el announce: TRMouseEnter new ].
	self assert: v elements size equals: 101.

]

{ #category : #tests }
RTPopupTest >> testTextColor [

	| v e label |
	v := RTView new.
	e := RTBox elementOn: 'Hello'.
	e @ (RTPopup new textColor: Color red).
	v add: e.
	self assert: v numberOfElements equals: 1.
	
	e announce: TRMouseEnter new.
	self assert: v numberOfElements equals: 3.
	self assert: v canvas shapes size equals: 1.
	self assert: v canvas fixedShapes size equals: 2.
	
	label := v canvas fixedShapes last.
	self assert: label class equals: TRLabelShape.
	self assert: label color equals: Color red.
]

{ #category : #tests }
RTPopupTest >> testTextColor02 [

	self assert: (RTPopup new textColor: Color red; textColor) equals: Color red
]

{ #category : #tests }
RTPopupTest >> testTextHeight [

	| v e |
	v := RTView new.
	e := RTBox elementOn: 'Hello'.
	e @ (RTPopup new textHeight: 30).
	v add: e.
	
	e announce: TRMouseEnter new.


]

{ #category : #tests }
RTPopupTest >> testTextHeight2 [

	self assert: (RTPopup new textHeight rtValue: 42) equals: RTPopup new defaultTextHeight.
	self assert: (RTPopup new textHeight rtValue: nil) equals: RTPopup new defaultTextHeight.

]

{ #category : #'multi lines' }
RTPopupTest >> testWithMultiLine [
	| v e p |
	v := RTView new.

	e := (RTBox new size: 40) elementOn: 'Hello
	World
	Bonjour
	Blah'.

	v add: e.

	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 0.

	p := RTPopup new.
	p createAndShowPopupFor: e event: TRMouseEnter new.
	
	self assert: v numberOfElements = 3.
	self assert: v canvas numberOfShapes = 1.
	self assert: v canvas numberOfFixedShapes = 5.

]

{ #category : #'multi lines' }
RTPopupTest >> testWithMultiLine02 [
	| v e  |
	v := RTView new.

	e := (RTBox new size: 40) elementOn: 'Hello
	World
	Bonjour
	Blah'.

	v add: e.
	e @ RTPopup.
	RTPopup resetLastPopup.
	
	"Entering"
	e announcer announce: TRMouseEnter new.
	self assert: v numberOfElements equals: 3.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 5.

	"Leaving"
	e announcer announce: TRMouseLeave new.
	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 0.

	
	
]

{ #category : #'multi lines' }
RTPopupTest >> testWithMultiLine03 [
	| v e  p |
	v := RTView new.

	e := (RTBox new size: 40) elementOn: 'Hello
	World
	Bonjour
	Blah'.

	v add: e.
	e @ RTPopup.
	RTPopup resetLastPopup.
	
	"Entering"
	p := RTPopup new.
	p createAndShowPopupFor: e event: TRMouseEnter new.
	self assert: v numberOfElements equals: 3.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 5.

	"Leaving"
	p removeLastPopup.

	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 0.

	
	
]

{ #category : #'multi lines' }
RTPopupTest >> testWithMultiLine04 [
	| v e  p secondElement firstElement |
	v := RTView new.

	e := (RTBox new size: 40) elementOn: 'Hello
	World
	Bonjour
	Blah'.

	v add: e.
	e @ RTPopup.
	
	"Entering"
	p := RTPopup new.
	RTPopup resetLastPopup.
	p createAndShowPopupFor: e event: TRMouseEnter new.
	self assert: v numberOfElements equals: 3.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 5.

	"Leaving"
	firstElement := RTPopup lastPopup first.
	secondElement := RTPopup lastPopup second.
	self assert: secondElement shape class equals: RTLabel.
	self deny: secondElement isFixed.
	firstElement remove.
	secondElement remove.

	self assert: v numberOfElements equals: 1.
	self assert: v canvas numberOfShapes equals: 1.
	self assert: v canvas numberOfFixedShapes equals: 0.

	
	
]

{ #category : #tests }
RTPopupTest >> testWithOneLine [
	| v e p |
	v := RTView new.
	e := (RTBox new size: 40) elementOn: 'Hello'.
	v add: e.
	self assert: v numberOfElements = 1.
	self assert: v canvas numberOfShapes = 1.
	p := RTPopup new.
	RTPopup resetLastPopup.
	p createAndShowPopupFor: e event: TRMouseEnter new.
	self assert: v numberOfElements = 3.
	self assert: v canvas numberOfShapes = 1.
	self assert: v canvas numberOfFixedShapes = 2
]

{ #category : #tests }
RTPopupTest >> testWithSymbol [

	| v e p |
	v := RTView new.
	e := (RTBox new size: 40) elementOn: #symbol.
	v add: e.

	self assert: v numberOfElements = 1.
	self assert: v canvas numberOfShapes = 1.

	p := RTPopup new.
	p createAndShowPopupFor: e event: TRMouseEnter new.
	
	self assert: v numberOfElements = 3.
	self assert: v canvas numberOfShapes = 1.
	self assert: v canvas numberOfFixedShapes = 2.

]
