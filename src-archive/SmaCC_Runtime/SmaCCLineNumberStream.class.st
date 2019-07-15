"
SmaCCLineNumberStream is a wrapper for streams that calculates line numbers.

Instance Variables:
	eolPositions	<OrderedCollection of: Integer>	the positions of each end of line
	lastPosition	<Integer>	the position of the last character that we have calculated the end of line information for (we know the line number for all characters before this position and don't know anything about the characters after this position)
	previousWasCR	<Boolean>	was the previous character a CR. This is used for CR LF streams. A CR LF combination should only increment the line counter by 1
	sourceStream	<Stream>	the stream that we are wrapping

"
Class {
	#name : #SmaCCLineNumberStream,
	#superclass : #Stream,
	#instVars : [
		'sourceStream',
		'previousWasCR',
		'eolPositions',
		'lastPosition'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #'instance creation' }
SmaCCLineNumberStream class >> on: aReadStream [
	^ self basicNew
		on: aReadStream;
		yourself
]

{ #category : #testing }
SmaCCLineNumberStream >> atEnd [
	^ sourceStream atEnd
]

{ #category : #accessing }
SmaCCLineNumberStream >> columnNumber [
	^ self columnNumberFor: self position
]

{ #category : #accessing }
SmaCCLineNumberStream >> columnNumberFor: anInteger [
	^ anInteger - (eolPositions at: (self lineNumberFor: anInteger)) + 1
]

{ #category : #accessing }
SmaCCLineNumberStream >> contents [
	^ sourceStream contents
]

{ #category : #private }
SmaCCLineNumberStream >> contentsSpecies [
	^ sourceStream contentsSpecies
]

{ #category : #'error handling' }
SmaCCLineNumberStream >> doesNotUnderstand: aMessage [
	^ [ sourceStream
		perform: aMessage selector
		withArguments: aMessage arguments ]
		ensure: [ self position: sourceStream position ]
]

{ #category : #accessing }
SmaCCLineNumberStream >> flush [
	^ sourceStream flush
]

{ #category : #testing }
SmaCCLineNumberStream >> isReadable [
	^ sourceStream isReadable
]

{ #category : #testing }
SmaCCLineNumberStream >> isWritable [
	^ sourceStream isWritable
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineNumber [
	^ self lineNumberFor: self position
]

{ #category : #accessing }
SmaCCLineNumberStream >> lineNumberFor: anInteger [
	| index start stop pos |
	pos := anInteger.
	pos >= eolPositions last
		ifTrue: [ ^ eolPositions size ].
	start := 1.
	stop := eolPositions size.
	[ start + 1 < stop ]
		whileTrue:
			[ index := (start + stop) // 2.
			(eolPositions at: index) <= pos
				ifTrue: [ start := index ]
				ifFalse: [ stop := index ] ].
	^ start
]

{ #category : #accessing }
SmaCCLineNumberStream >> next [
	| character streamPosition |
	character := sourceStream next.
	streamPosition := sourceStream position.
	streamPosition - 1 >= lastPosition
		ifTrue:
			[ lastPosition := streamPosition.
			character == Character cr
				ifTrue: [ eolPositions add: lastPosition.
					previousWasCR := true ]
				ifFalse:
					[ character == Character lf
						ifTrue:
							[ previousWasCR
								ifTrue: [ eolPositions at: eolPositions size put: lastPosition ]
								ifFalse: [ eolPositions add: lastPosition ] ].
					previousWasCR := false ] ].
	^ character
]

{ #category : #accessing }
SmaCCLineNumberStream >> nextPut: anObject [
	^ sourceStream nextPut: anObject
]

{ #category : #'initialize-release' }
SmaCCLineNumberStream >> on: aReadStream [
	sourceStream := aReadStream.
	eolPositions := OrderedCollection with: aReadStream position.
	lastPosition := aReadStream position.
	previousWasCR := false
]

{ #category : #accessing }
SmaCCLineNumberStream >> peek [
	^ sourceStream peek
]

{ #category : #accessing }
SmaCCLineNumberStream >> position [
	^ sourceStream position
]

{ #category : #accessing }
SmaCCLineNumberStream >> position: anInteger [
	anInteger > lastPosition
		ifTrue:
			[ sourceStream position: lastPosition.
			[ sourceStream position < anInteger and: [ sourceStream atEnd not ] ]
				whileTrue: [ self next ] ]
		ifFalse: [ sourceStream position: anInteger ]
]

{ #category : #accessing }
SmaCCLineNumberStream >> skip: anInteger [
	^ self position: self position + anInteger
]
