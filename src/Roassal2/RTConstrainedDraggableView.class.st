"
I am a view interaction allowing horizontal translation.

In addition, I hold a block allowing constraints on the translations
"
Class {
	#name : #RTConstrainedDraggableView,
	#superclass : #RTAbstractDraggableView,
	#instVars : [
		'constraint'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'instance creation' }
RTConstrainedDraggableView class >> constraint: constraint [

	^ self new
		constraint: constraint;
		yourself
]

{ #category : #accessing }
RTConstrainedDraggableView >> constraint: aTwoArgBlock [
	"First arg = view to drag, and second arg = step"
	constraint := aTwoArgBlock
]

{ #category : #initialize }
RTConstrainedDraggableView >> initialize [
	super initialize.
	constraint := [ :aView :point | point ]
]

{ #category : #hooks }
RTConstrainedDraggableView >> initializeElement: aView [

	aView canvas 
		when: TRMouseDragging 
		do: [ :e |
			| translation |
			translation := constraint value: aView value: e step negated.
			aView canvas camera translateBy: translation / aView canvas camera scale.
			e signalUpdate ]
]
