"
Create a simple namecloud 
"
Class {
	#name : #RTNameCloud,
	#superclass : #RTBuilder,
	#instVars : [
		'maxHeight',
		'minHeight',
		'maxWords',
		'layout',
		'tableFrequency',
		'tableObjects',
		'dictionary'
	],
	#category : #'Roassal2-Builder-NameCloud'
}

{ #category : #adding }
RTNameCloud >> addObjects: objects description: aBlockOrSymbol [
	objects do: [ :o |
		self addString: (aBlockOrSymbol rtValue: o) object: o ]
	 
]

{ #category : #adding }
RTNameCloud >> addString: string [
	 string substrings do: [ :w | self addWord: w ].
]

{ #category : #adding }
RTNameCloud >> addString: string object: object [
	 string substrings do: [ :w | self addWord: w object: object ]
]

{ #category : #adding }
RTNameCloud >> addStrings: collectionOfStrings [
	collectionOfStrings do: [ :s | self addString: s ]
]

{ #category : #adding }
RTNameCloud >> addWord: aWordAsString [
	| w |
	w := self prepareWord: aWordAsString.
	(self isValidWord: w) ifTrue: 
		[ tableFrequency at: w ifAbsentPut: [ 0 ].
		  tableFrequency at: w put: (tableFrequency at: w) + 1 ].
	^ w
]

{ #category : #adding }
RTNameCloud >> addWord: aWordAsString object: object [
	"object is an object for which its description contains aWordAsString"
	| w |
	w := self addWord: aWordAsString.
	
	"If the word is not valid, then we do nothing"
	(self isValidWord: w) ifFalse: [ ^ self ].
	
	tableObjects at: w ifAbsentPut: [ Set new ].
	(tableObjects at: w) add: object
]

{ #category : #hooks }
RTNameCloud >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #configuration }
RTNameCloud >> defaultLayout [
	^ RTRectanglePackLayout new
]

{ #category : #configuration }
RTNameCloud >> defaultMaxHeight [
	^ 30
]

{ #category : #configuration }
RTNameCloud >> defaultMaxWords [
	^ 150
]

{ #category : #configuration }
RTNameCloud >> defaultMinHeight [
	^ 8
]

{ #category : #accessing }
RTNameCloud >> dictionary [
	^ dictionary
]

{ #category : #accessing }
RTNameCloud >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #examples }
RTNameCloud >> example01 [
	"
	self new example01
	"

	^ RTNameCloud new 
		addString: 'open

		| v shape |
		v := RTView new.
		shape := RTLabel new height: [ :assoc | assoc value ]; text: #key.
		v addAll: (shape elementsOn: table associations).
		RTFlowLayout on: v elements.
		v open';
		yourself
]

{ #category : #examples }
RTNameCloud >> example02 [
	"
	self new example02
	"
	| b |
	b := RTNameCloud new.
	b addStrings: (RTNameCloud rtmethods collect: #sourceCode).
	^ b
]

{ #category : #examples }
RTNameCloud >> example03 [
	"
	self new example03
	"
	<noTest>
	| b |
	b := RTNameCloud new. 
	b dictionary: (RTSourceCodeDictionary new).
	RTObject withAllSubclasses do: [ :c | 
		b addObjects: c rtmethods description: #sourceCode ].
	^ b
]

{ #category : #examples }
RTNameCloud >> example04 [
	"
	self new example04
	"
	| b |
	b := RTNameCloud new.
	b minHeight: 20.
	b maxHeight: 30.
	b addString: 'I am not that tall but I speak many languages. But I have tall legs and big feet'.
	^ b
]

{ #category : #initialization }
RTNameCloud >> initialize [
	super initialize.
	tableFrequency := Dictionary new.
	tableObjects := Dictionary new.
	dictionary := RTEnglishDictionary new.
	maxHeight := self defaultMaxHeight.
	minHeight := self defaultMinHeight.
	maxWords := self defaultMaxWords.
	layout := self defaultLayout.
]

{ #category : #hooks }
RTNameCloud >> inspectObjectsForWord: word [

	^ (tableObjects includesKey: word)
		ifTrue: [ (tableObjects at: word) inspect ]
]

{ #category : #testing }
RTNameCloud >> isValidWord: word [
	^ word notEmpty and: [ (self unnecessaryWords includes: word) not ]
]

{ #category : #accessing }
RTNameCloud >> maxFrequency [
	^ tableFrequency values max
]

{ #category : #accessing }
RTNameCloud >> maxHeight [
	^ maxHeight
]

{ #category : #accessing }
RTNameCloud >> maxHeight: anObject [
	maxHeight := anObject
]

{ #category : #accessing }
RTNameCloud >> maxWords [
	"Return the number of words to be displayed"
	^ maxWords
]

{ #category : #accessing }
RTNameCloud >> maxWords: anInteger [
	"Set the number of words to be displayed"
	maxWords := anInteger
]

{ #category : #accessing }
RTNameCloud >> minFrequency [
	^ tableFrequency values min
]

{ #category : #accessing }
RTNameCloud >> minHeight [
	^ minHeight
]

{ #category : #accessing }
RTNameCloud >> minHeight: anObject [
	minHeight := anObject
]

{ #category : #utility }
RTNameCloud >> prepareWord: word [
	^ word select: #isLetter
]

{ #category : #hooks }
RTNameCloud >> renderIn: aView [
	| shape es |
	shape := RTLabel new
		height: [ :assoc | | temp |
			temp := assoc value isNumber 
				ifTrue: [ assoc value ] 
				ifFalse: [ assoc value size ].
			(temp - self minFrequency) * maxHeight / (self maxFrequency - self minFrequency max: 1) + minHeight ];
		text: #key.
	es := shape elementsOn: self sortedAssociationsBounded.
	aView addAll: es.
	es @ RTPopup.
	es
		@
			(RTMenuActivable new
				action: #inspect;
				item: 'inspect objects' action: [ :e | self inspectObjectsForWord: e model key ]).
	layout on: es
]

{ #category : #accessing }
RTNameCloud >> sortedAssociations [
	^ self tableObjects 
		ifEmpty: [ tableFrequency associations reverseSortedAs: #value ]
		ifNotEmpty: [ self tableObjects associations reverseSortedAs: [ :assoc | assoc value size ] ].
]

{ #category : #accessing }
RTNameCloud >> sortedAssociationsBounded [

	^ self sortedAssociations copyFrom: 1 to: (self sortedAssociations size min: maxWords)
]

{ #category : #accessing }
RTNameCloud >> tableObjects [
	"Return a dictionary for which keys are words, and values are set of objects related to the word"
	^ tableObjects
]

{ #category : #dictionaries }
RTNameCloud >> topWords: index [
	"Return the top index words"
	^ ((self sortedAssociations copyFrom: 1 to: index) collect: #key) asArray
]

{ #category : #dictionaries }
RTNameCloud >> unnecessaryWords [
	^ dictionary unnecessaryWords
]
