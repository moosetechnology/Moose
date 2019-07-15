Class {
	#name : #RTDragAndDroppable,
	#superclass : #RTInteraction,
	#instVars : [
		'hosts',
		'doBlock',
		'elementBeingDragged'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTDragAndDroppable >> blinkElement: element [
	element when: TRMouseDragging do: [ :evt | 
		RTBlink on: element. 
		elementBeingDragged := element ]

]

{ #category : #enumerating }
RTDragAndDroppable >> do: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [:fromElement :toElement | ... ]"
	doBlock := aTwoArgBlock
]

{ #category : #accessing }
RTDragAndDroppable >> host: anElement [
	hosts add: anElement
]

{ #category : #initialization }
RTDragAndDroppable >> initialize [
	super initialize.
	hosts := OrderedCollection new.
	elementBeingDragged := nil.
	doBlock := [:fromElement :toElement | "do nothing" ]
]

{ #category : #hooks }
RTDragAndDroppable >> initializeElement: element [
	self blinkElement: element.
	self prepareElementForDND: element
	
]

{ #category : #accessing }
RTDragAndDroppable >> numberOfHosts [
	"Return the number of possible hosts (i.e., Roassal element thay may receive the element on which the interaction is added to)"
	^ hosts size
]

{ #category : #initialization }
RTDragAndDroppable >> prepareElementForDND: anElement [
	anElement when: TRMouseDragEnd do: [ :evt | 
		| receivingElement underShape |
		underShape := anElement view canvas shapeForPositionInPixels: evt position.
		underShape class == TRCanvas ifFalse: [ 
			receivingElement := underShape element.

			(hosts includes: receivingElement)
				ifTrue: [doBlock value: elementBeingDragged value: receivingElement ] ] ]
]
