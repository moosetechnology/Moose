Class {
	#name : #RTColorLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'color',
		'text',
		'model'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #accessing }
RTColorLegendItem >> color [
	^ color
]

{ #category : #accessing }
RTColorLegendItem >> color: aColor [
	self assert: [ aColor notNil ] description: 'You have to provide a color'.
	color := aColor
]

{ #category : #hooks }
RTColorLegendItem >> execute [
	"Associate a color with a text"
	| g |
	g := RTGroup new.
	g add: (RTBox new size: textSize; color: color) element.
	g add: ((RTLabel text: text) height: textSize; elementOn: model).
	RTHorizontalLineLayout new alignCenter; on: g.
	^ g
]

{ #category : #accessing }
RTColorLegendItem >> model [
	^ model
]

{ #category : #accessing }
RTColorLegendItem >> model: anObject [
	model := anObject
]

{ #category : #accessing }
RTColorLegendItem >> text [
	^ text
]

{ #category : #accessing }
RTColorLegendItem >> text: aStringOrABlockOrASymbol [
	text := aStringOrABlockOrASymbol
]
