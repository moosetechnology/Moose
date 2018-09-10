"
I cache values being read and written without touching the model. When committing changes, the modifications will be propagated to the model all at once.
"
Class {
	#name : #MACachedMemento,
	#superclass : #MAMemento,
	#instVars : [
		'cache'
	],
	#category : #'Magritte-Model-Memento'
}

{ #category : #testing }
MACachedMemento class >> isAbstract [
	^ false
]

{ #category : #accessing }
MACachedMemento >> cache [
	^ cache
]

{ #category : #actions }
MACachedMemento >> commit [
	super commit.
	self push: self cache.
	self reset
]

{ #category : #testing }
MACachedMemento >> hasChanged [
	"Answer ==true==, if the cached data is different to the data in the model."

	^ self isDifferent: self cache to: self pullRaw
]

{ #category : #private }
MACachedMemento >> readUsing: aDescription [
	^ self cache at: aDescription
]

{ #category : #actions }
MACachedMemento >> reset [
	super reset.
	self setCache: self pull
]

{ #category : #initialization }
MACachedMemento >> setCache: aDictionary [
	cache := aDictionary
]

{ #category : #private }
MACachedMemento >> write: anObject using: aDescription [
	self cache at: aDescription put: anObject
]
