Class {
	#name : #MerlinMorphicRowRenderer,
	#superclass : #MerlinMorphicCellRenderer,
	#category : #'Merlin-Rendering'
}

{ #category : #rendering }
MerlinMorphicRowRenderer >> cellContentsOf: aPaneRow [

	^ aPaneRow merlinRendering morphContents
	
]
