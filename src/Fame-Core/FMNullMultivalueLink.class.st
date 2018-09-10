Class {
	#name : #FMNullMultivalueLink,
	#superclass : #Collection,
	#instVars : [
		'selector',
		'owner',
		'opposite'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMNullMultivalueLink class >> on: anOwner opposite: anOpposite selector: aSelector [ 
	^self new
		with: anOwner opposite: anOpposite selector: aSelector;
		yourself
		
]

{ #category : #copying }
FMNullMultivalueLink >> , aCollection [
	^ self asOrderedCollection , aCollection
]

{ #category : #accessing }
FMNullMultivalueLink >> add: anElement [
	self noMoreNull add: anElement
]

{ #category : #accessing }
FMNullMultivalueLink >> at: anIndex [
	^self errorSubscriptBounds: anIndex
]

{ #category : #accessing }
FMNullMultivalueLink >> byName: aName ifAbsent: aBlock [
	^aBlock value
]

{ #category : #enumerating }
FMNullMultivalueLink >> do: aBlock [
]

{ #category : #accessing }
FMNullMultivalueLink >> first [
	^self errorSubscriptBounds: 1	
]

{ #category : #testing }
FMNullMultivalueLink >> isEmpty [
	^ true
]

{ #category : #testing }
FMNullMultivalueLink >> isNotEmpty [
	^ false
]

{ #category : #accessing }
FMNullMultivalueLink >> last [
	^self errorSubscriptBounds: 0
]

{ #category : #accessing }
FMNullMultivalueLink >> noMoreNull [
	^ self owner instVarNamed: self selector put: (FMMultivalueLink on: self owner opposite: self opposite)
]

{ #category : #accessing }
FMNullMultivalueLink >> opposite [
	^ opposite
]

{ #category : #accessing }
FMNullMultivalueLink >> owner [
	^ owner
]

{ #category : #printing }
FMNullMultivalueLink >> printOn: aStream [
	self asArray printOn: aStream
]

{ #category : #removing }
FMNullMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [
	^exceptionBlock value
]

{ #category : #accessing }
FMNullMultivalueLink >> second [
	^self errorSubscriptBounds: 2
]

{ #category : #accessing }
FMNullMultivalueLink >> selector [
	^ selector
]

{ #category : #accessing }
FMNullMultivalueLink >> size [
	^0
]

{ #category : #accessing }
FMNullMultivalueLink >> species [
	^ OrderedCollection 
]

{ #category : #accessing }
FMNullMultivalueLink >> third [
	^self errorSubscriptBounds: 3
]

{ #category : #private }
FMNullMultivalueLink >> unsafeAdd: anElement [
	^self noMoreNull unsafeAdd: anElement
]

{ #category : #private }
FMNullMultivalueLink >> unsafeRemove: anElement [

]

{ #category : #accessing }
FMNullMultivalueLink >> value [
	^self
]

{ #category : #accessing }
FMNullMultivalueLink >> value: aCollection [
	aCollection ifEmpty: [ ^self ].
	^self noMoreNull value: aCollection
]

{ #category : #private }
FMNullMultivalueLink >> with: anOwner opposite: anOpposite selector: aSelector [

	self assert: anOpposite numArgs = 1.
	owner := anOwner.
	opposite := anOpposite.
	selector := aSelector
]

{ #category : #enumerating }
FMNullMultivalueLink >> withIndexDo: aBlock [ 
]
