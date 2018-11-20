Class {
	#name : #MerlinMorphTextWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'textField',
		'textMorph'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - wizard management' }
MerlinMorphTextWidget >> populateWizardPartOutput [ 

	self wizardPart outputValue: self textMorph contents  
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextWidget >> specificMorphContents [ 

	^ self textMorph contents: (self wizardPart formatBlock meValue: self wizardPart text)

	
]

{ #category : #'accessing - morph contents' }
MerlinMorphTextWidget >> textMorph [

	^ textMorph ifNil: [textMorph := self newEmptyText]
]
