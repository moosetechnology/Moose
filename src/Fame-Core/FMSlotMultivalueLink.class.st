Class {
	#name : #FMSlotMultivalueLink,
	#superclass : #Collection,
	#instVars : [
		'values',
		'owner',
		'opposite',
		'slot'
	],
	#category : #'Fame-Core-Slots'
}

{ #category : #'instance creation' }
FMSlotMultivalueLink class >> on: anObject slot: aFMRelationSlot [

	^ self new owner: anObject slot: aFMRelationSlot

]

{ #category : #copying }
FMSlotMultivalueLink >> , aCollection [
	^ self asOrderedCollection , aCollection
]

{ #category : #comparing }
FMSlotMultivalueLink >> = otherCollection [ 
	"Answer true if the receiver is equivalent to the otherCollection.
	First test for identity, then rule out different species and sizes of
	collections. As a last resort, examine each element of the receiver
	and the otherCollection."

	self == otherCollection ifTrue: [^ true].
	self species == otherCollection species ifFalse: [^ false].
	^ values hasEqualElements: otherCollection asOrderedCollection
]

{ #category : #accessing }
FMSlotMultivalueLink >> add: anElement [

	slot add: anElement to: owner.
	self unsafeAdd: anElement.
	^ anElement
]

{ #category : #accessing }
FMSlotMultivalueLink >> at: index [

	^values at: index
]

{ #category : #accessing }
FMSlotMultivalueLink >> byName: name [
	^ self byName: name ifAbsent: [ self errorNotFound: name ]
]

{ #category : #accessing }
FMSlotMultivalueLink >> byName: name ifAbsent: exceptionBlock [

	^values
			detect: [ :each | each name asString = name asString ]
			ifNone: exceptionBlock
	 
]

{ #category : #enumerating }
FMSlotMultivalueLink >> do: aBlock [ 
	
	values do: aBlock
]

{ #category : #'accessing-computed' }
FMSlotMultivalueLink >> first [
	^ self at: 1
]

{ #category : #comparing }
FMSlotMultivalueLink >> hash [
	"From sequenceable collection"
	| hash |
	hash := self species hash.
	1 to: self size do: [ :i | hash := (hash + (self at: i) hash) hashMultiply ].
	^ hash
]

{ #category : #private }
FMSlotMultivalueLink >> inverseAdd: anObject [

	^values add: anObject
]

{ #category : #private }
FMSlotMultivalueLink >> inverseRemove: anObject [

	^values remove: anObject
]

{ #category : #'accessing-computed' }
FMSlotMultivalueLink >> last [
	^ values last
]

{ #category : #private }
FMSlotMultivalueLink >> owner: anObject slot: aFMRelationSlot [

	owner := anObject.
	slot := aFMRelationSlot.
	values := OrderedCollection new.

]

{ #category : #copying }
FMSlotMultivalueLink >> postCopy [

	super postCopy.
	values := values copy.
]

{ #category : #printing }
FMSlotMultivalueLink >> printOn: aStream [

	self asArray printOn: aStream
]

{ #category : #removing }
FMSlotMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [ 
	
	values remove: anElement ifAbsent: [ ^exceptionBlock value ].
	slot remove: anElement from: owner.
	^anElement
]

{ #category : #'accessing-computed' }
FMSlotMultivalueLink >> second [
	^ self at: 2
]

{ #category : #accessing }
FMSlotMultivalueLink >> size [

	^values size
]

{ #category : #private }
FMSlotMultivalueLink >> species [

	^OrderedCollection
]

{ #category : #'accessing-computed' }
FMSlotMultivalueLink >> third [
	^ self at: 3
]

{ #category : #private }
FMSlotMultivalueLink >> unsafeAdd: element [

	(values includes: element) not ifTrue: [
		values add: element ]
]

{ #category : #private }
FMSlotMultivalueLink >> unsafeRemove: element [

	values remove: element ifAbsent: nil
]

{ #category : #accessing }
FMSlotMultivalueLink >> value [

	^self
]

{ #category : #accessing }
FMSlotMultivalueLink >> value: aCollection [

	^self removeAll: values copy; addAll: aCollection
]

{ #category : #enumerating }
FMSlotMultivalueLink >> withIndexDo: aBlock [ 
	
	values withIndexDo: aBlock
]
