"
I am interaction builder that provides some extra interactions specific for RTGrapher/RTData, such as dynamic decorators.
"
Class {
	#name : #RTDataInteractionBuilder,
	#superclass : #RTInteractionBuilder,
	#instVars : [
		'builder',
		'dataSet'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #accessing }
RTDataInteractionBuilder >> builder [
	^ builder ifNil: [ dataSet builder ]
]

{ #category : #accessing }
RTDataInteractionBuilder >> builder: aBuilder [
	builder := aBuilder
]

{ #category : #accessing }
RTDataInteractionBuilder >> dataSet: aData [
	dataSet := aData
]

{ #category : #'public - events-registering' }
RTDataInteractionBuilder >> highlightDataset: aColor [
	self
		addInteraction:
			(RTDataHighlightInteraction new
				color: aColor;
				dataset: dataSet)
]

{ #category : #'public - events-registering' }
RTDataInteractionBuilder >> popupDecorator: aOneArgBlock [
	| deco |
	self
		when: TRMouseEnter
		do: [ :event | 
			deco := aOneArgBlock value: event element model.
			deco hasDatasets
				ifFalse: [ deco dataset: dataSet ].
			self builder decorators add: deco.
			deco
				builder: self builder;
				render ].
	self
		when: TRMouseLeave
		do: [ :event | 
			deco remove.
			self builder decorators remove: deco ]
]

{ #category : #'public - events-registering' }
RTDataInteractionBuilder >> toggleDataset [
	self addInteraction: (RTDataToggleInteraction new dataset: dataSet)
]
