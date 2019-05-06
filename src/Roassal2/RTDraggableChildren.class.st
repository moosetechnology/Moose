"
A RTDraggableChildren makes an element draggable. When dragged, children of the elements are also being dragged.

Here is an example:
-=-=-=
| v es |
v := RTView new.
v @ RTDraggableView.

es := RTLabel elementsOn: (1 to: 40).
v addAll: es.
RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :aValue | aValue // 2 ].
RTClusterLayout on: es.
es @ RTDraggableChildren.
^ v
-=-=-=
"
Class {
	#name : #RTDraggableChildren,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #hooks }
RTDraggableChildren >> initializeElement: element [
	"This method is the main method called whenever the interaction is applied. It simply obtains the recursive children.
	Note that the interaction correctly handle cycles.
	
	In case the shift key is pressed, the interaction has no effect"
	
	| recursiveGetChildren dragElements |
	
	dragElements := nil.
	recursiveGetChildren := nil.
	
	recursiveGetChildren := [ :elem :ancestor|
		dragElements add: elem.
		elem outgoingEdges do: [ :edge |
			(edge to = ancestor) ifFalse: [
				recursiveGetChildren value: edge to value: ancestor].
			].
		].
	
	element when: TRMouseDragging do: [ :ev |
		| d |
		dragElements := Set new.
		ev shiftKeyPressed 
			ifTrue: [dragElements add: ev element]
			ifFalse: [recursiveGetChildren value: ev element value: ev element]. 
		ev signalUpdate.
		d := element view canvas camera distanceFromPixelToSpace: ev step.
		dragElements do: [ :e1 | e1 translateBy: d ].
		]
	
]
