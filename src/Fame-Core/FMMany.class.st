Class {
	#name : #FMMany,
	#superclass : #FMRelationSlot,
	#category : #'Fame-Core-Slots'
}

{ #category : #internal }
FMMany >> add: newObject to: collectionOwner [

	self checkValue: newObject.
	self hasInverse
		ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ]

]

{ #category : #initialization }
FMMany >> initialize: anObject [

	self write: (FMSlotMultivalueLink on: anObject slot: self) to: anObject. 
	
]

{ #category : #initialization }
FMMany >> lazyInitializationFor: anObject slotValue: aSlotValue [

	| newLink |
	
	aSlotValue ifNotNil: [ ^ aSlotValue ].
	
	newLink := (FMSlotMultivalueLink on: anObject slot: self).

	thisContext object: anObject instVarAt: index put: newLink.
	
	^ newLink


]

{ #category : #'meta-object-protocol' }
FMMany >> mooseProperty [

	^ self moosePropertyFor: self owningClass name multivalued: true.
]

{ #category : #internal }
FMMany >> remove: oldObject from: collectionOwner [

	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]

]
