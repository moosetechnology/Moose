Class {
	#name : #MerlinMorphRowWidget,
	#superclass : #MerlinMorphCellWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphRowWidget >> specificMorphContents [ 

	^ self newRowWith: (self wizardCell subComponents collect: [:aPaneLineOrAWizardPart | aPaneLineOrAWizardPart merlinRendering morphContents]).
]
