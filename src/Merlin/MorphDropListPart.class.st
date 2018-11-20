Class {
	#name : #MorphDropListPart,
	#superclass : #DropListPart,
	#category : #'Merlin-Parts'
}

{ #category : #rendering }
MorphDropListPart >> merlinRendering [

	^ self renderer merlinMorphDropListRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
MorphDropListPart >> outputValue [

	^self selectionIndex
]
