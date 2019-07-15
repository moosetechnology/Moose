Class {
	#name : #RTElementTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTElementTest >> testAddingABoxAndEllipse [

	| view el1 el2 |
	view := RTView new.
	el1 := (RTBox new extent: 40 @ 20; color: Color purple) element.
	el1 translateTo: 50 @ 40.
	el2 := (RTEllipse new extent: 40 @ 20; color: Color blue) element.
	el2 translateTo: 150 @ 40.
	view add: el1; add: el2.
	
	self assert: el1 position = (50 @ 40).
	self assert: el1 encompassingRectangle = ((30@30) corner: (70@50))
]

{ #category : #view }
RTElementTest >> testAddingAndRemoving [

	| view e tr |
	view := RTView new.
	tr := view canvas.
	e := RTBox element.
	
	self assert: e view isNil.
	self assert: tr numberOfShapes = 0.
	view add: e.
	self assert: e view == view.
	self assert: tr numberOfShapes = 1.
	
	e remove.
	self assert: view numberOfElements = 0.
	self assert: tr numberOfShapes = 0.
	self assert: e view isNil.
]

{ #category : #events }
RTElementTest >> testAddingInteraction [

	| e |
	e := RTElement new.
	e @ RTDraggable.
	self assert: e announcer numberOfSubscriptions equals: 1.
	e @ RTPopup.
	self assert: e announcer numberOfSubscriptions equals: 5.
]

{ #category : #attributes }
RTElementTest >> testAttributes [
	| el |
	el := RTElement new.
	self deny: el hasAttributes.
	self assert: (el hasNotAttribute: #oldColor).
	el attributes at: #oldColor put: Color black.
	self assert: el hasAttributes.
	self deny: (el hasNotAttribute: #oldColor).
	

]

{ #category : #events }
RTElementTest >> testBasicEvent [
	self assert: RTElement new announcer numberOfSubscriptions equals: 0.
]

{ #category : #'composite shape' }
RTElementTest >> testCompositeShape [

	| s e |
	s := RTCompositeShape new.
	s add: RTBox new.
	e := s element.
	
	e update
]

{ #category : #tests }
RTElementTest >> testConnectedEdges01 [

	| e1 e2 l |
	e1 := RTBox element.
	e2 := RTBox element.
	self deny: (e1 isConnectedTo: e2).
	self deny: (e2 isConnectedTo: e1).
	
	l := RTLine edgeFrom: e1 to: e2.
	self assert: (e1 isConnectedTo: e2).
	self assert: (e2 isConnectedTo: e1).

	self assert: (e1 isDirectlyConnectedTo: e2).
	self deny: (e2 isDirectlyConnectedTo: e1).

]

{ #category : #creating }
RTElementTest >> testCreatingMany [
	| els |
	els := RTBox elementsOn: (1 to: 20).
	self assert: els size = 20.
	self assert: (els collect: #model) asArray = (1 to: 20) asArray.
]

{ #category : #tests }
RTElementTest >> testDefault [
	| el |
	el := RTElement new.
	self assert: el position = (0 @ 0).
	"self assert: el width = 0.
	self assert: el height = 0."
]

{ #category : #interaction }
RTElementTest >> testDraggingCircle [

	| view shape el |
	view := RTView new.
	shape := RTEllipse new size: 40.
	el := shape element.
	view add: el.
	view setUpCanvas.
	
	self assert: el position = (0 @ 0).
	el translateBy: 100 @ 50.
	self assert: el position = (100 @ 50).
	
	self assert: el trachelShape encompassingRectangle = ((80@30) corner: (120@70))
]

{ #category : #tests }
RTElementTest >> testExtentAndWidthHeight [

	| shape |
	shape := RTBox new extent: 40 @ 20.
	self assert: (shape widthFor: RTElement new) = 40.
	self assert: (shape heightFor: RTElement new) = 20.
]

{ #category : #interaction }
RTElementTest >> testGrowing [

	| view el |
	view := RTView new.
	el := RTBox new size: 20; color: (Color purple alpha: 0.2); element.
	el @ RTDraggable.
	el translateTo: 100 @ 130.
	view add: el.
	
	
]

{ #category : #interaction }
RTElementTest >> testHighlighting [
	| el view |
	el := RTBox element.
	view := RTView new.
	view add: el.
	view setUpCanvas.
	
	self assert: el trachelShape color = RTBox new defaultColor.
	
	el trachelShape color: Color red.
	self assert: el trachelShape color = Color red.
]

{ #category : #edges }
RTElementTest >> testIsConnected [

	self deny: RTElement new isConnected.
	self assert: RTElement new isNotConnected.
]

{ #category : #edges }
RTElementTest >> testIsConnected02 [

	| e1 e2 l |
	e1 := RTBox element.
	e2 := RTBox element.
	
	l := RTLine edgeFrom: e1 to: e2.
	
	self assert: e1 isConnected.
	self assert: e2 isConnected.
	self deny: e1 isNotConnected.
	self deny: e2 isNotConnected.
]

{ #category : #edges }
RTElementTest >> testIsConnected03 [
	| e1 l |
	e1 := RTBox element.
	l := RTLine edgeFrom: e1 to: e1.	
	self assert: e1 isConnected.
	self deny: e1 isNotConnected.

]

{ #category : #tests }
RTElementTest >> testModel [
	self assert: (RTElement on: 10) model = 10
]

{ #category : #'nested elements' }
RTElementTest >> testNestedElements [

	self assert: RTElement new nestedElements equals: #()
]

{ #category : #'nested elements' }
RTElementTest >> testNestedElements2 [
	| nested e v |
	v := RTView new.
	e := RTBox element.
	v add: e.
	RTNest new
		for: (Array with: e) add: [ :group :model |
			nested := RTBox elementsOn: (1 to: 5).
			group addAll: nested
		].
	
	self assert: e nestedElements equals: nested
]

{ #category : #'nested elements' }
RTElementTest >> testNestedElements3 [
	| added v classShape es |
	added := RTGroup new.
	v := RTView new.
	v @ RTDraggableView.

	classShape := RTCompositeShape new. 
	classShape add: (RTLabel new).
	classShape add: (RTBox new color: Color lightGreen).
	classShape add: (RTBox new color: Color lightRed).
	classShape vertical.

	es := classShape elementsOn: (Array with: RTShape).
	v addAll: es.

	RTNest new
		layout: RTGridLayout new;
		for: es inShape: #second add: [ :group :model |
			group addAll: (RTBox elementsOn: model instVarNames).
			added addAll: group
		].

	RTNest new
		layout: RTGridLayout new;
		for: es inShape: #third add: [ :group :model |
			group addAll: (RTBox elementsOn: model rtmethods).
			added addAll: group
		].
	
	self assert: es first nestedElements equals: added
]

{ #category : #popup }
RTElementTest >> testPlatformPopup [
	| v el   |
	v := RTView new.
	
	RTPlatformPopup removeLastPopup.
	el := (RTBox new size: 20) element.
	el @ (RTPlatformPopup).
	v add: el.
	v canvas buildMorph.
	self assert: v numberOfElements equals: 1.
	self assert: RTPlatformPopup lastPopup isNil.
	el announce: (TRMouseEnter new position: 0 @ 0; shape: el trachelShape).
	self assert: v numberOfElements equals: 1.
	self assert: RTPlatformPopup lastPopup notNil.
	
]

{ #category : #popup }
RTElementTest >> testPopupAndGroup [
	| v el p es |
	v := RTView new.
	el := (RTBox new size: 20) element.

	p := [ :g :e |  
		es := (RTBox new size: 15; color: (Color red alpha: 0.5)) elementsOn: (1 to: 10).
		RTGridLayout on: es.
		g addAll: es ].

	el @ (RTPopup new group: p).
	v add: el.
	
	self assert: v numberOfElements equals: 1.
	el announce: (TRMouseEnter new position: 0 @ 0; shape: el trachelShape).
	self assert: v numberOfElements equals: 11.

	self assert: v canvas fixedShapes first position asIntegerPoint = (22@22)
	
]

{ #category : #position }
RTElementTest >> testPosition [

	| el |
	el := RTBox element.
	el translateTo: 1.1234 @ 1.1234.
	self assert: el position = (1.1234 @ 1.1234). 
]

{ #category : #tests }
RTElementTest >> testRemoveWithEdges [

	| view e1 e2 l1 l2 |
	view := RTView new.
	e1 := RTBox element.
	e2 := RTBox element.
	l1 := RTLine edgeFrom: e1 to: e2.
	l2 := RTLine edgeFrom: e2 to: e1.
	view add: l1; add: l2; add: e1; add: e2.
	
	e1 remove.
	e2 remove.
]

{ #category : #events }
RTElementTest >> testRemovingEvent [

	| e |
	e := RTElement new.
	e @ RTDraggable.
	e @ RTPopup.
	e removeInteractionIfPresent: RTPopup.
	self assert: e announcer numberOfSubscriptions equals: 1.
]

{ #category : #removing }
RTElementTest >> testRemovingWithNested [
	| b |
	b := RTMondrian new.
	b node: 1 forIt: [ b node: 2 ].
	b build.
	self assert: b view numberOfElements equals: 2.
	(b view elementFromModel: 1) removeWithNestedElements.
	self assert: b view numberOfElements equals: 0.	
]

{ #category : #tests }
RTElementTest >> testRendering [

	| view el |
	view := RTView new.
	el := RTBox element.
	view add: el.
	
	self assert: el trachelShape notNil.
	self assert: el trachelShape class == TRBoxShape
]

{ #category : #tests }
RTElementTest >> testRenderingAndEvent [

	| view el trachelShape |
	view := RTView new.
	el := RTBox element.
	view add: el.
	view setUpCanvas.
	trachelShape := el trachelShape.
	self assert: el announcer == trachelShape announcer
]

{ #category : #tests }
RTElementTest >> testResizingAndDragging [

	| view box |
	view := RTView new.
	box := RTBox element.
	view add: box.
	view setUpCanvas.
	
	self assert: box extent = (5 @ 5).
	box trachelShape extent: 10 @ 10.
	self assert: box extent = (10 @ 10).

	box translateTo: 5 @ 5.
	self assert: box extent = (10 @ 10).
]

{ #category : #tests }
RTElementTest >> testSameNullShape [
	self assert: RTElement new shape == RTElement new shape.
	self assert: RTNoShape element shape == RTElement new shape.
]

{ #category : #events }
RTElementTest >> testSharedAnnouncer [

	| e v a |
	e := RTBox element.
	self assert: e announcer ~~ e trachelShape announcer.
	a := e announcer.
	
	v := RTView new.
	v add: e.
	self assert: e announcer == e trachelShape announcer.
	self assert: a == e trachelShape announcer
]

{ #category : #events }
RTElementTest >> testSharedAnnouncerAndComposedShapes [

	| e s1 s2 v |
	s1 := RTBox new.
	s2 := RTEllipse new.
	
	e := (s1 + s2) element.
	v := RTView new.
	v add: e.
	self assert: e announcer == e trachelShape shapes first announcer.
	self assert: e announcer == e trachelShape shapes second announcer.
	
]

{ #category : #tests }
RTElementTest >> testSize [
	| box el |
	box := RTBox new width: 10; height: 8.
	el := box element.
	
	self assert: el position = (0 @ 0).
	self assert: el height = 8.
	self assert: el width = 10
]

{ #category : #tests }
RTElementTest >> testSizeAndModel [
	| box el |
	box := RTBox new width: [ :e | e + 2 ]; height: [ :e | e + 3 ].
	el := box elementOn: 5.
	
	self assert: el position = (0 @ 0).
	self assert: el height = 8.
	self assert: el width = 7
]

{ #category : #view }
RTElementTest >> testTrachelShape [

	| e |
	e := RTBox element.
	self assert: e trachelShape ~~ e.
	self assert: e trachelShape class equals: TRBoxShape.
	
	self assert: e trachelShape trachelShape equals: e trachelShape.
	self assert: e trachelShape trachelShape trachelShape equals: e trachelShape.
]

{ #category : #tests }
RTElementTest >> testTrachelShape2 [

	self assert: RTElement new trachelShape notNil.
]

{ #category : #tests }
RTElementTest >> testTranslationBy [
	| el |
	el := RTBox element.
	el translateBy: 15 @ 10.
	self assert: el position = (15 @ 10).

	el translateBy: 5 @ 10.
	self assert: el position = (20 @ 20).

]

{ #category : #tests }
RTElementTest >> testTranslationTo [
	| el |
	el := RTBox element.
	el translateTo: 15 @ 10.
	self assert: el position = (15 @ 10)
]

{ #category : #creating }
RTElementTest >> testUpdateEdges [

	| e1 e2 l v |
	e1 := RTBox elementOn: 1.
	e2 := RTBox elementOn: 1.
	l := RTLine edgeFrom: e1 to: e2.
	v := RTView new.
	v add: e1; add: e2; add: l.
	
	e2 translateTo: 50 @ 50.
	
	self assert: l trachelShape from equals: 0 @ 0.
	self assert: l trachelShape to equals: 50 @ 50.

	e1 updateEdgesOFF.
	e1 translateTo: 10 @ 10.
	self assert: l trachelShape from equals: 0 @ 0.
	self assert: l trachelShape to equals: 50 @ 50.

]

{ #category : #creating }
RTElementTest >> testUpdateEdgesOnAndOff [

	| e |
	e := RTElement new.
	self assert: e shouldUpdateEdges.
	e updateEdgesOFF.
	self deny: e shouldUpdateEdges.
	e updateEdgesON.
	self assert: e shouldUpdateEdges.
]

{ #category : #tests }
RTElementTest >> testWidthAndHeight [

	| view outter inner |
	view := RTView new.
	outter := RTBox element.
	inner := (RTBox new color: Color green) element.
	RTNest new on: outter nest: (RTGroup with: inner).
	self assert: outter width = 15.
	self assert: outter height = 15.
	self assert: outter encompassingRectangle extent = (15 @ 15)
]

{ #category : #tests }
RTElementTest >> testWidthAndHeight2 [

	| view outter inners |
	view := RTView new.
	outter := RTBox element.
	inners := (RTBox new color: Color green) elementsOn: (1 to: 3).
	
	RTHorizontalLineLayout on: inners.
	RTNest new on: outter nest: inners.

	self assert: outter width = 45.
	self assert: outter height = 15.
	self assert: outter encompassingRectangle extent = (45 @ 15)
]
