Class {
	#name : #MerlinMorphCheckboxWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'checkboxMorph'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphCheckboxWidget >> checkboxMorph [

	^ checkboxMorph ifNil: [
		checkboxMorph := (self newCheckboxFor: (self wizardPart)
				getSelected: #contents
				setSelected: #contents:
				label: (self wizardPart label)).
		]
]

{ #category : #'accessing - morph contents' }
MerlinMorphCheckboxWidget >> specificMorphContents [ 

	^ self newRowWith: { self checkboxMorph }
]
