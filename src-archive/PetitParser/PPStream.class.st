"
A positional stream implementation used for parsing. It overrides some methods for optimization reasons.
"
Class {
	#name : #PPStream,
	#superclass : #ReadStream,
	#instVars : [
		'newlines'
	],
	#category : #'PetitParser-Core'
}

{ #category : #converting }
PPStream >> asPetitStream [
	^ self
]

{ #category : #accessing }
PPStream >> collection [
	"Answer the underlying collection."
	
	^ collection
]

{ #category : #positioning }
PPStream >> column [
	^ self column: position.
]

{ #category : #positioning }
PPStream >> column: pos [
	| nl |
	(pos = -1) ifTrue: [  ^ 0 ].
	(pos > readLimit) ifTrue: [ ^ self error: 'Out of limit' ].
	
	nl := self newlines.
	1 to: nl size do: [ :index | 
		((nl at: index) > pos) ifTrue: [ ^ pos - (nl at: (index - 1)) + 1 ]
	].
"	nl keysAndValuesDo: [ :index :value |
		(value > pos) ifTrue: [ ^ pos - (nl at: (index - 1)) + 1]
	].	
"
	^ pos - (nl at: (nl size )) + 1
]

{ #category : #positioning }
PPStream >> fillNewlines [
	| tmp line |
	newlines := OrderedCollection new.	
	
	tmp := position.
	line := 0.
	
	(0 to: readLimit) do: [:index |
		position := index.
		self isStartOfLine ifTrue: [ newlines add: position ]
	].
	position := tmp.
	newlines := newlines asArray.
	^ newlines
]

{ #category : #queries }
PPStream >> insideCRLF [
	(position < 1) ifTrue: [ ^ false ].
	
	^ (self peek = (Character codePoint: 10)) and: [ self peekBack = (Character codePoint: 13) ]
]

{ #category : #queries }
PPStream >> isEndOfLine [
	self atEnd ifTrue: [ ^ true ].
	self insideCRLF ifTrue: [ ^ false ].
	^ (self peek = (Character codePoint: 13) or: [ self peek = (Character codePoint: 10)]).
]

{ #category : #queries }
PPStream >> isStartOfLine [
	(position = 0) ifTrue: [ ^ true ].

	self insideCRLF ifTrue: [ ^ false ].
	
	^ (self peekBack = (Character codePoint: 13)) or: [ self peekBack = (Character codePoint: 10)].
]

{ #category : #positioning }
PPStream >> line [
	^ self line: position
]

{ #category : #positioning }
PPStream >> line: pos [
	| nl |
	(pos = -1) ifTrue: [  ^ 0 ].
	(pos > readLimit) ifTrue: [ ^ self error: 'Out of limit' ].
	
	nl := self newlines.
	nl keysAndValuesDo: [ :index :value |
		(value > pos) ifTrue: [ ^ (index - 1)]
	].	

	^ nl size
]

{ #category : #positioning }
PPStream >> newlines [
	^ newlines ifNil: [ 
		newlines := self fillNewlines.
	]
]

{ #category : #accessing }
PPStream >> next: anInteger [ 
	"Answer up to anInteger elements of my collection. Overridden for efficiency."

	| answer endPosition |
	endPosition := position + anInteger min: readLimit.
	answer := collection copyFrom: position + 1 to: endPosition.
	position := endPosition.
	^ answer
]

{ #category : #accessing }
PPStream >> peek [
	"An improved version of peek, that is slightly faster than the built in version."

	^ self atEnd ifFalse: [ collection at: position + 1 ]
]

{ #category : #accessing }
PPStream >> position: anInteger [
	"The receiver does not check for invalid arguments passed to this method, as it is solely used with valid indexes for backtracking."

	position := anInteger
]

{ #category : #printing }
PPStream >> printOn: aStream [
	collection isString
		ifFalse: [ ^ super printOn: aStream ].
	aStream
		nextPutAll: (collection copyFrom: 1 to: position);
		nextPutAll: '·';
		nextPutAll: (collection copyFrom: position + 1 to: readLimit)
]

{ #category : #accessing }
PPStream >> size [
	"
		The same implementation as a ReadStream. Implemented here for compatibility with Smalltalk/X
		that has different implementation in a ReadStream
	"
	^readLimit
]

{ #category : #accessing }
PPStream >> uncheckedPeek [
	"An unchecked version of peek that throws an error if we try to peek over the end of the stream, even faster than #peek."

	^ collection at: position + 1
]
