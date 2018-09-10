Class {
	#name : #WizardMiddlePane,
	#superclass : #WizardPane,
	#instVars : [
		'nextButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #'*merlin-rendering' }
WizardMiddlePane >> merlinSpecificRenderer [ 

	^ MerlinMorphicMiddlePaneRenderer new .
]

{ #category : #'*merlin-rendering' }
WizardMiddlePane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinMiddlePane: self  
]
