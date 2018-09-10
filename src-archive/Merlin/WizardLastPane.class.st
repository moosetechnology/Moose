Class {
	#name : #WizardLastPane,
	#superclass : #WizardPane,
	#instVars : [
		'terminateButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #'*merlin-rendering' }
WizardLastPane >> merlinSpecificRenderer [ 
	^ MerlinMorphicLastPaneRenderer new 
]

{ #category : #'*merlin-rendering' }
WizardLastPane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinLastPane: self  
]

{ #category : #actions }
WizardLastPane >> terminateButtonAction [
	"action executed when the terminate button is pressed"
	
	self retrievePartsOutputs. 
	self wizardControl performTerminateButtonAction
]
