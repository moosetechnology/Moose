Class {
	#name : #RTExperimentalExampleTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Experimental'
}

{ #category : #tests }
RTExperimentalExampleTest >> testBasic [
	"Should not raise an error"
	| view |
	view := RTExperimentalExample new exampleClusterBezierAndSlider.
	view canvas buildMorph drawOnMockCanvas
]
