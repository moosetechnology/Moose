"
PPToken represents a parsed part of the input stream. Contrary to a simple String it remembers where it came from, the original collection and its start and stop position.

Instance Variables:
	collection	<SequenceableCollection>	The collection this token comes from.
	start	<Integer>	The start position in the collection.
	stop	<Integer>	The stop position in the collection.
"
Class {
	#name : #PPToken,
	#superclass : #Object,
	#instVars : [
		'collection',
		'start',
		'stop',
		'value'
	],
	#classVars : [
		'NewLineParser'
	],
	#category : #'PetitParser-Core'
}

{ #category : #initialization }
PPToken class >> initialize [
	"Platform independent newline sequence. LF: Unix, CR+LF: Windows, and CR: Apple."
	| cr lf |
	cr := Character codePoint: 13.
	lf := Character codePoint: 10.
	NewLineParser := lf asParser / (cr asParser , lf asParser optional)
]

{ #category : #'instance creation' }
PPToken class >> new [
	self error: 'Token can only be created using a dedicated constructor.'
]

{ #category : #'instance creation' }
PPToken class >> on: aSequenceableCollection [
	^ self on: aSequenceableCollection start: 1 stop: aSequenceableCollection size value: nil
]

{ #category : #'instance creation' }
PPToken class >> on: aSequenceableCollection start: aStartInteger stop: aStopInteger value: anObject [
	^ self basicNew 
		initializeOn: aSequenceableCollection
		start: aStartInteger stop: aStopInteger
		value: anObject
]

{ #category : #comparing }
PPToken >> = anObject [
	^ self class = anObject class and: [ self inputValue = anObject inputValue ]
]

{ #category : #accessing }
PPToken >> collection [
	"Answer the underlying collection of this token."

	^ collection
]

{ #category : #querying }
PPToken >> column [
	"Answer the column number of this token in the underlying collection."
	
	| position |
	position := 0.
	(NewLineParser , [ :stream |
		start <= stream position
			ifTrue: [ ^ start - position ].
		position := stream position ] asParser
		/ #any asParser) star
			parse: collection.
	 ^ start - position
]

{ #category : #copying }
PPToken >> copyFrom: aStartInteger to: aStopInteger [
	^ self class on: collection start: start + aStartInteger - 1 stop: stop + aStopInteger - 3 value: value
]

{ #category : #comparing }
PPToken >> hash [
	^ self inputValue hash
]

{ #category : #initialization }
PPToken >> initializeOn: aSequenceableCollection start: aStartInteger stop: aStopInteger value: anObject [
	collection := aSequenceableCollection.
	start := aStartInteger.
	stop := aStopInteger.
	value := anObject
]

{ #category : #'accessing-values' }
PPToken >> inputValue [
	"Answer the consumed input of this token."

	^ collection copyFrom: start to: stop
]

{ #category : #querying }
PPToken >> line [
	"Answer the line number of this token in the underlying collection."
	
	| line |
	line := 1.
	(NewLineParser , [ :stream |
		start <= stream position
			ifTrue: [ ^ line ].
		line := line + 1 ] asParser
		/ #any asParser) star
			parse: collection.
	^ line
]

{ #category : #'accessing-values' }
PPToken >> parsedValue [
	"Answer the parsed value of this token."

	^ value
]

{ #category : #printing }
PPToken >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $[; print: self start; nextPut: $,; print: self stop; nextPut: $].
	aStream nextPut: $(; print: self inputValue; nextPut: $)
]

{ #category : #accessing }
PPToken >> size [
	"Answer the size of this token in the underlying collection."

	^ stop - start + 1
]

{ #category : #accessing }
PPToken >> start [
	"Answer the start position of this token in the underlying collection."

	^ start
]

{ #category : #accessing }
PPToken >> stop [
	"Answer the stop position of this token in the underlying collection."
	
	^ stop
]

{ #category : #'accessing-values' }
PPToken >> value [
	self notify: 'Token>>#value is no longer supported. Instead use Token>>#inputValue'.
	^ self inputValue
]
