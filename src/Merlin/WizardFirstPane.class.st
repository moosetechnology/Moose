Class {
	#name : #WizardFirstPane,
	#superclass : #WizardPane,
	#instVars : [
		'nextButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #rendering }
WizardFirstPane >> merlinSpecificRenderer [ 

	^ MerlinMorphicFirstPaneRenderer new 
]

{ #category : #rendering }
WizardFirstPane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinFirstPane: self 
]
