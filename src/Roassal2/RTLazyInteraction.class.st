"
I am an abstract interaction that postpones the element initialization until it is already connected to the view.
"
Class {
	#name : #RTLazyInteraction,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #hooks }
RTLazyInteraction >> initializeElement: anElement [
	"postpone initialization if the element is not yet added to the view"

	anElement view
		ifNil: [ anElement
				addCallback: (TRAddedCallback block: [ :evt | self lazyInitializeElement: anElement ]) ]
		ifNotNil: [ self lazyInitializeElement: anElement ]
]

{ #category : #initialization }
RTLazyInteraction >> lazyInitializeElement: anElement [
	self subclassResponsibility
]
