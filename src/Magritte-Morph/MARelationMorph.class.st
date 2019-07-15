Class {
	#name : #MARelationMorph,
	#superclass : #MAElementMorph,
	#instVars : [
		'selected',
		'selectedIndex'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MARelationMorph >> addSelectListTo: aMorph [

	| list |
	self classes ifEmpty: [ ^ self ].
	list := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	self classes size > 1 ifTrue: [ list addMorphBack: self buildClassChooser ].
	list addMorphBack: self buildSelectButton.
	aMorph addMorphBack: list
]

{ #category : #'private-building' }
MARelationMorph >> buildClassChooser [

	| items |
	items := self classes collect: [ :e | e label ].
	^ UITheme current builder newDropListFor: self list: items getSelected: #selectedIndex setSelected: #selectedIndex: help: ''.
]

{ #category : #'private-building' }
MARelationMorph >> buildMorph [

	self flag: 'hook for testing. delete me before committing. spd.'.
	^ super buildMorph.
]

{ #category : #'private-building' }
MARelationMorph >> buildMorphViewOn: aMorph [

	self flag: 'hook for testing. delete me before committing. spd.'.
	^ super buildMorphViewOn: aMorph
]

{ #category : #'private-building' }
MARelationMorph >> buildSelectButton [
	self subclassResponsibility
]

{ #category : #'accessing-dynamic' }
MARelationMorph >> classes [

	^ self magritteDescription classes.
]

{ #category : #private }
MARelationMorph >> newRelation [

	| instance |
	instance := self selected new.
	self magritteDescription initializer value: instance.
	^ instance

]

{ #category : #accessing }
MARelationMorph >> selected [
	^ self classes at: self selectedIndex
]

{ #category : #private }
MARelationMorph >> selectedIndex [
	^ selectedIndex ifNil: [ selectedIndex := 1 ]
]

{ #category : #private }
MARelationMorph >> selectedIndex: anInteger [
	selectedIndex := anInteger.
]
