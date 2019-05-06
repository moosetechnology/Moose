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
	"This is useful to toggle the curve. For example:
You need to click on the legend item.

-=--=-=--=-=--=-=--=-=--=	
g := RTGrapher new.
d := RTData new.
d label: 'Collection code'.
d interaction toggleDataset.
d dotShape color: Color red trans.
d points: (Collection withAllSubclasses).
d x: #numberOfLinesOfCode.
d y: #numberOfMethods.
g add: d.

d := RTData new.
d interaction toggleDataset.
d label: 'Roassal code'.
d dotShape color: Color blue trans.
d points: (RTObject withAllSubclasses).
d x: #numberOfLinesOfCode.
d y: #numberOfMethods.
g add: d.

g axisX noDecimal; title: 'Number of lines of code'; withThousandsSeparator.
g axisY noDecimal; title: 'Number of Methods'.

g legend addText: 'Collection vs Roassal code base'.
g
-=--=-=--=-=--=-=--=-=--=
	"
	self addInteraction: (RTDataToggleInteraction new dataset: dataSet)
]
