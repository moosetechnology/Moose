Class {
	#name : #MerlinMorphicFirstPaneRenderer,
	#superclass : #MerlinMorphicPaneRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicFirstPaneRenderer >> displayButtons [
	"add buttons to the dialogWindow. each subclass now which buttons have to be added to their dialogWindow"
	
	 
	self buttons: {self newCancelButton . self newNextButton}
]
