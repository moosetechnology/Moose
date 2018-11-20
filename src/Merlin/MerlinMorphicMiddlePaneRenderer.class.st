Class {
	#name : #MerlinMorphicMiddlePaneRenderer,
	#superclass : #MerlinMorphicPaneRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicMiddlePaneRenderer >> displayButtons [

	self buttons: {self newCancelButton . self newPreviousButton . self newNextButton}.
]
