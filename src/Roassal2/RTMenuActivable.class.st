"
A RTMenuActivable adds a menu to an element. The menu is activable by right-clicking on the node.

For example:

classes := RTObject withAllSubclasses.
v := RTView new.
v @ RTDraggableView.
n := RTMultiLinearColorForIdentity new objects: classes.
shape := RTEllipse new size: #numberOfMethods; color: n.
es := shape elementsOn: classes.
es @ (RTMenuActivable new action: #inspect; item: 'browse class' action: [ :e | e model browse ]).
v addAll: es.
RTFlowLayout on: es.
v

"
Class {
	#name : #RTMenuActivable,
	#superclass : #RTInteraction,
	#instVars : [
		'actions'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTMenuActivable class >> action: anAction [

	^ self item: anAction asString action: anAction
]

{ #category : #public }
RTMenuActivable class >> item: title action: action [
	^ self new item: title action: action
]

{ #category : #public }
RTMenuActivable >> action: aSymbol [
	^ self item: aSymbol asString action: aSymbol
]

{ #category : #initialization }
RTMenuActivable >> initialize [ 
	super initialize.
	actions := OrderedCollection new.
	
]

{ #category : #hooks }
RTMenuActivable >> initializeElement: element [

	| menuActivable |
	(element hasInteraction: self class) ifFalse: [ ^ self initializeFirstTimeElement: element ].
	
	menuActivable := element getInteractionForClass: self class.
	actions do: [ :assoc |
		menuActivable item: assoc key action: assoc value ]
]

{ #category : #hooks }
RTMenuActivable >> initializeFirstTimeElement: element [
	element when: TRMouseRightClick do: [ :event |
		TRUtil instance widgetFactory menuForAssociations: actions on: element
	]
]

{ #category : #public }
RTMenuActivable >> item: titleAsString action: aBlockOrSymbol [
	actions add: (titleAsString -> aBlockOrSymbol)
]
