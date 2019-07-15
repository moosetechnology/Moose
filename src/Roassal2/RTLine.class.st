"
RTLine describes a line between two elements.
-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

s := RTEllipse new color: (Color red alpha: 0.4); size: 30.
e1 := s elementOn: 'Begin'.
e2 := s elementOn: 'End'.
edge := RTLine edgeFrom: e1 to: e2.

v add: e1; add: e2; add: edge.

e1 @ RTDraggable.
e2 @ RTDraggable.

e2 translateBy: 80 @ 50.

v 
-=-=-=-=-=-=-=-=-=-=-=-=

Using an attach point:
-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

s := RTEllipse new color: (Color red alpha: 0.4); size: 30.
e1 := s elementOn: 'Begin'.
e2 := s elementOn: 'End'.

lineShape := RTLine new.
lineShape attachPoint: (RTShorterDistanceAttachPoint instance).
edge := lineShape edgeFrom: e1 to: e2.

v add: e1; add: e2; add: edge.

e1 @ RTDraggable.
e2 @ RTDraggable.

e2 translateBy: 80 @ 50.

v 
-=-=-=-=-=-=-=-=-=-=-=-=

Slightly more sophisticated example:
-=-=--=-=-=--=-=-=--=
	| view elements |
	view := RTView new.	
	elements := RTBox elementsOn: (1 to: 100).
	elements @ RTDraggable.
	view addAll: elements.
	RTEdge 
		buildEdgesFromObjects: (1 to: 100)
		from: [ :v | v // 2 ] to: #yourself 
		using: (RTLine new color: Color purple) inView: view.
	RTTreeLayout on: view elements edges: view edges.
	
	view edges do: [ :e | e trachelShape pushBack ].
	
	view @ RTDraggableView.

	^ view
-=-=--=-=-=--=-=-=--=
"
Class {
	#name : #RTLine,
	#superclass : #RTAbstractLine,
	#category : #'Roassal2-Shapes'
}

{ #category : #hooks }
RTLine >> trachelShapeClass [
	^ TRLineShape

]
