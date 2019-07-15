Class {
	#name : #MerlinMorphicLastPaneRenderer,
	#superclass : #MerlinMorphicPaneRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicLastPaneRenderer >> displayButtons [

	
	self buttons: {self newCancelButton. self newPreviousButton. self newFinishButton}.
]
