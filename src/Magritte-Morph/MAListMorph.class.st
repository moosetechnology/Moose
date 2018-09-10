Class {
	#name : #MAListMorph,
	#superclass : #MAElementMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'accessing-dynamic' }
MAListMorph >> options [
	^ self magritteDescription allOptions
]

{ #category : #'accessing-dynamic' }
MAListMorph >> strings [
	^ self options collect: [ :each | self magritteDescription reference toString: each ]
]
