"
An abstract parser that repeatedly parses between 'min' and 'max' instances of its delegate. The default configuration parses an infinite number of elements, as 'min' is set to 0 and 'max' to infinity (SmallInteger maxVal).

Instance Variables:
	min	<Integer>	The minimum number of repetitions.
	max	<Integer>	The maximum number of repetitions.
"
Class {
	#name : #PPRepeatingParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'min',
		'max'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #initialization }
PPRepeatingParser >> initialize [
	super initialize.
	self setMin: 0; setMax: SmallInteger maxVal
]

{ #category : #accessing }
PPRepeatingParser >> max [
	"Answer the maximum number of repetitions."

	^ max
]

{ #category : #accessing }
PPRepeatingParser >> min [
	"Answer the minimum number of repetitions."
	
	^ min
]

{ #category : #printing }
PPRepeatingParser >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' ['; print: min; nextPutAll: ', '; nextPutAll: (max = SmallInteger maxVal
		ifTrue: [ '*' ] ifFalse: [ max printString ]); nextPut: $]
]

{ #category : #initialization }
PPRepeatingParser >> setMax: anInteger [
	max := anInteger
]

{ #category : #initialization }
PPRepeatingParser >> setMin: anInteger [
	min := anInteger
]
