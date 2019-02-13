"
A RTTransitivelyHighlightable highlight all connected elements (either incoming or outgoing). Consider the following example:

	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: { 1 -> 2 . 2 -> 3 }.
	
	v elements @ RTPopup @ (RTTransitivelyHighlightable new focusOnIncomingElements; color: Color red).
	v
"
Class {
	#name : #RTTransitivelyHighlightable,
	#superclass : #RTHighlightable,
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTTransitivelyHighlightable >> getRelevantElementsFrom: someElements [
	"Return the transively closure of connected elements."
	| set |
	set := Set new.
	someElements do: [ :e | self getRelevantElementsFromSingle: e in: set ].
	^ set
]

{ #category : #actions }
RTTransitivelyHighlightable >> getRelevantElementsFromSingle: anElement in: set [
	"Private method"
	(set includes: anElement)
		ifTrue: [ ^ self ].
	set add: anElement.
	(self getConnectedElementsFrom: anElement)
		do: [ :e | self getRelevantElementsFromSingle: e in: set ]
]
