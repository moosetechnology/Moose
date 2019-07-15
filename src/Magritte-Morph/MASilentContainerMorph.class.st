"
The only difference to the superclass is that on answer it does not delete the morph. This is useful when we want the morph to be embedded.
"
Class {
	#name : #MASilentContainerMorph,
	#superclass : #MAContainerMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #answering }
MASilentContainerMorph >> answer: anObject [
	answerBlock isNil
		ifFalse: [ answerBlock value: anObject ].
]
