Class {
	#name : #MerlinMorphMorphDroplListWidget,
	#superclass : #MerlinMorphDroplListWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphMorphDroplListWidget >> dropList [ 

	^ self newMorphDropListOn: self wizardPart  
]
