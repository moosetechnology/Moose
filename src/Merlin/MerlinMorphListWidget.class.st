Class {
	#name : #MerlinMorphListWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'list',
		'listMorph'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphListWidget >> listMorph [

	^ listMorph ifNil: [listMorph := self newNormalListFor: self wizardPart  list: #list selected: #selectionIndex changeSelected: #selectionIndex:]
]

{ #category : #'accessing - morph contents' }
MerlinMorphListWidget >> setMorphSize [
	self wizardPart horizontalSize ifNotNil: [ self listMorph minWidth: self wizardPart horizontalSize ].
	self wizardPart verticalSize ifNotNil: [ self listMorph minHeight: self wizardPart verticalSize ]
]

{ #category : #'accessing - morph contents' }
MerlinMorphListWidget >> specificMorphContents [ 

	self setMorphSize.
	^ self listMorph

]
