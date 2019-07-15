Class {
	#name : #MAMultiSelectListMorph,
	#superclass : #MAListMorph,
	#instVars : [
		'selected'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMultiSelectListMorph >> buildMorph [
		
	^ super buildMorph.
]

{ #category : #private }
MAMultiSelectListMorph >> buildMorphView [
	^ (PluggableListMorph on: self list: #strings primarySelection: #selected changePrimarySelection: #selected: listSelection: #selectionAt: changeListSelection: #selectionAt:put: menu: nil)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		beMultipleSelection;
		yourself
]

{ #category : #accessing }
MAMultiSelectListMorph >> selected [
	^ selected ifNil: [ selected := 0 ]
]

{ #category : #accessing }
MAMultiSelectListMorph >> selected: anInteger [
	selected := anInteger.
	self changed: #selected
]

{ #category : #accessing }
MAMultiSelectListMorph >> selectionAt: anInteger [
	^ self value includes: (self options at: anInteger)
]

{ #category : #accessing }
MAMultiSelectListMorph >> selectionAt: anInteger put: aBoolean [
	| option |
	option := self options at: anInteger.
	self value: (aBoolean
		ifTrue: [ self value copyWith: option ]
		ifFalse: [ self value copyWithout: option ]).
	self changed: #selected
]
