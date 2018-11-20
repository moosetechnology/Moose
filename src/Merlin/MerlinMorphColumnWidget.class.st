Class {
	#name : #MerlinMorphColumnWidget,
	#superclass : #MerlinMorphCellWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphColumnWidget >> specificMorphContents [ 

	^ self newColumnWith: (self wizardCell subComponents collect: [:aPaneLineOrAWizardPart | aPaneLineOrAWizardPart merlinRendering morphContents]).
]
