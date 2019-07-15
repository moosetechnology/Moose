"
Simon is an electronic game that intensively use arcs:
http://en.wikipedia.org/wiki/Simon_(game)

A RTSimon is xxxxxxxxx.

"
Class {
	#name : #RTSimon,
	#superclass : #RTBuilder,
	#instVars : [
		'models'
	],
	#category : #'Roassal2-Builder-Simon'
}

{ #category : #initialization }
RTSimon >> initialize [
	super initialize.
	self initializeShapeBuilder.
	self initializeInteractionBuilder.
	models := OrderedCollection new
]

{ #category : #initialization }
RTSimon >> initializeInteractionBuilder [
	self interaction popup.
]

{ #category : #initialization }
RTSimon >> initializeShapeBuilder [
	self shape arc  
		outerAngle: [ :object | ((self models indexOf: object) - 1) * (360.0 / self models size) ] innerAngle: [ :object | 360.0 / self models size ];
		innerRadius: 50;
		externalRadius: 90;
		color: RTNIdentityNormalizer new
]

{ #category : #accessing }
RTSimon >> models [
	^ models
]

{ #category : #accessing }
RTSimon >> models: objects [
	| elements |
	self recordModels: objects.
	elements := shapeBuilder elementsOn: objects.
	interactionBuilder setUpElements: elements.
	view addAll: elements
]

{ #category : #'public-ui' }
RTSimon >> open [
	^ view canvas open
]

{ #category : #'as yet unclassified' }
RTSimon >> recordModels: objects [
	models addAll: objects
]
