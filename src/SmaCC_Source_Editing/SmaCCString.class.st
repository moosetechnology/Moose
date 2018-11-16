"
SmaCCString is a special string like object that makes rewriting source code faster. It supports operations to insert and delete text from the middle of strings more efficiently than constructing new strings.

Instance Variables:
	currentId	<Integer>	the id that is used when constructing new SmaCCIntervals
	firstSentinel	<SmaCCStringInterval>	the head of the SmaCCInterval list
	lastSentinel	<SmaCCStringInterval>	the tail of the SmaCCInterval list
	cachedInterval	<SmaCCStringInterval>	the interval where the last action took place -- most likely it or something nearby will the next thing needed


"
Class {
	#name : #SmaCCString,
	#superclass : #Object,
	#instVars : [
		'firstSentinel',
		'lastSentinel',
		'currentId',
		'cachedInterval'
	],
	#category : #'SmaCC_Source_Editing'
}

{ #category : #'instance creation' }
SmaCCString class >> on: aString [
	^ self new
		insert: aString at: 0;
		yourself
]

{ #category : #copying }
SmaCCString >> , aString [
	^ self copy
		append: aString;
		yourself
]

{ #category : #accessing }
SmaCCString >> addAnnotationTo: aSmaCCStringInterval [
	
]

{ #category : #editing }
SmaCCString >> addNewLineWhitespace: aString from: startIndex to: stopIndex [
	| currentInterval next |
	currentInterval := self intervalContaining: startIndex.
	[ currentInterval isSentinel
		ifTrue: [ ^ self ].
	next := currentInterval next.
	currentInterval isRemoved
		ifFalse:
			[ self
				addNewLineWhitespace: aString
				toInterval: currentInterval
				from: startIndex
				to: stopIndex ].
	currentInterval containsIndex: stopIndex ]
		whileFalse: [ currentInterval := next ]
]

{ #category : #editing }
SmaCCString >> addNewLineWhitespace: aString toInterval: currentInterval from: startIndex to: stopIndex [
	| start stop stream next location interval whitespaceInterval |
	interval := currentInterval.
	next := currentInterval next.
	start := (currentInterval containsIndex: startIndex)
		ifTrue: [ self indexFor: startIndex ]
		ifFalse: [ currentInterval start ].
	stop := (currentInterval containsIndex: stopIndex)
		ifTrue: [ self indexFor: stopIndex ]
		ifFalse: [ currentInterval stop ].
	stream := ReadStream
		on: (currentInterval string copyFrom: start to: stop).
	[ stream atEnd ]
		whileFalse:
			[ | char |
			char := stream next.
			char = Character cr
				ifTrue: [ stream peek = Character lf
						ifTrue: [ stream next ] ].
			(char = Character lf or: [ char = Character cr ])
				ifTrue:
					[ location := stream position + start.
					interval := location > stop
						ifTrue: [ next ]
						ifFalse: [ interval splitAt: location ].
					whitespaceInterval := self newIntervalFor: aString.
					interval previous next: whitespaceInterval.
					whitespaceInterval next: interval ] ]
]

{ #category : #editing }
SmaCCString >> addPrefix: aString [
	^ self insert: aString at: self startIndex
]

{ #category : #actions }
SmaCCString >> annotationRangesFor: aSmaCCAnnotation [
	| ranges startIndex current |
	ranges := OrderedCollection new.
	startIndex := 1.
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ (current isRemoved not
				and: [ current annotations includes: aSmaCCAnnotation ])
				ifTrue: [ ranges
						add: (startIndex to: startIndex + current size - 1) ].
			startIndex := startIndex + current size.
			current := current next ].
	^ ranges
]

{ #category : #actions }
SmaCCString >> annotationsInNewRange: range [
	| startIndex first last annotations current |
	annotations := Set new.
	startIndex := 0.
	first := range first.
	last := range isEmpty
		ifTrue: [ first ]
		ifFalse: [ range last ].
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse: [ startIndex > last
				ifTrue: [ ^ annotations asOrderedCollection ].
			startIndex := startIndex + current size.
			startIndex >= first
				ifTrue: [ annotations addAll: current annotations ].
			current := current next ].
	^ annotations asOrderedCollection
]

{ #category : #actions }
SmaCCString >> annotationsInOriginalRange: range [
	| first last |
	first := self intervalContaining: range first.
	last := range isEmpty
		ifTrue: [ first ]
		ifFalse: [ self intervalContaining: range last ].
	^ (first annotationsTo: last) ifNil: [ (last annotationsTo: first) ifNil: [ #() ] ]
]

{ #category : #editing }
SmaCCString >> append: aString [
	| position newInterval str |
	aString isEmpty
		ifTrue: [ ^ self stopIndex ].
	str := (aString isKindOf: SmaCCString)
		ifTrue: [ aString ]
		ifFalse: [ SmaCCString on: aString ].
	str
		intervalsDo:
			[ :each | 
			newInterval := self newIntervalFor: each string.
			newInterval addAllAnnotations: each annotations.
			newInterval start: each start.
			newInterval stop: each stop.
			position isNil
				ifTrue: [ position := newInterval startIndex ].
			newInterval previous: lastSentinel previous.
			newInterval next: lastSentinel.
			newInterval previous next: newInterval.
			lastSentinel previous: newInterval ].
	^ position
]

{ #category : #accessing }
SmaCCString >> asString [
	| stream |
	stream := WriteStream on: (String new: self size).
	firstSentinel next do: [ :each | each nextPutOn: stream ].
	^ stream contents
]

{ #category : #accessing }
SmaCCString >> at: anIndex [
	^ (self intervalContaining: anIndex) string
		at: (self indexFor: anIndex)
]

{ #category : #accessing }
SmaCCString >> basicNextIndex: anIndex [
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex + 1.
	^ (interval containsIndex: newIndex)
		ifTrue: [ newIndex ]
		ifFalse:
			[ interval next isSentinel
				ifTrue: [ self stopIndex + 1 ]
				ifFalse: [ interval next startIndex ] ]
]

{ #category : #accessing }
SmaCCString >> basicPreviousIndex: anIndex [
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex - 1.
	^ ((interval containsIndex: newIndex)
		and: [ (self indexFor: newIndex) ~= 0 ])
		ifTrue: [ newIndex ]
		ifFalse:
			[ interval previous isSentinel
				ifTrue: [ nil ]
				ifFalse: [ interval previous stopIndex ] ]
]

{ #category : #copying }
SmaCCString >> copy [
	| new first last current newCurrent |
	first := last := nil.
	new := self class new.
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ newCurrent := current copy.
			first isNil
				ifTrue: [ first := newCurrent ].
			last notNil
				ifTrue: [ last next: newCurrent ].
			last := newCurrent.
			current := current next ].
	first notNil
		ifTrue: [ new insertFirst: first last: last at: 1 ].
	new setIntervalId.
	^ new
]

{ #category : #copying }
SmaCCString >> copyFrom: startIndex to: stopIndex [
	| result |
	result := self class new.
	self
		copyFrom: startIndex
		to: stopIndex
		into: result
		at: 1.
	^ result
]

{ #category : #private }
SmaCCString >> copyFrom: startIndex to: stopIndex into: aSmaCCString at: anInteger [
	| startInterval stopInterval current newInterval first last |
	startInterval := self intervalContaining: startIndex.
	stopInterval := self intervalContaining: stopIndex.
	current := startInterval.
	last := first := nil.
	[ (current isRemoved or: [ current isSentinel ])
		ifFalse:
			[ newInterval := aSmaCCString newIntervalFor: current string.
			newInterval addAllAnnotations: current annotations.
			newInterval
				start:
					(current == startInterval
						ifTrue: [ self indexFor: startIndex ]
						ifFalse: [ current start ]).
			newInterval
				stop:
					(current == stopInterval
						ifTrue: [ self indexFor: stopIndex ]
						ifFalse: [ current stop ]).
			first isNil
				ifTrue: [ first := newInterval ].
			last notNil
				ifTrue: [ last next: newInterval ].
			last := newInterval ].
	current ~~ stopInterval ]
		whileTrue: [ current isSentinel
				ifTrue: [ ^ '' ].
			current := current next ].
	first isNil
		ifTrue: [ ^ aSmaCCString startIndex ].
	^ aSmaCCString insertFirst: first last: last at: anInteger
]

{ #category : #editing }
SmaCCString >> deleteCharacter: anInteger [
	^ self deleteFrom: anInteger to: anInteger
]

{ #category : #editing }
SmaCCString >> deleteFrom: startIndex to: stopIndex [
	| startInterval atEnd |
	startInterval := self intervalContaining: startIndex.
	startInterval := startInterval splitAt: (self indexFor: startIndex).
	[ atEnd := startInterval containsIndex: stopIndex.
	(atEnd and: [ startInterval stop ~= (self indexFor: stopIndex) ])
		ifTrue: [ startInterval splitAt: (self indexFor: stopIndex) + 1 ].
	cachedInterval := startInterval := self removeInterval: startInterval.
	atEnd or: [ startInterval containsIndex: stopIndex ] ]
		whileFalse: [ startInterval := startInterval next ]
]

{ #category : #editing }
SmaCCString >> deleteUpTo: anIndex [
	self deleteFrom: self startIndex to: anIndex - 1
]

{ #category : #editing }
SmaCCString >> deleteUpToEnd: anIndex [
	self deleteFrom: anIndex to: self stopIndex
]

{ #category : #accessing }
SmaCCString >> deleteWhitespaceAfterIndex: stopPosition [
	| stopIndex |
	stopIndex := self whitespaceEndIndexAfterIndex: stopPosition.
	(stopIndex isNil
		or: [ self isIndex: stopIndex equalTo: stopPosition ])
		ifTrue: [ ^ '' ].
	^ self deleteFrom: (self nextIndex: stopPosition) to: stopIndex
]

{ #category : #accessing }
SmaCCString >> deleteWhitespaceBeforeIndex: startPosition [
	| startIndex |
	startIndex := self whitespaceStartIndexBeforeIndex: startPosition.
	(startIndex isNil
		or: [ self isIndex: startIndex equalTo: startPosition ])
		ifTrue: [ ^ '' ].
	^ self
		deleteFrom: startIndex
		to: (self basicPreviousIndex: startPosition)
]

{ #category : #accessing }
SmaCCString >> indexFor: anIndex [
	^ anIndex isInteger
		ifTrue: [ anIndex ]
		ifFalse: [ anIndex index ]
]

{ #category : #'initialize-release' }
SmaCCString >> initialize [
	super initialize.
	firstSentinel := self intervalClass from: 1 to: 0 string: ''.
	firstSentinel beSentinel.
	lastSentinel := self intervalClass from: 1 to: 0 string: ''.
	lastSentinel beSentinel.
	firstSentinel next: lastSentinel.
	currentId := 0
]

{ #category : #editing }
SmaCCString >> insert: aString at: anInteger [
	| newFirstInterval |
	aString isEmpty
		ifTrue: [ ^ anInteger ].
	(aString isKindOf: SmaCCString)
		ifTrue:
			[ ^ aString
				copyFrom: aString startIndex
				to: aString stopIndex
				into: self
				at: anInteger ]
		ifFalse:
			[ newFirstInterval := self newIntervalFor: aString.
			^ self
				insertFirst: newFirstInterval
				last: newFirstInterval
				at: anInteger ]
]

{ #category : #private }
SmaCCString >> insertFirst: first last: last at: anInteger [
	| interval |
	interval := self intervalContaining: anInteger.
	interval := interval splitAt: (self indexFor: anInteger).
	interval previous next: first.
	last next: interval.
	^ first startIndex
]

{ #category : #private }
SmaCCString >> intervalClass [
	^ SmaCCStringInterval
]

{ #category : #private }
SmaCCString >> intervalContaining: anIndex [
	| prev next |
	(cachedInterval isNil or: [ cachedInterval isSentinel ])
		ifTrue: [ prev := lastSentinel previous.
			next := firstSentinel next ]
		ifFalse:
			[ (cachedInterval containsIndex: anIndex)
				ifTrue: [ ^ cachedInterval ].
			prev := cachedInterval previous.
			next := cachedInterval next ].
	[ prev isSentinel not or: [ next isSentinel not ] ]
		whileTrue:
			[ (prev isSentinel not and: [ prev containsIndex: anIndex ])
				ifTrue: [ ^ cachedInterval := prev ].
			(next isSentinel not and: [ next containsIndex: anIndex ])
				ifTrue: [ ^ cachedInterval := next ].
			prev := prev previous.
			next := next next ].
	^ lastSentinel
]

{ #category : #private }
SmaCCString >> intervalsDo: aBlock [
	| current |
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ current isRemoved
				ifFalse: [ aBlock value: current ].
			current := current next ]
]

{ #category : #testing }
SmaCCString >> isEmpty [
	firstSentinel next
		do: [ :each | 
			each isEmpty
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #private }
SmaCCString >> isIndex: aIndex equalTo: bIndex [
	aIndex = bIndex
		ifTrue: [ ^ true ].
	aIndex class = bIndex class
		ifTrue: [ ^ false ].
	^ aIndex isInteger
		ifTrue: [ bIndex intervalId = 1 and: [ aIndex = bIndex index ] ]
		ifFalse:
			[ bIndex isInteger
				and: [ aIndex intervalId = 1 and: [ aIndex index = bIndex ] ] ]
]

{ #category : #testing }
SmaCCString >> isModified [
	^ firstSentinel next ~~ lastSentinel previous
]

{ #category : #testing }
SmaCCString >> isRemoved: anIndex [
	| interval |
	interval := self intervalContaining: anIndex.
	^ interval isSentinel or: [ interval isRemoved ]
]

{ #category : #editing }
SmaCCString >> moveFrom: fromIndex to: toIndex after: newIndex [
	self
		moveFrom: fromIndex
		to: toIndex
		location: newIndex
		before: false
]

{ #category : #editing }
SmaCCString >> moveFrom: fromIndex to: toIndex before: newIndex [
	self
		moveFrom: fromIndex
		to: toIndex
		location: newIndex
		before: true
]

{ #category : #editing }
SmaCCString >> moveFrom: fromIndex to: toIndex location: newIndex before: aBoolean [
	| startInterval stopInterval newInterval currentInterval afterInterval |
	startInterval := self intervalContaining: fromIndex.
	startInterval := startInterval splitAt: (self indexFor: fromIndex).
	currentInterval := startInterval.
	[ currentInterval containsIndex: toIndex ]
		whileFalse:
			[ currentInterval isSentinel
				ifTrue: [ ^ self ].
			(currentInterval containsIndex: newIndex)
				ifTrue: [ ^ self ].
			currentInterval := currentInterval next ].
	stopInterval := currentInterval.
	(stopInterval containsIndex: newIndex)
		ifTrue: [ newIndex < toIndex
				ifTrue: [ ^ self ] ].
	stopInterval := (stopInterval splitAt: (self indexFor: toIndex) + 1)
		previous.
	newInterval := self intervalContaining: newIndex.
	afterInterval := aBoolean
		ifTrue: [ newInterval splitAt: (self indexFor: newIndex) ]
		ifFalse:
			[ (newInterval containsIndex: newIndex)
				ifTrue: [ newInterval splitAt: (self indexFor: newIndex) + 1 ]
				ifFalse: [ newInterval next ] ].
	startInterval previous next: stopInterval next.
	afterInterval previous next: startInterval.
	stopInterval next: afterInterval
]

{ #category : #private }
SmaCCString >> newIntervalFor: aString [
	| newInterval |
	newInterval := self intervalClass
		from: 1
		to: aString size
		string: aString.
	currentId := currentId + 1.
	newInterval id: currentId.
	^ newInterval
]

{ #category : #accessing }
SmaCCString >> nextIndex: anIndex [
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex + 1.
	[ (interval isRemoved not and: [ interval containsIndex: newIndex ])
		ifTrue: [ ^ newIndex ]
		ifFalse:
			[ interval := interval next.
			newIndex := interval startIndex.
			newIndex isNil
				ifTrue: [ ^ self stopIndex + 1 ] ] ] repeat
]

{ #category : #accessing }
SmaCCString >> node [
	^ nil
]

{ #category : #accessing }
SmaCCString >> node: aSmaCCParseNode [
	
]

{ #category : #'initialize-release' }
SmaCCString >> on: aString [
	| firstInterval |
	firstInterval := self intervalClass
		from: 1
		to: aString size
		string: aString.
	firstInterval id: 1.
	currentId := 1.
	firstSentinel next: firstInterval.
	firstInterval next: lastSentinel
]

{ #category : #accessing }
SmaCCString >> previousIndex: anIndex [
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex - 1.
	[ (interval isRemoved not
		and:
			[ (interval containsIndex: newIndex)
				and: [ (self indexFor: newIndex) ~= 0 ] ])
		ifTrue: [ ^ newIndex ]
		ifFalse:
			[ interval previous isSentinel
				ifTrue: [ ^ nil ]
				ifFalse: [ interval := interval previous.
					newIndex := interval stopIndex ] ] ] repeat
]

{ #category : #editing }
SmaCCString >> removeInterval: startInterval [
	^ startInterval convertToRemoved
]

{ #category : #editing }
SmaCCString >> replaceFrom: startIndex to: stopIndex with: aString [
	| newIndex |
	newIndex := self insert: aString at: startIndex.
	self deleteFrom: startIndex to: stopIndex.
	^ newIndex
]

{ #category : #accessing }
SmaCCString >> rule [
	^ nil
]

{ #category : #accessing }
SmaCCString >> rule: aSmaCCRewrite [
	
]

{ #category : #private }
SmaCCString >> setIntervalId [
	firstSentinel next
		do: [ :each | currentId := currentId max: each id ]
]

{ #category : #accessing }
SmaCCString >> size [
	| current length |
	length := 0.
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse: [ length := length + current size.
			current := current next ].
	^ length
]

{ #category : #accessing }
SmaCCString >> startIndex [
	^ firstSentinel next isSentinel
		ifTrue: [ 0 ]
		ifFalse: [ firstSentinel next startIndex ]
]

{ #category : #accessing }
SmaCCString >> startOfLineWhitespaceBeforeIndex: startPosition [
	| startIndex |
	startIndex := self
		startOfLineWhitespaceStartIndexBeforeIndex: startPosition.
	startIndex isNil
		ifTrue: [ ^ '' ].
	^ (self
		copyFrom: startIndex
		to: (self basicPreviousIndex: startPosition)) asString
]

{ #category : #accessing }
SmaCCString >> startOfLineWhitespaceStartIndexBeforeIndex: startPosition [
	| stopIndex currentIndex position |
	position := startPosition.
	position isNil
		ifTrue: [ ^ nil ].
	stopIndex := self previousIndex: position.
	stopIndex isNil
		ifTrue: [ ^ nil ].
	currentIndex := stopIndex.
	[ currentIndex notNil
		and:
			[ | char |
			char := self at: currentIndex.
			char isSeparator
				and: [ char ~= Character cr and: [ char ~= Character lf ] ] ] ]
		whileTrue: [ currentIndex := self previousIndex: currentIndex ].
	^ currentIndex isNil
		ifTrue: [ self startIndex ]
		ifFalse: [ self basicNextIndex: currentIndex ]
]

{ #category : #accessing }
SmaCCString >> stopIndex [
	^ lastSentinel previous isSentinel
		ifTrue: [ 0 ]
		ifFalse: [ lastSentinel previous stopIndex ]
]

{ #category : #accessing }
SmaCCString >> stringIndexFor: anIndex [
	| interval result position |
	interval := self intervalContaining: anIndex.
	result := (interval isSentinel or: [ interval isRemoved ])
		ifTrue: [ 0 ]
		ifFalse: [ position := anIndex isInteger
				ifTrue: [ anIndex ]
				ifFalse: [ anIndex index ].
			interval start > position
				ifTrue: [ 0 ]
				ifFalse: [ interval stop < position
						ifTrue: [ interval stop - interval start + 1 ]
						ifFalse: [ position - interval start + 1 ] ] ].
	[ interval := interval previous.
	interval isSentinel ]
		whileFalse: [ interval isRemoved
				ifFalse: [ result := result + (interval stop - interval start + 1) ] ].
	^ result
]

{ #category : #accessing }
SmaCCString >> whitespaceAfterIndex: stopPosition [
	| stopIndex |
	stopIndex := self whitespaceEndIndexAfterIndex: stopPosition.
	stopIndex isNil
		ifTrue: [ ^ '' ].
	^ (self copyFrom: (self basicNextIndex: stopPosition) to: stopIndex)
		asString
]

{ #category : #accessing }
SmaCCString >> whitespaceBeforeIndex: startPosition [
	| startIndex |
	startIndex := self whitespaceStartIndexBeforeIndex: startPosition.
	startIndex isNil
		ifTrue: [ ^ '' ].
	^ (self
		copyFrom: startIndex
		to: (self basicPreviousIndex: startPosition)) asString
]

{ #category : #accessing }
SmaCCString >> whitespaceEndIndexAfterIndex: stopPosition [
	| currentIndex position startIndex stopIndex |
	position := stopPosition.
	position isNil
		ifTrue: [ ^ nil ].
	startIndex := self nextIndex: position.
	startIndex isNil
		ifTrue: [ ^ nil ].
	currentIndex := startIndex.
	stopIndex := self stopIndex + 1.
	[ currentIndex notNil
		and:
			[ currentIndex ~= stopIndex
				and: [ (self at: currentIndex) isSeparator ] ] ]
		whileTrue: [ currentIndex := self nextIndex: currentIndex ].
	(currentIndex isNil or: [ currentIndex = stopIndex ])
		ifTrue: [ ^ self stopIndex ].
	[ currentIndex := self basicPreviousIndex: currentIndex.
	(self isIndex: stopPosition equalTo: currentIndex)
		or: [ (self isRemoved: currentIndex) not ] ] whileFalse.
	^ currentIndex
]

{ #category : #accessing }
SmaCCString >> whitespaceStartIndexBeforeIndex: startPosition [
	| stopIndex currentIndex position |
	position := startPosition.
	position isNil
		ifTrue: [ ^ nil ].
	stopIndex := self previousIndex: position.
	stopIndex isNil
		ifTrue: [ ^ nil ].
	currentIndex := stopIndex.
	[ currentIndex notNil and: [ (self at: currentIndex) isSeparator ] ]
		whileTrue: [ currentIndex := self previousIndex: currentIndex ].
	currentIndex isNil
		ifTrue: [ ^ self startIndex ].
	[ currentIndex := self basicNextIndex: currentIndex.
	(self isIndex: startPosition equalTo: currentIndex)
		or: [ (self isRemoved: currentIndex) not ] ] whileFalse.
	^ currentIndex
]
