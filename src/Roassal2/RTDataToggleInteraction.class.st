"
I hide the dataset when the associated legend entry has been clicked on.
For example:
-=-=-=-=-=-=-=-=-=-=
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
-=-=-=-=-=-=-=-=-=-=
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

{ #category : #accessing }
RTDataToggleInteraction >> dataset: aDataset [
	dataset := aDataset
]

{ #category : #hooks }
RTDataToggleInteraction >> initializeElement: element [
	"Do nothing. Initialization happens only after #legendElements have been assigned."
]

{ #category : #initialization }
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

{ #category : #accessing }
RTDataToggleInteraction >> legendElements: aCollection [
	legendElements := aCollection.
	self initializeLegendElement
]
