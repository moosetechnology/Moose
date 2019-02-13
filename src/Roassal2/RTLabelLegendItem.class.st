Class {
	#name : #RTLabelLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'text',
		'model',
		'color'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #accessing }
RTLabelLegendItem >> color [
	^ color
]

{ #category : #accessing }
RTLabelLegendItem >> color: aColor [
	color := aColor
]

{ #category : #hooks }
RTLabelLegendItem >> execute [

	^ RTGroup new add: 
			((self newLabelShape: text) elementOn: model); yourself
]

{ #category : #accessing }
RTLabelLegendItem >> model [
	^ model
]

{ #category : #accessing }
RTLabelLegendItem >> model: anObject [
	model := anObject
]

{ #category : #accessing }
RTLabelLegendItem >> text [
	^ text
]

{ #category : #accessing }
RTLabelLegendItem >> text: aTextOrSymbolOrBlock [
	text := aTextOrSymbolOrBlock
]

{ #category : #accessing }
RTLabelLegendItem >> textColor [
	^ color
]
