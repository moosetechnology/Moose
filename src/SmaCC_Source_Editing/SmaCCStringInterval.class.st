"
SmaCCStringInterval is a SmaCCInterval that represents a string that is insert into the SmaCCString.

Instance Variables:
	id	<Integer>	a unique id for the operation
	isRemoved	<Boolean>	is this interval removed?
	next	<SmaCCStringInterval>	the next interval in the string
	previous	<SmaCCStringInterval>	the previous interval in the string
	start	<Integer>	the starting location in the string
	stop	<Integer>	the ending location in the string
	string	<String>	the text that we are inserting -- we are only inserting from the start index to the stop index


"
Class {
	#name : #SmaCCStringInterval,
	#superclass : #Object,
	#instVars : [
		'id',
		'start',
		'stop',
		'next',
		'previous',
		'string',
		'isRemoved'
	],
	#category : #'SmaCC_Source_Editing'
}

{ #category : #'instance creation' }
SmaCCStringInterval class >> from: aSmaCCIndex to: aSmaCCIndex2 string: aString [
	^ self new
		start: aSmaCCIndex;
		stop: aSmaCCIndex2;
		string: aString;
		yourself
]

{ #category : #private }
SmaCCStringInterval >> addAllAnnotations: aCollection [
	
]

{ #category : #accessing }
SmaCCStringInterval >> annotations [
	^ #()
]

{ #category : #accessing }
SmaCCStringInterval >> annotationsTo: lastInterval [
	| annotations current |
	annotations := Set new.
	current := self.
	[ annotations addAll: current annotations.
	current ~~ lastInterval ]
		whileTrue: [ current isSentinel
				ifTrue: [ ^ nil ].
			current := current next ].
	^ annotations asOrderedCollection
]

{ #category : #accessing }
SmaCCStringInterval >> asString [
	(self isRemoved or: [ self isEmpty ])
		ifTrue: [ ^ '' ].
	^ string copyFrom: start to: stop
]

{ #category : #private }
SmaCCStringInterval >> beSentinel [
	id := -1.
	next := self.
	previous := self
]

{ #category : #testing }
SmaCCStringInterval >> canBeMergedWith: nextSmaCCStringInterval [
	^ self id = nextSmaCCStringInterval id
		and:
			[ self isRemoved = nextSmaCCStringInterval isRemoved
				and: [ self stop + 1 = nextSmaCCStringInterval start ] ]
]

{ #category : #testing }
SmaCCStringInterval >> containsIndex: anIndex [
	| indexPosition indexId |
	self isSentinel
		ifTrue: [ ^ true ].
	anIndex isInteger
		ifTrue: [ indexPosition := anIndex.
			indexId := 1 ]
		ifFalse: [ indexPosition := anIndex index.
			indexId := anIndex intervalId ].
	^ id = indexId
		and: [ (indexPosition between: start and: stop) or: [ indexPosition = 0 ] ]
]

{ #category : #private }
SmaCCStringInterval >> convertToRemoved [
	| interval |
	(self isRemoved or: [ self isSentinel ])
		ifTrue: [ ^ self ].
	isRemoved := true.
	(previous canBeMergedWith: self)
		ifTrue:
			[ interval := previous.
			interval stop: self stop.
			interval next: next.
			self removed.
			^ interval ].
	(self canBeMergedWith: next)
		ifTrue:
			[ interval := next.
			next start: self start.
			previous next: next.
			self removed.
			^ interval ].
	^ self
]

{ #category : #iterating }
SmaCCStringInterval >> do: aBlock [
	| current |
	current := self.
	[ current isSentinel ]
		whileFalse: [ aBlock value: current.
			current := current next ]
]

{ #category : #accessing }
SmaCCStringInterval >> id [
	^ id
]

{ #category : #accessing }
SmaCCStringInterval >> id: anInteger [
	id := anInteger
]

{ #category : #editing }
SmaCCStringInterval >> insertAfter: aSmaCCInterval [
	self next: aSmaCCInterval next.
	aSmaCCInterval next: self
]

{ #category : #testing }
SmaCCStringInterval >> isEmpty [
	^ start > stop
]

{ #category : #testing }
SmaCCStringInterval >> isRemoved [
	^ isRemoved
]

{ #category : #accessing }
SmaCCStringInterval >> isRemoved: aBoolean [
	isRemoved := aBoolean
]

{ #category : #testing }
SmaCCStringInterval >> isSentinel [
	^ id = -1
]

{ #category : #accessing }
SmaCCStringInterval >> next [
	^ next
]

{ #category : #accessing }
SmaCCStringInterval >> next: aSmaCCInterval [
	next := aSmaCCInterval.
	aSmaCCInterval previous: self
]

{ #category : #private }
SmaCCStringInterval >> nextPutOn: aWriteStream [
	self isRemoved
		ifTrue: [ ^ self ].
	aWriteStream next: self size putAll: string startingAt: start
]

{ #category : #accessing }
SmaCCStringInterval >> previous [
	^ previous
]

{ #category : #accessing }
SmaCCStringInterval >> previous: aSmaCCInterval [
	previous := aSmaCCInterval
]

{ #category : #printing }
SmaCCStringInterval >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: id;
		nextPut: $,;
		print: start;
		nextPut: $-;
		print: stop;
		nextPut: $)
]

{ #category : #private }
SmaCCStringInterval >> removed [
	next := nil.
	previous := nil
]

{ #category : #accessing }
SmaCCStringInterval >> removedString [
	^ string copyFrom: start to: stop
]

{ #category : #accessing }
SmaCCStringInterval >> size [
	self isRemoved
		ifTrue: [ ^ 0 ].
	^ stop - start + 1 max: 0
]

{ #category : #editing }
SmaCCStringInterval >> splitAt: anIndex [
	| new |
	(self isSentinel or: [ anIndex = start ])
		ifTrue: [ ^ self ].
	anIndex > stop
		ifTrue: [ ^ next ].
	new := self copy.
	self stop: anIndex - 1.
	new start: anIndex.
	new insertAfter: self.
	^ new
]

{ #category : #accessing }
SmaCCStringInterval >> start [
	^ start
]

{ #category : #accessing }
SmaCCStringInterval >> start: anInteger [
	start := anInteger
]

{ #category : #accessing }
SmaCCStringInterval >> startIndex [
	self isSentinel
		ifTrue: [ ^ nil ].
	^ self isEmpty
		ifTrue: [ next startIndex ]
		ifFalse: [ SmaCCStringIndex index: start intervalId: id ]
]

{ #category : #accessing }
SmaCCStringInterval >> stop [
	^ stop
]

{ #category : #accessing }
SmaCCStringInterval >> stop: anInteger [
	stop := anInteger
]

{ #category : #accessing }
SmaCCStringInterval >> stopIndex [
	^ SmaCCStringIndex index: stop intervalId: id
]

{ #category : #accessing }
SmaCCStringInterval >> string [
	^ string
]

{ #category : #accessing }
SmaCCStringInterval >> string: aString [
	isRemoved := false.
	string := aString
]
