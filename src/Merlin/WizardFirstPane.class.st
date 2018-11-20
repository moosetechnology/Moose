Class {
	#name : #WizardFirstPane,
	#superclass : #WizardPane,
	#instVars : [
		'nextButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #'initialize-release' }
WizardFirstPane >> initialize [

	super initialize.
	
	
]

{ #category : #'*merlin-rendering' }
WizardFirstPane >> merlinSpecificRenderer [ 

	^ MerlinMorphicFirstPaneRenderer new 
]

{ #category : #rendering }
WizardFirstPane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinFirstPane: self 
]
