"
A RTTextLine contains RTTextWord instances and represents one line of a text.

"
Class {
	#name : #RTTextLine,
	#superclass : #OrderedCollection,
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #enumerating }
RTTextLine >> wordsDo: aBlockClosure [ 
	^ self do: aBlockClosure
]
