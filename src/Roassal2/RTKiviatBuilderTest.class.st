Class {
	#name : #RTKiviatBuilderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #tests }
RTKiviatBuilderTest >> testBasic [
	| b |
	b := RTKiviatBuilder new.
	b shapes: ((RTColorPalette qualitative colors: 12 scheme:'Paired') do: [:c | c alpha: 0.3]).
	b objects: RTAbstractCircleLayout withAllSubclasses.
	b addMetric: #numberOfLinesOfCode.
	b addMetric: #numberOfMethods.
	b addMetric: #numberOfVariables.
	
	b activateAxisTitle.
	
	b build.
	
	b recordElement: (b view elements detect: [ :e | e shape class == RTEllipse ]).
	
]
