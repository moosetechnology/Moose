Class {
	#name : #MockWizardControl,
	#superclass : #WizardControl,
	#category : #'Merlin-Tests'
}

{ #category : #open }
MockWizardControl >> open [
	"launch the wizard system by opening the first wizard pane."
	
	wizardPanes isEmpty ifTrue: [ ^ self ].
	currentPane := 1.
	(wizardPanes at: currentPane) testOpen
]

{ #category : #'wizard panes transition' }
MockWizardControl >> performNextButtonAction [
	"this method is run when a next button is pressed"

	(wizardPanes at: currentPane) doClose.
	currentPane := currentPane  + 1.
	(wizardPanes at: currentPane) testOpen.
]

{ #category : #'wizard panes transition' }
MockWizardControl >> performPreviousButtonAction [
	"this method is run when a previous button is pressed"
	
	(wizardPanes at: currentPane) doClose.
	currentPane := currentPane  - 1.
	(wizardPanes at: currentPane) testOpen.
]

{ #category : #'wizard panes transition' }
MockWizardControl >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"
	
	(wizardPanes at: currentPane) doClose.
	self finalActionBlock ifNotNil: [
		self finalActionBlock value: self wizardInformations
		].
		
]
