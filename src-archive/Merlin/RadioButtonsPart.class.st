Class {
	#name : #RadioButtonsPart,
	#superclass : #SingleOptionAtLeastOneSelectionPart,
	#instVars : [
		'option'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
RadioButtonsPart >> latePopulateContents [ 

	(self valueOf: self defaultValue) 
		ifNotNil: [:aSymbol |
			self selectOption: aSymbol
		]
]

{ #category : #'*merlin-rendering' }
RadioButtonsPart >> merlinRendering [

	^ self renderer merlinRadioButtonsRenderingFor: self
]
