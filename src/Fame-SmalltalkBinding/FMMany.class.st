Class {
	#name : #FMMany,
	#superclass : #FMRelationSlot,
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #internal }
FMMany >> add: newObject to: collectionOwner [
	self hasInverse ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ]
]

{ #category : #initialization }
FMMany >> initialize: anObject [

	self write: (FMSlotMultivalueLink on: anObject slot: self) to: anObject. 
	
]

{ #category : #internal }
FMMany >> remove: oldObject from: collectionOwner [

	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]

]
