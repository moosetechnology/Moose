"
Description
--------------------

I am a relation slot representing a multivalued property.

Examples
--------------------

	Trait named: #FamixTWithMethods
		uses: {}
		slots: { #methods => FMMany type: #FamixTMethod opposite: #parentType }
		package: 'Famix-Traits-Method'
"
Class {
	#name : #FMMany,
	#superclass : #FMRelationSlot,
	#category : #'Fame-Core-Utilities'
}

{ #category : #internal }
FMMany >> add: newObject to: collectionOwner [
	self hasInverse ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ]
]

{ #category : #initialization }
FMMany >> initialize: anObject [
	self write: (FMSlotMultivalueLink on: anObject slot: self) to: anObject
]

{ #category : #internal }
FMMany >> remove: oldObject from: collectionOwner [

	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]

]
