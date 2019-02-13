"
I highlight the whole dataset when I any of my elements are hovered over.
"
Class {
	#name : #RTDataHighlightInteraction,
	#superclass : #RTGrapherInteraction,
	#instVars : [
		'dataset',
		'color',
		'legendElements'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #accessing }
RTDataHighlightInteraction >> color: aColor [
	color := aColor
]

{ #category : #accessing }
RTDataHighlightInteraction >> dataset: aDataset [
	dataset := aDataset
]

{ #category : #initialization }
RTDataHighlightInteraction >> initialize [
	super initialize.
	legendElements := #()
]

{ #category : #hooks }
RTDataHighlightInteraction >> initializeElement: element [
	element
		when: TRMouseEnter
		do: [ :event | 
			RTBlink highlightElements: dataset elements color: color.
			RTBlink highlightElements: dataset elements outgoingEdges color: color.
			RTBlink highlight: legendElements first color: color.
			RTBlink highlight: legendElements second color: Color black ].
	element
		when: TRMouseLeave
		do: [ :event | 
			RTBlink unhighlightElements: dataset elements.
			RTBlink unhighlightElements: dataset elements outgoingEdges.
			RTBlink unhighlightElements: legendElements ]
]

{ #category : #accessing }
RTDataHighlightInteraction >> legendElements: aCollection [
	legendElements := aCollection
]
