"
A RTSelectable is an interaction that allows for element contained in a view to be selected and having a callback whenever the selection is changed
"
Class {
	#name : #RTSelectable,
	#superclass : #RTClickStateInteraction,
	#instVars : [
		'selectionCallback'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTSelectable >> evaluateCallback: selectedElements [

	selectionCallback value: selectedElements
	
]

{ #category : #actions }
RTSelectable >> evaluateCallbackForElement: element [
	self evaluateCallback: (self selectedElementsFrom: element)
]

{ #category : #initialization }
RTSelectable >> initialize [
	super initialize.
	selectionCallback := [ :selectedElements | ]
]

{ #category : #testing }
RTSelectable >> isViewBeenPreparedForDeselection: aView [

	^ aView attributeAt: #preparedForDeselection ifAbsent: [ false ]
]

{ #category : #actions }
RTSelectable >> prepareViewBeenForDeselection: aView [
	"Make the view react when one click on the view. Element should be unselected"
	(self isViewBeenPreparedForDeselection: aView) 
		ifFalse: [
			aView when: TRMouseClick do: [ :evt | 
				aView elements do: [ :e | (self isSelected: e) ifTrue: [ self unselectNoCallback: e ] ].
				self evaluateCallback: RTGroup new.
				aView signalUpdate ] ]
]

{ #category : #actions }
RTSelectable >> select: element [
	element attributeAt: #oldColor put: element trachelShape color.
	element trachelShape color: Color red.
	self evaluateCallbackForElement: element.
	self prepareViewBeenForDeselection: element view
]

{ #category : #actions }
RTSelectable >> selectedElementsFrom: element [
	^ element view elements select: [ :e | e attributeAt: #isSelected ifAbsent: [ false ] ]
]

{ #category : #accessing }
RTSelectable >> selectionCallback [
	^ selectionCallback
]

{ #category : #accessing }
RTSelectable >> selectionCallback: aOneArgBlock [
	"aOneArgBlock will be evaluated at each selection. 
	The collection of selected elements is provided to the block"
	selectionCallback := aOneArgBlock
]

{ #category : #actions }
RTSelectable >> unselect: element [
	self unselectNoCallback: element.
	self evaluateCallbackForElement: element
]

{ #category : #actions }
RTSelectable >> unselectNoCallback: element [
	element trachelShape color: (element attributeAt: #oldColor).
	self markAsUnselected: element
]
