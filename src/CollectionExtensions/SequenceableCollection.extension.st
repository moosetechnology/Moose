Extension { #name : #SequenceableCollection }

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> pairsDistanceFrom: aSequenceableCollection [
	
	self deprecated: 'Please use pairsSimilarityWith:'.
	^ self pairsSimilarityWith: aSequenceableCollection
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> pairsSimilarityWith: aSequenceableCollection [
	
	"
		Examples:
		'1234' pairsSimilarityWith: '2234' ==> (2/3)
		'1234' pairsSimilarityWith: '123' ==>  (4/5)
		'1234' pairsSimilarityWith: '5678' ==> 0
	"
	| set1 set2 |
	set1 := Set new.
	set2 := Set new.
	self overlappingPairsDo: [:a :b | 
		set1 add: a -> b].
	aSequenceableCollection overlappingPairsDo: [:a :b | 
		set2 add: a -> b].
	^ 2 * (set1 intersection: set2) size / (set1 size + set2 size)
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> piecesCutWhere: testBlock do: enumerationBlock [ 
	"Evaluate testBlock for successive pairs of the receiver elements,
	breaking the receiver into pieces between elements where
	the block evaluated to true, and evaluate enumerationBlock
	with each of those pieces."
	"'A sentence. Another sentence... Yet another sentence.'
		piecesCutWhere: [:each :next | each = $. and: [next = Character space]] 
		do: [:each | Transcript show: each printString; cr]"

	| start prevElem nextElem size |
	self isEmpty ifTrue: [^self].
	prevElem := self at: (start := 1).
	2 to: (size := self size) do:
		[:index|
		 nextElem := self at: index.
		(testBlock value: prevElem value: nextElem) ifTrue: 
			[enumerationBlock value: (self copyFrom: start to: index - 1).
			 start := index].
		prevElem := nextElem].
	enumerationBlock value: (self copyFrom: start to: size)
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> runsFailing: aBlock [
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which
	the block returned false. Return an OrderedCollection of those runs."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsFailing: [:each | each = $\] "

	^self runsSatisfying: [:each | (aBlock value: each) not]
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> runsSatisfying: testBlock [
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned true. Return an OrderedCollection of those subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsSatisfying: [:each | each ~= $\] "

	| runs |
	runs := OrderedCollection new.
	self runsSatisfying: testBlock do: [:each | runs add: each].
	^runs
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> runsSatisfying: testBlock do: enumerationBlock [ 
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned true, and evaluate enumerationBlock with each of those 
	subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsSatisfying: [:each | each ~= $\] 
		do: [:each | Transcript show: each; cr]"

	| size start wasInside nowInside |
	start := 1.
	wasInside := false.
	1 to: (size := self size) do:
		[:index|
		 nowInside := testBlock value: (self at: index).
		 nowInside ~~ wasInside ifTrue:
			[wasInside := nowInside.
			 nowInside
				ifTrue: [start := index]
				ifFalse: [enumerationBlock value: (self copyFrom: start to: index - 1)]]].
	wasInside ifTrue: [enumerationBlock value: (self copyFrom: start to: size)]
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> shuffle: times [
	self deprecated: 'Use #shuffleBy: that is includes in Pharo by default.' transformWith: '`@receiver shuffle: `@statements' -> '`@receiver shuffleBy: `@statements'.
	self shuffleBy: times
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> sliceFrom: startIndex [

	"Answers a copy of a subset of the receiver, starting from element at start index 
	up to the end of the collection.

	Comfortable alternative to stupid copyFrom:to: method.
	See also comment on sliceFrom:to:"

	^self sliceFrom: startIndex to: self size
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> sliceFrom: startIndex to: endIndex [

	"Answers a copy of a subset of the receiver, starting from element at start index
	until element at end index.

	Comfortable alternative to stupid copyFrom:to: method.
	If the start or end index is negative, the index will be counted from the end of the collection.

	Note: this method does NEVER throw a SubscriptOutOfBoundsError. If the indexes are
	too large or start is greater than end, then an empty collection will be returned."

	| start end |

	start := 1 max:
		(startIndex positive ifTrue: [startIndex] ifFalse: [self size + startIndex +1]).

	end := self size min: 
		(endIndex positive ifTrue: [endIndex] ifFalse: [self size + endIndex]).

	((start > end) or: [end <= 0]) ifTrue: [^self copyEmpty: 0].
	^self copyFrom: start to: end
]

{ #category : #'*CollectionExtensions' }
SequenceableCollection >> sliceTo: endIndex [
	"Answer a copy of a subset of the receiver, starting from first element 
	up to element at endIndex."

	^self sliceFrom: 1 to: endIndex
]
