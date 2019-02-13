"
A RTTextLines contains RTTextLine objects and represents whole text splitted into lines.
"
Class {
	#name : #RTTextLines,
	#superclass : #OrderedCollection,
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #enumerating }
RTTextLines >> linesDo: aBlockClosure [ 
	^ self do: aBlockClosure 
]
