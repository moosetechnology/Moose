Class {
	#name : #RTLineDualWidthTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Shapes'
}

{ #category : #tests }
RTLineDualWidthTest >> testBasic [

   | view box e1 e2 l |
   view := RTView new.
    view @ RTDraggableView.
    box := RTBox new size: 20.
    e1 := box element.
    e2 := box element.
    e2 translateTo: 40 @ 20.
    l := RTLineDualWidth new
        widthFrom: [:edge | 2];
        widthTo: [:edge | 1];
        color: Color red trans;
        withShorterDistanceAttachPoint;
        yourself.
    e1 @ RTDraggable.
    e2 @ RTDraggable.
    view
        add: e1;
        add: e2;
        add: (l edgeFrom: e1 to: e2).
    view canvas buildMorph drawOnMockCanvas.

	e1 translateBy: 5 @ 5
]
