"
This class is a bit of a hack. The problem is drag-and-droping an element updates the edges connected to that element. However, the edge update also refresh the color and the width. And this is problematic when you try to change the color and the width of the edge. Dragging an element makes the edge use the width and color set in the RTLine shape.

In the future, maybe in Roassal3, which mechanism will be removed.

-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

e1 := RTBox element.
e2 := RTBox element.
e1 @ RTDraggable.
e2 @ RTDraggable.
v add: e1; add: e2.
e1 translateBy: 10 @ 8.

v add: (RTLine edgeFrom: e1 to: e2).

v addMenu: 'do' callback: [ 
	v edges first @ RTMakeEdgeNotUpdatable.
	v edges first trachelShape color: Color red; width: 3. 
	
	v signalUpdate ].

v
-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTMakeEdgeNotUpdatable,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions-MorphingView'
}

{ #category : #hooks }
RTMakeEdgeNotUpdatable >> initializeElement: edge [
	edge shape 
		colorElement: [ :l | l trachelShape color ];
		width: [ :l | l trachelShape width ]
	
]
