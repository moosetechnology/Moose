Class {
	#name : #MerlinMorphicSinglePaneRenderer,
	#superclass : #MerlinMorphicPaneRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicSinglePaneRenderer >> displayButtons [

	self buttons: {self newCancelButton. self newFinishButton}.
]
