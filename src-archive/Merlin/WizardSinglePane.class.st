Class {
	#name : #WizardSinglePane,
	#superclass : #WizardPane,
	#instVars : [
		'terminateButton'
	],
	#category : #'Merlin-Panes'
}

{ #category : #'*merlin-rendering' }
WizardSinglePane >> merlinSpecificRenderer [

	^ MerlinMorphicSinglePaneRenderer new.
]

{ #category : #'*merlin-rendering' }
WizardSinglePane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinSinglePane: self  
]

{ #category : #actions }
WizardSinglePane >> terminateButtonAction [
	"action executed when the terminate button is pressed"
	
	partsAndInformationsAssociated keysAndValuesDo: 
		[ :key :value | 
		self wizardControl 
			information: value
			withValue: key transformedOutputValue ].
	self wizardControl performTerminateButtonAction
]
