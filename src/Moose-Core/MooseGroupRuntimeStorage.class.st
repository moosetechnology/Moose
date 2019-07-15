"
I am storing the items of the group during the standard usage of moose entities.

I store the entites for fast access byName and byType. I also contains the all the entities in elements which is not sorted. 

I am used by MooseAbstractGroup subclasses.

Public API and Key Messages

I am managed like a collection and my caches are autoupdated when an entity is added or removed.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	byName:		Dictionnary (key: mooseName)
	byType:		Dictionnary of OrderedCollection (key: FAMIXType)  - the orderedCollection is sorted on access
	elements:		OrderedCollection
	sortedCollectionList:		Dictionnary (key: FAMIXType, value: boolean)


Implementation Points
- On access by type, OrderedCollections in byType dictionary are sorted by MooseName to find its type faster. This sort is stored in sortedCollectionList and is invalidated on addition of a new element in the collection



"
Class {
	#name : #MooseGroupRuntimeStorage,
	#superclass : #MooseGroupStorage,
	#type : #variable,
	#instVars : [
		'byName',
		'elements',
		'byType',
		'sortedCollectionList'
	],
	#category : #'Moose-Core'
}

{ #category : #'as yet unclassified' }
MooseGroupRuntimeStorage class >> byTypeDefaultCollection [
	^ OrderedCollection new
]

{ #category : #adding }
MooseGroupRuntimeStorage >> add: anElement [ 
	self privateAdd: anElement.
	self updateCacheOnAddingOf: anElement.
	^anElement
]

{ #category : #adding }
MooseGroupRuntimeStorage >> allEntityTypes [
	^ byType keys
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	^byName at: uniqueName asSymbol ifAbsent: exceptionBlock
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> at: uniqueName withType: aClass ifAbsent: exceptionBlock [
	| s |
	s := uniqueName asSymbol.
	^ (self
		shouldSort: (self selectAllWithType: aClass)
		withBlock: [ :a :b | a mooseName asSymbol <= b mooseName asSymbol ]
		type: aClass)
		findBinary: [ :a | 
			| aName |
			aName := a mooseName asSymbol.
			aName = s
				ifTrue: [ 0 ]
				ifFalse: [ s < aName
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ] ]
		ifNone: exceptionBlock
]

{ #category : #enumerating }
MooseGroupRuntimeStorage >> do: aBlock [ 
	 
	elements do: aBlock
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> elements [ 
	^ elements
]

{ #category : #'initialize-release' }
MooseGroupRuntimeStorage >> initialize: capacity [ 
	 
	byType := Dictionary new: 24.
	sortedCollectionList := Dictionary new: 24.
	byName := IdentityDictionary new: capacity. 
	elements := OrderedCollection new: capacity
]

{ #category : #copying }
MooseGroupRuntimeStorage >> postCopy [  
	super postCopy.
	elements := elements copy.
	byName := byName copy.
	byType := byType copy
]

{ #category : #adding }
MooseGroupRuntimeStorage >> privateAdd: anElement [
	^elements add: anElement
]

{ #category : #removing }
MooseGroupRuntimeStorage >> remove: anElement ifAbsent: exceptionBlock [
	self updateCacheOnRemovalOf: anElement.
	elements remove: anElement.
	^ anElement
]

{ #category : #removing }
MooseGroupRuntimeStorage >> removeAll [ 
	 
	self initialize: 10000
]

{ #category : #private }
MooseGroupRuntimeStorage >> resetMooseNameFor: anEntity [
	anEntity hasUniqueMooseNameInModel
		ifTrue: [
			byName removeKey: anEntity mooseName asSymbol ifAbsent: [ ].
			super resetMooseNameFor: anEntity.
			byName at: anEntity mooseName asSymbol put: anEntity ]
		ifFalse: [ super resetMooseNameFor: anEntity ]
]

{ #category : #enumerating }
MooseGroupRuntimeStorage >> selectAllWithType: aSmalltalkClass [

	^ byType at: aSmalltalkClass ifAbsent: [ self class byTypeDefaultCollection ]
]

{ #category : #private }
MooseGroupRuntimeStorage >> shouldSort: aCollection withBlock: aBlockClosure type: aMooseClass [
	| isSorted |
	isSorted := self sortedCollectionList at: aMooseClass ifAbsentPut: [ false ].
	^ isSorted
		ifTrue: [ aCollection ]
		ifFalse: [ self sortedCollectionList at: aMooseClass put: true.
			aCollection sort: aBlockClosure ]
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> size [ 
	^ elements size
]

{ #category : #private }
MooseGroupRuntimeStorage >> sortedCollectionList [
	^ sortedCollectionList ifNil: [ sortedCollectionList := Dictionary new ]
]

{ #category : #private }
MooseGroupRuntimeStorage >> updateCacheOnAddingOf: anElement [
	| group |
	anElement mooseTypes do: [ :mooseType |
		group := byType
			at: mooseType
			ifAbsentPut: [ self class byTypeDefaultCollection ].
		self sortedCollectionList at: mooseType put: false.
		group add: anElement.].

	anElement hasUniqueMooseNameInModel
		ifTrue: [ byName at: anElement mooseName asSymbol put: anElement ].
	^ anElement
]

{ #category : #private }
MooseGroupRuntimeStorage >> updateCacheOnRemovalOf: anElement [
    | key group |
    key := anElement class.
    group := byType at: key ifAbsent: [ self class byTypeDefaultCollection ].
    group remove: anElement ifAbsent: [ self error: 'Internal storage inconsistency' ].
    anElement hasUniqueMooseNameInModel ifFalse: [ ^anElement ].
    key := anElement mooseName asSymbol.
    byName at: key ifAbsent: 
            [ "In theory, objects are registered under their mooseName,
            however some objects are still registered by their name
            if #resetMooseName was not used when needed"
            self resetMooseNameFor: anElement ].
    byName removeKey: key ifAbsent: [ self error: 'Internal storage inconsistency' ].
    ^anElement
]
