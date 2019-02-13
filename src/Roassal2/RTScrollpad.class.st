"
add a scroll pad to the view
"
Class {
	#name : #RTScrollpad,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #'as yet unclassified' }
RTScrollpad >> addPadToview: aView [
	
	"add a scroll pad to the view"
	| b|
	b := RTScrollBarBuilder new.
	b view: aView.
	b scrollBarType: #isPad.
	b build.
]

{ #category : #'as yet unclassified' }
RTScrollpad >> initializeElement: aView [
	self addPadToview: aView
]
