"
I am a state that can be use to improve development efficiency. 

I keep the properties and the queries caches in two dictionary. Thus the user can easily flush only one kind of cache during development.
"
Class {
	#name : #MooseDevelopmentState,
	#superclass : #MooseEntityState,
	#instVars : [
		'attributes',
		'entity',
		'propertyCache',
		'queryCache'
	],
	#category : #'Moose-Core'
}

{ #category : #'accessing properties' }
MooseDevelopmentState >> allProperties [
	^ propertyCache values
]

{ #category : #'accessing attributes' }
MooseDevelopmentState >> attributeAt: name ifAbsent: aBlock [ 
	 
	| each | 
	1 
		to: attributes size 
		do: 
			[:n |  
			each := attributes at: n. 
			name == each key ifTrue: [^each value]]. 
	^aBlock value
]

{ #category : #'accessing attributes' }
MooseDevelopmentState >> attributeAt: name ifAbsentPut: aBlock [ 
	 
	| each | 
	1 
		to: attributes size 
		do: 
			[:n |  
			each := attributes at: n. 
			name == each key ifTrue: [
				^each value]]. 
	attributes := attributes copyWith: name -> aBlock value. 
	^attributes last value
]

{ #category : #'accessing attributes' }
MooseDevelopmentState >> attributeAt: name put: value [ 
	 
	| each | 
	1 
		to: attributes size 
		do: 
			[:n |  
			each := attributes at: n. 
			name == each key ifTrue: [^each value: value]]. 
	attributes := attributes copyWith: name -> value. 
	^attributes last value
]

{ #category : #'accessing groups' }
MooseDevelopmentState >> cacheAt: name ifAbsent: aBlock [ 
	 
	^ queryCache at: name ifAbsent: [aBlock value].
	"| each | 
	1 
		to: queryCache size 
		do: 
			[:n |  
			each := queryCache at: n. 
			name == each key ifTrue: [^each value]]. 
	^aBlock value"
]

{ #category : #'accessing groups' }
MooseDevelopmentState >> cacheAt: name ifAbsentPut: aBlock [ 

	^ queryCache at: name ifAbsentPut: aBlock.
	"| each | 
	1 
		to: queryCache size 
		do: 
			[:n |  
			each := queryCache at: n. 
			name == each key ifTrue: [
				^each value]]. 
	queryCache := queryCache copyWith: name -> aBlock value. 
	^queryCache last value"
]

{ #category : #'accessing groups' }
MooseDevelopmentState >> cacheAt: name put: value [ 
	 
	^ queryCache at: name put: value.
	"| each | 
	1 
		to: queryCache  size 
		do: 
			[:n |  
			each := queryCache at: n. 
			name == each key ifTrue: [^each value: value]]. 
	queryCache := queryCache copyWith: name -> value. 
	^queryCache last value"
]

{ #category : #accessing }
MooseDevelopmentState >> entity [

	^ entity
]

{ #category : #accessing }
MooseDevelopmentState >> entity: anObject [

	entity := anObject
]

{ #category : #'accessing groups' }
MooseDevelopmentState >> entityCache [ 
	 
	^queryCache
]

{ #category : #controlling }
MooseDevelopmentState >> flushGroups [ 
	 
	queryCache initialize
]

{ #category : #controlling }
MooseDevelopmentState >> flushProperties [ 
	 
	propertyCache initialize
]

{ #category : #testing }
MooseDevelopmentState >> includesKey: selector [ 
	 
	^propertyCache includesKey: selector
]

{ #category : #'initialize-release' }
MooseDevelopmentState >> initialize: aMooseEntity [ 
	 
	attributes := #(). 
	propertyCache := SmallDictionary new. 
	queryCache := SmallDictionary new.
	entity := aMooseEntity
]

{ #category : #'accessing properties' }
MooseDevelopmentState >> propertyAt: name ifAbsent: aBlock [ 
	 
	^ propertyCache  at: name ifAbsent: [aBlock value].

]

{ #category : #'accessing properties' }
MooseDevelopmentState >> propertyAt: name ifAbsentPut: aBlock [ 
	 
	^ propertyCache  at: name ifAbsentPut: aBlock.

]

{ #category : #'accessing properties' }
MooseDevelopmentState >> propertyAt: name put: value [ 
	 
	^ propertyCache  at: name put: value.

]

{ #category : #'accessing properties' }
MooseDevelopmentState >> removeProperty: name [
	propertyCache removeKey: name ifAbsent: [ ]
]
