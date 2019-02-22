Class {
	#name : #RTAbstractVerticalValuesDecorator,
	#superclass : #RTAbstractValuesDecorator,
	#instVars : [
		'labelColor'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #configuration }
RTAbstractVerticalValuesDecorator >> blue [
	self labelColor: Color blue
]

{ #category : #configuration }
RTAbstractVerticalValuesDecorator >> defaultLabelColor [
	^ Color gray
]

{ #category : #configuration }
RTAbstractVerticalValuesDecorator >> green [
	self labelColor: Color green
]

{ #category : #initialization }
RTAbstractVerticalValuesDecorator >> initialize [
	super initialize.
	labelColor := self defaultLabelColor
]

{ #category : #drawing }
RTAbstractVerticalValuesDecorator >> labelColor [
	^ labelColor
]

{ #category : #drawing }
RTAbstractVerticalValuesDecorator >> labelColor: aColor [
	labelColor := aColor
]

{ #category : #configuration }
RTAbstractVerticalValuesDecorator >> red [
	self labelColor: Color red
]

{ #category : #drawing }
RTAbstractVerticalValuesDecorator >> render [
	| position offset tickSize |
	offset := -30 @ 0.
	tickSize := 5.
	values
		do: [ :aValue | 
			position := builder getPixelPositionOf: 0 @ aValue.
			self label: (labelConversion rtValue: aValue) asString on: position + offset color: self labelColor.
			self shape line color: self labelColor.
			self lineFrom: position to: position - (tickSize @ 0) ]
]
