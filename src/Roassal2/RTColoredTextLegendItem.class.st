Class {
	#name : #RTColoredTextLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'text',
		'model'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #hooks }
RTColoredTextLegendItem >> execute [
	^ RTGroup new add: 
			((self newLabelShape: text) elementOn: model); yourself
]

{ #category : #accessing }
RTColoredTextLegendItem >> model [
	^ model
]

{ #category : #accessing }
RTColoredTextLegendItem >> model: anObject [
	model := anObject
]

{ #category : #accessing }
RTColoredTextLegendItem >> text [
	^ text
]

{ #category : #accessing }
RTColoredTextLegendItem >> text: aStringOrABlockOrASymbol [
	text := aStringOrABlockOrASymbol
]
