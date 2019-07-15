"
A RTResizableTest is a test class for testing the behavior of RTResizable
"
Class {
	#name : #RTResizableTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Interactions-Resize-Tests'
}

{ #category : #tests }
RTResizableTest >> testBasic [

	| v g |
	v := RTView new.
	g := RTGroup new
		add: (RTBox new
			size: 100;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (RTRoundedBox new
			size: 50;
			borderRadius: 20;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (RTEllipse new
			width: 100;
			height: 30;
			borderColor: Color black;
			element);
		yourself.

	v addAll: g.

	RTGridLayout on: g.

	g @ RTDraggable.
	g @ RTResizable.

	v @ RTZoomableView.

]

{ #category : #tests }
RTResizableTest >> testSimpleExample [

	| v s e |
	v := RTView new.
	s := RTBox new color: Color blue; size: 20.
	e := s element.
	e @ RTResizable.
	v add: e.
	e announce: TRMouseClick new.
	e announce: (TRMouseDragging new step: 5 @ 5).
	e translateBy: 5 @ 5.
	
	"A bit strange this 'top'"
	RTResizable new lazyInitializeElement: e; basicCallbackFor: RTElement new corner: #top
]
