"
A simple key-value cache that automatically empties when it reaches a maximum size. Uses a reentrant mutex to ensure thread-safety.
"
Class {
	#name : #XMLKeyValueCache,
	#superclass : #XMLAbstractFactory,
	#instVars : [
		'collection',
		'maxSize',
		'mutex'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #testing }
XMLKeyValueCache class >> canBeImplemented [
	^ true
]

{ #category : #defaults }
XMLKeyValueCache class >> defaultMaxSize [
	^ 32
]

{ #category : #'instance creation' }
XMLKeyValueCache class >> maxSize: anInteger [
	^ self implementationNew setMaxSize: anInteger
]

{ #category : #'instance creation' }
XMLKeyValueCache class >> new [
	^ self maxSize: self defaultMaxSize
]

{ #category : #finding }
XMLKeyValueCache class >> noSupportedImplementationFound [
	Error signal: 'No supported key-value cache class available'
]

{ #category : #defaults }
XMLKeyValueCache class >> preferredImplementation [
	^ XMLStandardKeyValueCache
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey [
	^ self
		at: aKey
		ifAbsent: [nil]
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey ifAbsent: aBlock [
	^ self critical: [
		self collection
			at: aKey
			ifAbsent: aBlock]
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey ifAbsentPut: aBlock [
	^ self
		at: aKey
		ifAbsent: [
			self
				at: aKey
				put: aBlock value]
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey ifPresent: aBlock [
	^ self critical: [
		"Gemstone's at:ifAbsentPut: does not use cull:"
		aBlock cull:
			(self collection
				at: aKey
				ifAbsent: [^ nil])]
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey ifPresent: aPresentBlock put: aValueBlock [
	"Looks up the value of aKey and if present, evaluates aPresentBlock
	optionally with it, and if aPresentBlock returns true, replaces the old
	value with the result of evaluating aValueBlock."

	^ self
		at: aKey
		ifPresent: [:value |
			(aPresentBlock cull: value)
				ifTrue: [	
					self
						at: aKey
						put: aValueBlock value]
				ifFalse: [value]]
]

{ #category : #accessing }
XMLKeyValueCache >> at: aKey put: aValue [
	^ self critical: [
		(self collection includesKey: aKey)
			ifFalse: [
				self collection size >= self maxSize
					ifTrue: [self collection removeAll]].
		self collection
			at: aKey
			put: aValue]
]

{ #category : #accessing }
XMLKeyValueCache >> capacity [
	^ self maxSize
]

{ #category : #clearing }
XMLKeyValueCache >> clear [
	self removeAll
]

{ #category : #accessing }
XMLKeyValueCache >> collection [
	self subclassResponsibility
]

{ #category : #defaults }
XMLKeyValueCache >> collectionClass [
	^ Dictionary
]

{ #category : #copying }
XMLKeyValueCache >> copy [
	^ self critical: [self shallowCopy postCopy]
]

{ #category : #'mutual exclusion' }
XMLKeyValueCache >> critical: aBlock [
	"Can be used to lock the cache during one or more operations in aBlock"

	^ self mutex critical: aBlock
]

{ #category : #testing }
XMLKeyValueCache >> includesKey: aKey [
	^ self critical: [self collection includesKey: aKey]
]

{ #category : #testing }
XMLKeyValueCache >> isEmpty [
	^ self size = 0
]

{ #category : #accessing }
XMLKeyValueCache >> keys [
	^ self critical: [self collection keys]
]

{ #category : #enumerating }
XMLKeyValueCache >> keysAndValuesDo: aTwoArgumentBlock [
	self critical: [self collection keysAndValuesDo: aTwoArgumentBlock]
]

{ #category : #enumerating }
XMLKeyValueCache >> keysDo: aBlock [
	self critical: [self collection keysDo: aBlock]
]

{ #category : #accessing }
XMLKeyValueCache >> loadFactor [
	^ (self size / self maxSize) asFraction
]

{ #category : #accessing }
XMLKeyValueCache >> maxSize [
	^ maxSize
]

{ #category : #accessing }
XMLKeyValueCache >> maxSize: anInteger [
	self critical: [| oldMaxSize |
		oldMaxSize := maxSize.
		(maxSize := anInteger) < oldMaxSize
			ifTrue: [self collection removeAll]]
]

{ #category : #private }
XMLKeyValueCache >> mutex [
	^ mutex
]

{ #category : #testing }
XMLKeyValueCache >> notEmpty [
	^ self size > 0
]

{ #category : #copying }
XMLKeyValueCache >> postCopy [
	super postCopy.

	mutex := XMLReentrantMutex new.
	self setCollection: self collection copy.
]

{ #category : #printing }
XMLKeyValueCache >> printOn: aStream [
	| loadFactor |

	super printOn: aStream.

	loadFactor := self loadFactor.
	aStream
		nextPut: $(;
		print: loadFactor numerator;
		nextPut: $/;
		print: loadFactor denominator;
		nextPut: $).
]

{ #category : #removing }
XMLKeyValueCache >> removeAll [
	self critical: [self collection removeAll]
]

{ #category : #removing }
XMLKeyValueCache >> removeKey: aKey [
	"this attempts to remove a key, but to support concurrent removal, it
	does not raise errors if it was already removed"
	^ self critical: [
		self collection
			removeKey: aKey
			ifAbsent: [nil]]
]

{ #category : #removing }
XMLKeyValueCache >> removeKey: aKey ifAbsent: aBlock [
	^ self critical: [
		self collection
			removeKey: aKey
			ifAbsent: aBlock]
]

{ #category : #removing }
XMLKeyValueCache >> removeKey: aKey ifPresent: aBlock [
	"Looks up the value of aKey and if present, evaluates aPresentBlock
	optionally with it, and if aPresentBlock returns true, removes the
	key from the cache and returns its old value."
	^ self
		at: aKey
		ifPresent: [:value |
			(aBlock cull: value)
				ifTrue: [self removeKey: aKey]
				ifFalse: [value]]
]

{ #category : #initialization }
XMLKeyValueCache >> setCollection: aKeyValueCollection [
	self subclassResponsibility
]

{ #category : #initialization }
XMLKeyValueCache >> setMaxSize: anInteger [
	maxSize := anInteger.
	mutex := XMLReentrantMutex new.
	self setCollection: self collectionClass new.
]

{ #category : #accessing }
XMLKeyValueCache >> size [
	^ self collection size
]

{ #category : #accessing }
XMLKeyValueCache >> values [
	^ self critical: [self collection values]
]

{ #category : #enumerating }
XMLKeyValueCache >> valuesDo: aBlock [
	self critical: [self collection valuesDo: aBlock]
]
