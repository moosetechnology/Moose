Class {
	#name : #MerlinMorphMultiCheckboxesWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'allCheckboxes'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #private }
MerlinMorphMultiCheckboxesWidget >> addVerticalSeparatorAtTheMiddleOf: aCollectionOfElements [

	"return a collection containing all initials morph elements from aCollectionOfElements including a vertical separator at the middle"
	|  index result result1 result2 collectionSize |
	collectionSize := aCollectionOfElements size.
	collectionSize even 
		ifTrue: [index :=  collectionSize // 2.]
		ifFalse: [index :=  collectionSize // 2 + 1.].
	
	result := OrderedCollection new.
	result1 := OrderedCollection new.
	result2 := OrderedCollection new.
	1 to: (index ) do: [:i | result1 add: (self newRowWith: {(aCollectionOfElements at: i)})].
	(index + 1) to: aCollectionOfElements size do: [:i | result2 add: (self newRowWith: {(aCollectionOfElements at: i)})].
	
	result2 isEmpty
		ifFalse: [
			result add: (self newColumnWith:  result1 ); add: (self  newVerticalSeparator) ; add: (self newColumnWith:  result2 ). 
			]
		ifTrue: [
			result add: (self newColumnWith:  result1 ). 
			].
	^ result.
]

{ #category : #'accessing - morph contents' }
MerlinMorphMultiCheckboxesWidget >> allCheckboxes [ 

	^ allCheckboxes ifNil: [
			self computeAllCheckboxes.
			allCheckboxes 
			]
]

{ #category : #'accessing - morph contents' }
MerlinMorphMultiCheckboxesWidget >> allCheckboxes: aCollectionOfMorphCheckboxes [ 

	allCheckboxes := aCollectionOfMorphCheckboxes 
]

{ #category : #'accessing - morph contents' }
MerlinMorphMultiCheckboxesWidget >> computeAllCheckboxes [
	
	self allCheckboxes: (self wizardPart options collect: [:aLabel |
		(self newCheckboxFor: (self wizardPart modelOfOption: aLabel )
				getSelected: #contents
				setSelected: #contents:
				label: (self wizardPart formatBlock meValue: aLabel)).
		]).
]

{ #category : #'accessing - morph contents' }
MerlinMorphMultiCheckboxesWidget >> setActionToCheckboxes [ 

	"initialize the action to do when clicking on a checkbox"
	self allCheckboxes do: [ :each | 
		each buttonMorph target: self wizardPart actionModel.
		self wizardPart actionSelector ifNotNil: [each actionSelector: self wizardPart actionSelector].
		self wizardPart actionArguments ifNotNil: [each actionArguments: self wizardPart actionArguments].
		].
]

{ #category : #'accessing - morph contents' }
MerlinMorphMultiCheckboxesWidget >> specificMorphContents [

	|tmpMorphs|
	"self setActionToCheckboxes."
	tmpMorphs := self addVerticalSeparatorAtTheMiddleOf: self allCheckboxes.
	^ self newRowWith: tmpMorphs        
]
