"
I hide the dataset when the associated legend entry has been clicked on.
"
Class {
	#name : #RTDataToggleInteraction,
	#superclass : #RTGrapherInteraction,
	#instVars : [
		'dataset',
		'legendElements'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #'as yet unclassified' }
RTDataToggleInteraction >> dataset: aDataset [
	dataset := aDataset
]

{ #category : #'as yet unclassified' }
RTDataToggleInteraction >> initializeElement: element [
	"Do nothing. Initialization happens only after #legendElements have been assigned."
]

{ #category : #'as yet unclassified' }
RTDataToggleInteraction >> initializeLegendElement [
	legendElements
		when: TRMouseLeftClick
		do: [ :event | 
			dataset elements anyOne view
				ifNil: [ dataset builder view addAll: dataset elements.
					dataset renderLinesFor: dataset elements in: dataset builder view.
					RTBlink unhighlightElements: legendElements.
					dataset builder view signalUpdate ]
				ifNotNil: [ dataset elements do: #remove.
					RTBlink highlight: legendElements first color: Color veryLightGray.
					RTBlink highlight: legendElements second color: Color veryLightGray.
					dataset builder view signalUpdate ] ]
]

{ #category : #'as yet unclassified' }
RTDataToggleInteraction >> legendElements: aCollection [
	legendElements := aCollection.
	self initializeLegendElement
]
