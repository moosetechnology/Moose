Class {
	#name : #TRCallableObject,
	#superclass : #TRObject,
	#instVars : [
		'callbacks'
	],
	#category : #'Trachel-Core'
}

{ #category : #callbacks }
TRCallableObject >> addCallback: aCallback [
	callbacks ifNil: [ callbacks := OrderedCollection new ].
	callbacks add: aCallback
]

{ #category : #callbacks }
TRCallableObject >> callbacks [
	callbacks ifNil: [ callbacks := OrderedCollection new ].
	^ callbacks 
]

{ #category : #callbacks }
TRCallableObject >> doWithoutCallbacks: aBlock [
	"Simply evaluate aBlock"
	| oldCallbacks |
	oldCallbacks := callbacks.
	callbacks := #().
	aBlock value.
	callbacks := oldCallbacks
]

{ #category : #callbacks }
TRCallableObject >> hasCallback [
	^ callbacks notNil
]

{ #category : #callbacks }
TRCallableObject >> numberOfCallbacks [
	"Return the number of callbacks registered"
	self hasCallback ifNil: [ ^ 0 ].
	^ self callbacks size
]

{ #category : #callbacks }
TRCallableObject >> removeCallback: aCallback ifAbsent: anErrorBlock [
	self hasCallback ifFalse: [ ^ self ].
	self callbacks remove: aCallback ifAbsent: anErrorBlock
]

{ #category : #callbacks }
TRCallableObject >> triggerCallbacksForAddition [
	"aStep is a point that represents a translation step"
	self hasCallback ifFalse: [ ^ self ].
	self callbacks do: [ :c | 
		c isAddedCallback ifTrue: [ 
			c addShape: self ] ]
]

{ #category : #callbacks }
TRCallableObject >> triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent [ 
	self hasCallback ifFalse: [ ^ self ].
	self callbacks do: [ :c | 
		c isExtentCallback ifTrue: [ 
			c shape: self newExtent: newExtent oldExtent: oldExtent ] ]
]

{ #category : #callbacks }
TRCallableObject >> triggerCallbacksForStep: aStep [
	"aStep is a point that represents a translation step"
	self hasCallback ifFalse: [ ^ self ].
	self callbacks do: [ :c | 
		c isTranslationCallback ifTrue: [ 
			c shape: self step: aStep ] ]
]

{ #category : #callbacks }
TRCallableObject >> triggerRemoveCallbacks [
	"aStep is a point that represents a translation step"
	self hasCallback ifFalse: [ ^ self ].
	self callbacks do: [ :c | 
		c isRemoveCallback ifTrue: [ 
			c removeShape: self ] ]
]
