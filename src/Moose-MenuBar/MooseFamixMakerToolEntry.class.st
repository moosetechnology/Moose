Class {
	#name : #MooseFamixMakerToolEntry,
	#superclass : #MooseAbstractToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseFamixMakerToolEntry >> execute [
	MooseEasyFamixMakerPresenter open
]

{ #category : #execution }
MooseFamixMakerToolEntry >> label [
	^ 'Famix Maker'
]
