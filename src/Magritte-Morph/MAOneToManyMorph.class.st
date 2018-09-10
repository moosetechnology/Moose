Class {
	#name : #MAOneToManyMorph,
	#superclass : #MARelationMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #actions }
MAOneToManyMorph >> add [

	self newRelation asMagritteMorph
		onAnswer: [ :result |
			result isNil ifFalse: [ self value: (self value copyWith: result) ].
			self add: result ];
		addButtons; 
		addWindow;
		openInWorld
]

{ #category : #private }
MAOneToManyMorph >> add: anObject [
	| rowParent lastRowIndex newRow |
	rowParent := morph submorphs second.
	newRow := MAElementRow for: anObject of: self.
	lastRowIndex := rowParent submorphs findLast: [ :e | e isKindOf: MAElementRow ].
	lastRowIndex = 0 
		ifTrue: [ rowParent addMorph: newRow ]
		ifFalse: [ rowParent 
			addMorph: newRow 
			after: (rowParent submorphs at: lastRowIndex) ].
]

{ #category : #private }
MAOneToManyMorph >> buildMorphView [

	| table |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value do: [ :e | MAElementRow addMorphFor: e of: self to: table ].
	self magritteDescription isDefinitive
		ifFalse: [ self addSelectListTo: table ].
	^ table.
]

{ #category : #private }
MAOneToManyMorph >> buildSelectButton [

	^ UITheme current builder newButtonFor: self action: #add label: 'Add' help: ''.
]
