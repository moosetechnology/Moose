"
A RTSpectrograph is a builder to create spectographs
"
Class {
	#name : #RTSpectrograph,
	#superclass : #RTBuilder,
	#instVars : [
		'objects',
		'lineBlock',
		'pointSize',
		'highlightBlock'
	],
	#category : #'Roassal2-Builder-Spectrograph'
}

{ #category : #hooks }
RTSpectrograph >> createShapeBuilder [
	^ super createShapeBuilder rectangle
]

{ #category : #hooks }
RTSpectrograph >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #util }
RTSpectrograph >> highlight: aBlockOrValue [
	^ self highlight: aBlockOrValue color: Color red
]

{ #category : #util }
RTSpectrograph >> highlight: aBlockOrValue color: aColor [
	shapeBuilder
		if: [ :v | aBlockOrValue value: v first value: v second ] fillColor: aColor.

]

{ #category : #initialization }
RTSpectrograph >> initialize [
	super initialize.
	title := ''
]

{ #category : #accessing }
RTSpectrograph >> lineBlock [
	^ lineBlock
]

{ #category : #accessing }
RTSpectrograph >> lineBlock: anObject [
	lineBlock := anObject
]

{ #category : #accessing }
RTSpectrograph >> objects [
	^ objects
]

{ #category : #accessing }
RTSpectrograph >> objects: anObject [
	objects := anObject
]

{ #category : #accessing }
RTSpectrograph >> pointSize: anObject [
	shapeBuilder current size: pointSize 
]

{ #category : #'as yet unclassified' }
RTSpectrograph >> popupText: aTwoArgBlock [

	self interaction popupText: [ :model | aTwoArgBlock value: model first value: model second ]
]

{ #category : #hooks }
RTSpectrograph >> renderIn: aView [

	| rowsOfElements es interaction |
	interaction := RTPopup new.
	rowsOfElements := OrderedCollection new.
	
	objects do: [ :o | 	
		es := shapeBuilder elementsOn: ((lineBlock rtValue: o) collect: [ :computedObject | (Array with: o with: computedObject ) ]).
		
		RTVerticalLineLayout new gapSize: 0; on: es.
		rowsOfElements add: es.
		aView addAll: es.
		interactionBuilder setUpElements: es
	].
	RTHorizontalLineLayout new alignBottom; gapSize: 0; on: rowsOfElements.
	self setTitleIfNecessary
	
	
]

{ #category : #util }
RTSpectrograph >> setTitleIfNecessary [
	"This method has to be called after having added the elements in the view"
	| label g |
	title ifEmpty: [ ^ self ].
	g := RTGroup withAll: view elements.
	label := (RTLabel new text: title) element.
	TRConstraint move: label below: g.
	view add: label
]
