"
frequency distrubution of a collection.

number of classes defined by default in #defaultNumberOfIntervals, a common calcul to have an optimized number of classes.

"
Class {
	#name : #RTDistribution,
	#superclass : #RTObject,
	#instVars : [
		'objects',
		'numberMax',
		'nbOfIntervals',
		'numberMin',
		'interval',
		'strategyBlock',
		'metric',
		'numbers',
		'sorted'
	],
	#category : #'Roassal2-Utility'
}

{ #category : #public }
RTDistribution class >> on: anArray [ 
	^ self new on: anArray
]

{ #category : #computing }
RTDistribution >> amountOfDifferentValues [
	^ self objects asSet size
]

{ #category : #public }
RTDistribution >> annotatedFrequency [
	"Return a list of elements, each following the template:
	{numberOfV . v} "
	| fr result |
	
	self sortObjectsAndDefineNumbers.
	fr := self frequencyMin: self numbers min max: self numbers max amountOfIntervals: self defaultNumberOfIntervals.
	
	result := fr collect: [ :f | Array with: f size with: f ].
	
	^ result asArray
]

{ #category : #public }
RTDistribution >> annotatedFrequencyMin: numMin max: numMax amountOfIntervals: aNbOfIntervals [
	"	Return a list of elements, each following the template:
	{numberOfElementOfV . V} "
	| fr result |	

	fr := self frequencyMin: numMin max: numMax amountOfIntervals: aNbOfIntervals.
	
	result := fr collect: [ :f | Array with: f size with: f ].
	
	^ result asArray
	
]

{ #category : #public }
RTDistribution >> annotatedFrequencyWithAmountOfIntervals: aSmallInteger [ 
	
	self sortObjectsAndDefineNumbers.	
	^ self annotatedFrequencyMin: self numbers min max: self numbers max amountOfIntervals: aSmallInteger
]

{ #category : #public }
RTDistribution >> defaultMetric [
	"This block define the metric to apply to the object"
	
	self metric ifNil: [ 
		(self objects first isKindOf: Number) ifTrue: [ 
			self metric: #yourself ] ifFalse: [ self metric: [:o | o hash] ]
		]
]

{ #category : #computing }
RTDistribution >> defaultNumberOfIntervals [
	^ (self numbers size) log * 3.3 + 1 
]

{ #category : #public }
RTDistribution >> defaultStrategyBlock [
	"This block define which bucket to store in, a given number"
	self strategyBlock: 
		[ :obj |
			|number|
			number := (self metric rtValue: obj).
			number = self numberMax
				ifTrue: self nbOfIntervals
				ifFalse: [ ((number - self numberMin) / self interval) floor + 1] 
				].
]

{ #category : #public }
RTDistribution >> deprecatedAnnotatedFrequencyMin: numMin max: numMax amountOfIntervals: aNbOfIntervals [
	"Return a list of elements, each following the template:
	{ c1 . c2 . elements that are between c1 and c2 }
	{ c2 . c3 . elements that are between c2 and c3 }
	...
	
	We have c1 <= c2 <= c3 <= ...
	c1 = numberMin
	cN = numberMax
	N = nbOfIntervals
	 "
	| running tmp result |
	numbers := numbers sort.
	self numberMax: numMax.
	self numberMin: numMin.
	self nbOfIntervals: aNbOfIntervals.
	interval := ((numberMax + 1 - numberMin) / nbOfIntervals).
	running := numberMin.
	
	tmp := numbers copy.
	result := OrderedCollection new.
	[ running asFloat <= numberMax ] whileTrue: [ 
		| c |
		c := tmp select: [ :v | v >= running and: [ v < (running + interval) ]].
		result add: (Array with: running with: interval + running with: c asArray).
		tmp := tmp copyWithoutAll: c.
		running := running + interval ].
	
	^ result asArray
	
]

{ #category : #public }
RTDistribution >> frequency [

	self sortObjectsAndDefineNumbers.
	^ self frequencyWithAmountOfIntervals: self defaultNumberOfIntervals.
]

{ #category : #public }
RTDistribution >> frequencyMin: numMin max: numMax amountOfIntervals: aNbOfIntervals [
	| tmp result bucketFor |
	
	self sorted ifFalse: [self sortObjectsAndDefineNumbers].
	
	self numberMax: numMax.
	self numberMin: numMin.
	self nbOfIntervals: aNbOfIntervals.
	
	self interval: (self numberMax - self numberMin) / (self nbOfIntervals floor).

	bucketFor := self strategyBlock.
	tmp := self objects copy.
	result := (1 to: self nbOfIntervals) collect: [ :i | OrderedCollection new ].
	tmp do: [ :obj | (result at: (bucketFor value: obj) asInteger) add: obj ].
	^ result asArray
]

{ #category : #public }
RTDistribution >> frequencyWithAmountOfIntervals: aSmallInteger [ 
	
	self sortObjectsAndDefineNumbers.
	^ self frequencyMin: self numbers min max: self numbers max amountOfIntervals: aSmallInteger
]

{ #category : #public }
RTDistribution >> initialize [
	super initialize.
	self defaultStrategyBlock.
	self sorted: false.
]

{ #category : #public }
RTDistribution >> interval [
	^ interval
]

{ #category : #public }
RTDistribution >> interval: aSize [
	interval := aSize
]

{ #category : #public }
RTDistribution >> metric [
	"This block define the metric to apply to the object"
	^ metric
]

{ #category : #public }
RTDistribution >> metric: aBlockOrSymbol [
	"This block define the metric to apply to the object"
	metric := aBlockOrSymbol.

]

{ #category : #public }
RTDistribution >> nbOfIntervals [
	^ nbOfIntervals 
]

{ #category : #public }
RTDistribution >> nbOfIntervals: aNumber [
	nbOfIntervals := aNumber 
]

{ #category : #public }
RTDistribution >> numberMax [
	^ numberMax
]

{ #category : #public }
RTDistribution >> numberMax: aNumber [
	numberMax := aNumber 
]

{ #category : #public }
RTDistribution >> numberMin [
	^ numberMin 
]

{ #category : #public }
RTDistribution >> numberMin: aNumber [
	numberMin := aNumber 
]

{ #category : #public }
RTDistribution >> numbers [
	^ numbers 
]

{ #category : #public }
RTDistribution >> numbers: aCollectionOfNumbers [
	numbers := aCollectionOfNumbers 
]

{ #category : #public }
RTDistribution >> objects [
	^ objects
]

{ #category : #public }
RTDistribution >> objects: aCollectionOfObjects [
	objects := aCollectionOfObjects
]

{ #category : #public }
RTDistribution >> on: collectionOfObjects [
	self assert: (collectionOfObjects isNotEmpty).
	self objects: collectionOfObjects.
	

]

{ #category : #public }
RTDistribution >> sortObjectsAndDefineNumbers [
	self defaultMetric.
	self objects: (self objects copy sort: [ :o1 :o2 | (self metric rtValue: o1) < (self metric rtValue: o2)  ]).
	self numbers: (self objects collect: [ :o | self metric rtValue: o ]). 	
	self sorted: true.

]

{ #category : #public }
RTDistribution >> sorted [
	^ sorted
]

{ #category : #public }
RTDistribution >> sorted: aBoolean [
	sorted := aBoolean
]

{ #category : #public }
RTDistribution >> strategyBlock [
	^ strategyBlock
]

{ #category : #public }
RTDistribution >> strategyBlock: aBlock [
"This block define which bucket to store in, a given number"
	strategyBlock := aBlock 
]
