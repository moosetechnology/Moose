Class {
	#name : #MerlinMorphicCellRenderer,
	#superclass : #MerlinMorphicRenderer,
	#instVars : [
		'wizardCell'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicCellRenderer >> cellContentsOf: aPaneLine [

	^ self subclassResponsability   
]

{ #category : #rendering }
MerlinMorphicCellRenderer >> render: aPaneLine [

	|morphContents|
	self wizardCell: aPaneLine.
	morphContents := self cellContentsOf: self wizardCell.
	^ morphContents 
	"^ self dialogWindow  contentMorph: morphContents."
	   
]

{ #category : #accessing }
MerlinMorphicCellRenderer >> subComponents [

	^ self wizardCell subComponents
]

{ #category : #accessing }
MerlinMorphicCellRenderer >> wizardCell [

	^ wizardCell
]

{ #category : #accessing }
MerlinMorphicCellRenderer >> wizardCell: aPaneColumnOrAPaneRow [

	wizardCell := aPaneColumnOrAPaneRow 	
]
