Class {
	#name : #MerlinMorphCellWidget,
	#superclass : #MerlinMorphWidget,
	#instVars : [
		'wizardCell'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphCellWidget >> morphContents [
	self wizardCell groupBoxName
		ifNotNil:
			[ :aString | ^ self newGroupBoxNamed: aString with: self specificMorphContents ]
		ifNil: [ ^ self specificMorphContents ]
]

{ #category : #'accessing - morph contents' }
MerlinMorphCellWidget >> specificMorphContents [ 

	"each subclass should implement this method to return its morph contents. This is the hook used by the abstract class to generically iniatilzed some shared parameters"
	^ self subclassResponsability 
]

{ #category : #accessing }
MerlinMorphCellWidget >> wizardCell [

	^ wizardCell 
]

{ #category : #accessing }
MerlinMorphCellWidget >> wizardCell: aPaneLine [

	wizardCell := aPaneLine
]
