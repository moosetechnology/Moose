"
add an horizontal and vertical scrollbar to the view, on the border of the view
"
Class {
	#name : #RTDoubleScrollBar,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #adding }
RTDoubleScrollBar >> addScrollsToview: aView [
	
	"add two scroll bars to the view"
	| b2 b3 |
	
	b2 := RTScrollBarBuilder new.
	b2 view: aView.
	b2 orientation: #vertical.
	b2 fixedPosition: [ :v | (v view canvas extent x - ((v width /2))@(v view canvas extent y /2)) ].
	b2 movable: #isFixed.
	b2 size: [ :v | v view canvas extent y ].
	b2 barShape: #aBox.
	b2 barSpecific: #scalable.
	b2 build.

	b3 := RTScrollBarBuilder new.
	b3 view: aView.
	b3 fixedPosition: [ :v | (v view canvas extent x / 2)@(v view canvas extent y - (v width /2))].
	b3 movable: #isFixed.
	b3 size: [ :v | v view canvas extent x].
	b3 barShape: #aBox.
	b3 barSpecific: #scalable.
	b3 build.

]

{ #category : #hooks }
RTDoubleScrollBar >> initializeElement: aView [
	self addScrollsToview: aView
]
