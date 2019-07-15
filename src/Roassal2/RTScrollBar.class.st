"
add a simple scroll bar to the view
"
Class {
	#name : #RTScrollBar,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #'as yet unclassified' }
RTScrollBar >> addScrollToview: aView [
	
	"add a scroll bar to the view"
	| b|
	b := RTScrollBarBuilder new.
	b view: aView.
	b build.
]

{ #category : #'as yet unclassified' }
RTScrollBar >> initializeElement: aView [
	self addScrollToview: aView
]
