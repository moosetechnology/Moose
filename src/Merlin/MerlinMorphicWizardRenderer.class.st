Class {
	#name : #MerlinMorphicWizardRenderer,
	#superclass : #MerlinMorphicRenderer,
	#instVars : [
		'currentIndex',
		'wizardControl'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphicWizardRenderer >> currentIndex [

	^ currentIndex
]

{ #category : #accessing }
MerlinMorphicWizardRenderer >> currentIndex: aNumber [

	currentIndex := aNumber
]

{ #category : #accessing }
MerlinMorphicWizardRenderer >> currentPane [
	
	"return the wizardPane that is currently opened "
	"^ self wizardPanes at: currentIndex"
	^ self wizardControl currentPane
]

{ #category : #buttonsActions }
MerlinMorphicWizardRenderer >> performCancelButtonAction [
	
	self dialogWindow close.
]

{ #category : #buttonsActions }
MerlinMorphicWizardRenderer >> performNextButtonAction [
	"this method is run when a next button is pressed"
	
	self dialogWindow close.
	"self currentIndex: (self currentIndex + 1)."
	^self doOpen: (self currentPane renderOnMerlinRenderer: self)
]

{ #category : #buttonsActions }
MerlinMorphicWizardRenderer >> performPreviousButtonAction [
	"this method is run when a previous button is pressed"
	
	self dialogWindow close.
	"self currentIndex: (self currentIndex - 1)."
	^ self doOpen: (self currentPane renderOnMerlinRenderer: self)
]

{ #category : #buttonsActions }
MerlinMorphicWizardRenderer >> performTerminateButtonAction [
	
	self dialogWindow close.
	self wizardControl hasFinished ifFalse: [
		self doOpen: (self currentPane renderOnMerlinRenderer: self)
		]
]

{ #category : #updating }
MerlinMorphicWizardRenderer >> refresh [

	self doOpen: (self currentPane renderOnMerlinRenderer: self)
]

{ #category : #rendering }
MerlinMorphicWizardRenderer >> render: aWizardControl [

	self wizardControl: aWizardControl.
	self currentIndex: 1.
	^ self currentPane renderOnMerlinRenderer: self
]

{ #category : #accessing }
MerlinMorphicWizardRenderer >> wizardControl [

	^ wizardControl 
]

{ #category : #accessing }
MerlinMorphicWizardRenderer >> wizardControl: aWizardControl [

	wizardControl := aWizardControl 
]

{ #category : #accessing }
MerlinMorphicWizardRenderer >> wizardPanes [

	^ self wizardControl wizardPanes
]
