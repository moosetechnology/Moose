Class {
	#name : #MADateMorph,
	#superclass : #MAElementMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MADateMorph >> buildMorphView [
	| model |
	model := DateModel new
		displayBlock: [ :e | description displayStringFor: e ];
		date: self value;
		whenDateChanged: [ :newDate | self value: newDate ];
		yourself.
	^ model buildWithSpec
			yourself.
]
