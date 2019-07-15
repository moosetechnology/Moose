"
I am a new interaction to focus and zoom one element
"
Class {
	#name : #RTFocusElement,
	#superclass : #RTInteraction,
	#instVars : [
		'x',
		'y',
		'z',
		'animation'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #public }
RTFocusElement class >> animated [
	^ self new animated
]

{ #category : #public }
RTFocusElement >> animated [
	animation := true.
]

{ #category : #initialization }
RTFocusElement >> initialize [
	super initialize.
	animation := false.
]

{ #category : #hooks }
RTFocusElement >> initializeElement: element [
	element when: TRMouseDoubleClick do: [ :evt |
		| canvas |
		canvas := element view canvas.
		animation 
			ifTrue: [ RTFocusAnimation on: element ]
			ifFalse: [ 
				canvas camera focusOnCenterScaled: canvas extent "rec: element encompassingRectangle".
				evt signalUpdate ] ]. 
]
