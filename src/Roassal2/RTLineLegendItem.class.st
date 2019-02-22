Class {
	#name : #RTLineLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'color',
		'text'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #accessing }
RTLineLegendItem >> color [
	^ color
]

{ #category : #accessing }
RTLineLegendItem >> color: anObject [
	color := anObject
]

{ #category : #hooks }
RTLineLegendItem >> execute [
	"Associate a color with a text"
	| g |
	g := RTGroup new.
	g add: (RTBox new height: textSize * 0.3; width: textSize; color: color) element.
	g add: ((self newLabelShape: text) elementOn: text).
	RTHorizontalLineLayout new alignCenter; on: g.
	^ g
]

{ #category : #accessing }
RTLineLegendItem >> text [
	^ text
]

{ #category : #accessing }
RTLineLegendItem >> text: anObject [
	text := anObject
]
