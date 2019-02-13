Class {
	#name : #RTClickStateInteraction,
	#superclass : #RTInteraction,
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTClickStateInteraction >> clickOn: element [
	(self isSelected: element)
		ifTrue: [ 
			self markAsUnselected: element.
			self unselect: element ]
		ifFalse: [ 
			self markASelected: element.
			self select: element ]
]

{ #category : #hooks }
RTClickStateInteraction >> initializeElement: element [
	element when: TRMouseClick do: [ :event | self clickOn: event element ]
]

{ #category : #testing }
RTClickStateInteraction >> isSelected: element [
	^ element attributeAt: #isSelected ifAbsent: [ false ]
]

{ #category : #actions }
RTClickStateInteraction >> markASelected: element [
	element attributeAt: #isSelected put: true
]

{ #category : #actions }
RTClickStateInteraction >> markAsUnselected: element [
	element attributeAt: #isSelected put: false
]

{ #category : #actions }
RTClickStateInteraction >> select: element [
	"Override to make it a meaningful"
]

{ #category : #actions }
RTClickStateInteraction >> unselect: element [
	"Override to make it a meaningful"
]
