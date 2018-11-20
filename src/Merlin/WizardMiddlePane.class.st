Class {
	#name : #WizardMiddlePane,
	#superclass : #WizardPane,
	#instVars : [
		'nextButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #rendering }
WizardMiddlePane >> merlinSpecificRenderer [ 

	^ MerlinMorphicMiddlePaneRenderer new .
]

{ #category : #rendering }
WizardMiddlePane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinMiddlePane: self  
]
