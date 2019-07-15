"
A scale of elements is discretized into buckets where elements of each bucket is associated to an element. The buckets are formed by creating partitions uniformly.

"
Class {
	#name : #RTBucketColor,
	#superclass : #RTAbstractNormalizer,
	#instVars : [
		'colorScheme',
		'numberOfBuckets',
		'scope',
		'buckets'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #examples }
RTBucketColor class >> example [
	
	|n elements view|
	n := RTBucketColor numberOfColors: 5 command: #asInteger scope: ($a to: $z).
	n colorScheme: 'Blues'.
	elements := (RTBox new size: 20; color: n) elementsOn: ($a to: $z).
	view := RTView new.
	view addAll: elements.
	RTGridLayout on: view elements.
	^ view
]

{ #category : #examples }
RTBucketColor class >> example1 [
	
	|n elements view |
	n := RTBucketColor numberOfColors: 5 scope: (1 to: 35).
	elements := (RTBox new size: 20; color: n) elementsOn: (1 to: 30).
	view := RTView new.
	view addAll: elements.
	RTGridLayout on: view elements.
	^ view

]

{ #category : #public }
RTBucketColor class >> numberOfColors: anInteger command: aSymboOrBlock  scope: aCollection [

	^ self new
		numberOfBuckets: anInteger;
		command: aSymboOrBlock;
		scope: aCollection.
]

{ #category : #public }
RTBucketColor class >> numberOfColors: anInteger scope: aCollection [

	^ self numberOfColors: anInteger command: #yourself  scope: aCollection
]

{ #category : #'as yet unclassified' }
RTBucketColor >> bucketIndexOf: anObject [

	|value |
	value := command value: anObject.
	^ (self buckets collect: #first) detect: [ :step | value <= step ]. 
	
]

{ #category : #'as yet unclassified' }
RTBucketColor >> buckets [

	^ buckets ifEmpty: [ self initializeBuckets. buckets ]
]

{ #category : #'as yet unclassified' }
RTBucketColor >> colorScheme: aString [

	colorScheme := aString.
]

{ #category : #'as yet unclassified' }
RTBucketColor >> defaultPalette [

	^ RTColorPalette diverging colors: numberOfBuckets scheme:'RdBu'
]

{ #category : #initialize }
RTBucketColor >> initialize [

	super initialize.
	buckets := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
RTBucketColor >> initializeBuckets [
	
	|values min max delta  |
	values := scope collect: [:v | command rtValue: v].
	values sort: [ :a :b | a < b ].
	max := values max.
	min := values min.
	delta := (max - min)/numberOfBuckets.

	((min + delta) to: max by: delta) with: self palette do: [ :i :c |
			buckets add:  (Array with:i with: c)
		 ].
	buckets := buckets sort: [:a :b | a first < b first].
]

{ #category : #'as yet unclassified' }
RTBucketColor >> numberOfBuckets: anInteger [

	numberOfBuckets := anInteger
]

{ #category : #'as yet unclassified' }
RTBucketColor >> palette [

	^ colorScheme isNil 
		ifTrue: [ self defaultPalette ]
		ifFalse: [ (RTColorPalette paletteFor: colorScheme) colors: numberOfBuckets scheme: colorScheme
			]
]

{ #category : #'as yet unclassified' }
RTBucketColor >> rtValue: anObject [

	^ (self buckets detect: [ :pair | pair first = (self bucketIndexOf: anObject) ] ) second	

]

{ #category : #'as yet unclassified' }
RTBucketColor >> scope: groupOfObjects [
	"The argument is used to determine the maximum value. Command is executed on each of elements of the group passed as argument"
	scope := groupOfObjects
]
