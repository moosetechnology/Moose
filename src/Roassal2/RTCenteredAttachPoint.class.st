"
Make the line start and ends from the center of the element.
This is the default attach point for lines.  Consider the following example:
[[[
v := RTView new.
es := (RTEllipse new size: 40) elementsOn: #(1 2).
es second translateBy: 100 @ 100.
es @ RTDraggable.
v addAll: es.
lineShape := RTLine new color: Color blue.
lineShape attachPoint: (RTCenteredAttachPoint instance).
v add: (lineShape edgeFrom: es first to: es second).
v
]]]
"
Class {
	#name : #RTCenteredAttachPoint,
	#superclass : #RTAttachPoint,
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'public - hooks' }
RTCenteredAttachPoint >> basicEndingPointOf: anEdge [
	^ anEdge to position
]

{ #category : #'public - hooks' }
RTCenteredAttachPoint >> basicStartingPointOf: anEdge [
	^ anEdge from position
]
