"
I am a state keeping properties and queries cache in the same dictionary. 

The downside is that we cannot flush only one kind of cache.

The upside is that I use less memory. Since each MooseEntity have a state, it has a real impact in the end. 
"
Class {
	#name : #MooseMemoryEfficientState,
	#superclass : #MooseEntityState,
	#instVars : [
		'attributes',
		'entity',
		'propertyCache'
	],
	#category : #'Moose-Core'
}

{ #category : #'accessing properties' }
MooseMemoryEfficientState >> allProperties [
	^ propertyCache values
]

{ #category : #'accessing attributes' }
MooseMemoryEfficientState >> attributeAt: name ifAbsent: aBlock [
	1 to: attributes size do: [ :n | 
		name == (attributes at: n) key
			ifTrue: [ ^ (attributes at: n) value ] ].
	^ aBlock value
]

{ #category : #'accessing attributes' }
MooseMemoryEfficientState >> attributeAt: name ifAbsentPut: aBlock [
	1 to: attributes size do: [ :n | 
		name == (attributes at: n) key
			ifTrue: [ ^ (attributes at: n) value ] ].
	attributes := attributes copyWith: name -> aBlock value.
	^ attributes last value
]

{ #category : #accessing }
MooseMemoryEfficientState >> attributeAt: name put: value [
	1 to: attributes size do: [ :n | 
		name == (attributes at: n) key
			ifTrue: [ ^ (attributes at: n) value: value ] ].
	attributes := attributes copyWith: name -> value.
	^ attributes last value
]

{ #category : #accessing }
MooseMemoryEfficientState >> attributes [
	^ attributes
]

{ #category : #accessing }
MooseMemoryEfficientState >> cacheAt: name ifAbsent: aBlock [
	^ propertyCache at: name ifAbsent: [ aBlock value ]
]

{ #category : #accessing }
MooseMemoryEfficientState >> cacheAt: name ifAbsentPut: aBlock [
	^ propertyCache at: name ifAbsentPut: aBlock
]

{ #category : #accessing }
MooseMemoryEfficientState >> cacheAt: name put: value [
	^ propertyCache at: name put: value
]

{ #category : #accessing }
MooseMemoryEfficientState >> entity [
	^ entity
]

{ #category : #accessing }
MooseMemoryEfficientState >> entity: anObject [
	entity := anObject
]

{ #category : #'accessing groups' }
MooseMemoryEfficientState >> entityCache [
	^ propertyCache
]

{ #category : #controlling }
MooseMemoryEfficientState >> flushGroups [
	"In this state both groups and properties are in the same cache."

	self flushProperties
]

{ #category : #controlling }
MooseMemoryEfficientState >> flushProperties [
	propertyCache initialize
]

{ #category : #testing }
MooseMemoryEfficientState >> includesKey: selector [
	^ propertyCache includesKey: selector
]

{ #category : #'initialize-release' }
MooseMemoryEfficientState >> initialize: aMooseEntity [
	attributes := #().
	propertyCache := SmallDictionary new.
	entity := aMooseEntity
]

{ #category : #'accessing properties' }
MooseMemoryEfficientState >> propertyAt: name ifAbsent: aBlock [
	^ propertyCache at: name ifAbsent: [ aBlock value ]
]

{ #category : #'accessing properties' }
MooseMemoryEfficientState >> propertyAt: name ifAbsentPut: aBlock [
	^ propertyCache at: name ifAbsentPut: aBlock
]

{ #category : #'accessing properties' }
MooseMemoryEfficientState >> propertyAt: name put: value [
	^ propertyCache at: name put: value
]

{ #category : #'accessing properties' }
MooseMemoryEfficientState >> removeProperty: name [
	propertyCache removeKey: name ifAbsent: [  ]
]
