Class {
	#name : #RTInteractionBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'builder'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #running }
RTInteractionBuilderTest >> setUp [
	super setUp.
	builder := RTInteractionBuilder new
]

{ #category : #tests }
RTInteractionBuilderTest >> testAddingAndRemovingInteraction [
	builder addInteraction: RTDraggable new.
	self assert: builder numberOfInteractions equals: 1.
	
	builder removeInteractionOfType: RTAbstractDraggable.
	self assert: builder numberOfInteractions equals: 0.
	
	builder addInteraction: RTConstrainedDraggable new.
	self assert: builder numberOfInteractions equals: 1.
	
	builder removeInteractionOfType: RTAbstractDraggable.
	self assert: builder numberOfInteractions equals: 0.

]

{ #category : #tests }
RTInteractionBuilderTest >> testAddingOneAction [
	builder action: #inspect.
	self assert: builder numberOfInteractions equals: 1
]

{ #category : #tests }
RTInteractionBuilderTest >> testAddingTwoActions [
	| e |
	builder action: #inspect; action: #browse.
	self assert: builder numberOfInteractions equals: 2.
	
	e := RTElement new.
	builder setUpElements: (Array with: e) asGroup.
	self assert: e announcer numberOfSubscriptions equals: 1.
	
]

{ #category : #tests }
RTInteractionBuilderTest >> testDefault [
	self assert: builder numberOfInteractions equals: 0
]

{ #category : #tests }
RTInteractionBuilderTest >> testDraggableAndSnapToGrid [
	builder snapToGrid.
	self assert: builder numberOfInteractions equals: 1
]

{ #category : #tests }
RTInteractionBuilderTest >> testDraggableAndSnapToGrid02 [
	builder draggable.
	builder snapToGrid.
	self assert: builder numberOfInteractions equals: 1
]

{ #category : #tests }
RTInteractionBuilderTest >> testMultipleDraggable [

	builder draggable; draggable.
	self assert: builder numberOfInteractions equals: 1.
]

{ #category : #tests }
RTInteractionBuilderTest >> testPopupTextColor [
	builder popupText: [ :v | 'My number is ', v printString ] color: Color blue.
	builder setUpElement: RTBox element.
]
