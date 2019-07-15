"
PPMemento is an internal class used by PPMemoizedParser to cache results and detect left-recursive calls.

Instance Variables:
	result	<Object>	The cached result.
	count	<Integer>	The number of recursive cycles followed.
	
"
Class {
	#name : #PPMemento,
	#superclass : #Object,
	#instVars : [
		'result',
		'count',
		'context'
	],
	#category : #'PetitParser-Core'
}

{ #category : #'instance creation' }
PPMemento class >> new [
	^ self basicNew initialize
]

{ #category : #accessing }
PPMemento >> contextMemento [
	^ context
]

{ #category : #accessing }
PPMemento >> contextMemento: aPPContextMemento [
	context  := aPPContextMemento 

]

{ #category : #'accessing-readonly' }
PPMemento >> count [
	^ count
]

{ #category : #actions }
PPMemento >> increment [
	count := count + 1
]

{ #category : #initialization }
PPMemento >> initialize [
	count := 0
	
]

{ #category : #accessing }
PPMemento >> result [
	^ result
]

{ #category : #accessing }
PPMemento >> result: anObject [
	result := anObject
]
