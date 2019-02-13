Class {
	#name : #RTOrderedCollection,
	#superclass : #OrderedCollection,
	#instVars : [
		'addCallback',
		'viewToUpdate',
		'shapeBuilder',
		'interactionBuilder',
		'layoutBuilder'
	],
	#category : #'Roassal2-Utility'
}

{ #category : #adding }
RTOrderedCollection >> addAllLast: aCollection [ 
	"Add each element of aCollection at the end of the receiver. 
	Answer aCollection."

	| es |
	aCollection do: [:each | super addLast: each].

	aCollection do: [ :obj | addCallback rtValue: obj ].
	
	es := self shape elementsOn: aCollection.
	self interaction setUpElements: es.
	self layout setUpElements: es.
	viewToUpdate addAll: es.
	self updateView.
	^ aCollection
]

{ #category : #adding }
RTOrderedCollection >> addLast: object [
	| r |
	r := super addLast: object.
	addCallback rtValue: object.
	^ r
]

{ #category : #accessing }
RTOrderedCollection >> at: index put: object [
	| r |
	r := super at: index put: object.
	addCallback rtValue: object.
	^ r
]

{ #category : #accessing }
RTOrderedCollection >> interaction [
	interactionBuilder ifNil: [ interactionBuilder := RTInteractionBuilder new ].
	^ interactionBuilder
]

{ #category : #accessing }
RTOrderedCollection >> layout [
	layoutBuilder ifNil: [ layoutBuilder := RTLayoutBuilder new ].
	^ layoutBuilder
]

{ #category : #accessing }
RTOrderedCollection >> shape [
	shapeBuilder ifNil: [ shapeBuilder := RTShapeBuilder new ].
	^ shapeBuilder
]

{ #category : #callbacks }
RTOrderedCollection >> updateView [
	
	viewToUpdate ifNotNil: [ viewToUpdate signalUpdate ]
]

{ #category : #accessing }
RTOrderedCollection >> viewToUpdate [
	^ viewToUpdate
]

{ #category : #accessing }
RTOrderedCollection >> viewToUpdate: anObject [
	viewToUpdate := anObject
]

{ #category : #callbacks }
RTOrderedCollection >> whenAddingDo: aOneArgBlock [
	addCallback := aOneArgBlock
]
