Class {
	#name : #MerlinMorphRadioButtonsWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'radioButtons',
		'labelsAndModels'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph' }
MerlinMorphRadioButtonsWidget >> initializeRadioButtons [

	radioButtons := 
			self wizardPart options collect: [:aSymbol |
				|radioButton|
				radioButton := (self newRadionButtonFor: (self wizardPart modelOfOption: aSymbol) getSelected: #contents setSelected: #contents:  label: (self wizardPart formatBlock meValue: aSymbol)).
				radioButton 
			].
		
	^ radioButtons 
		
]

{ #category : #'accessing - morph' }
MerlinMorphRadioButtonsWidget >> radioButtons [

	^ radioButtons ifNil: [
		self initializeRadioButtons.
		]
]

{ #category : #rendering }
MerlinMorphRadioButtonsWidget >> specificMorphContents [ 

	^ self newColumnWith: self radioButtons  
	
]
