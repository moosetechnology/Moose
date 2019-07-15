Class {
	#name : #MASingleSelectListMorph,
	#superclass : #MAListMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MASingleSelectListMorph >> buildMorphView [
	^ (PluggableListMorph on: self list: #strings selected: #selected changeSelected: #selected:)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		yourself
]

{ #category : #accessing }
MASingleSelectListMorph >> selected [
	^ self options indexOf: self value
]

{ #category : #accessing }
MASingleSelectListMorph >> selected: anInteger [
	self value: (self options at: anInteger ifAbsent: [ nil ]).
	self changed: #selected
]
