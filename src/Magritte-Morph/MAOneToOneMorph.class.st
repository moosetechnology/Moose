Class {
	#name : #MAOneToOneMorph,
	#superclass : #MARelationMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'as yet unclassified' }
MAOneToOneMorph >> buildMorphView [

	| table |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value
		ifNotNil: [ MAElementRow addMorphFor: self value of: self to: table ]
		ifNil: [ self addSelectListTo: table ].
	^ table.
]

{ #category : #private }
MAOneToOneMorph >> buildSelectButton [

	^ UITheme current builder newButtonFor: self action: #create label: 'Create' help: ''.
]

{ #category : #actions }
MAOneToOneMorph >> create [
	self subclassResponsibility
]
