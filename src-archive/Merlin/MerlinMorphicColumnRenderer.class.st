Class {
	#name : #MerlinMorphicColumnRenderer,
	#superclass : #MerlinMorphicCellRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicColumnRenderer >> cellContentsOf: aPaneColumn [

	^  aPaneColumn merlinRendering morphContents 
	
]
