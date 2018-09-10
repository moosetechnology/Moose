"
SmaCCTokens are used as the interface objects between scanner and parser. They hold the string that was scanned and its position information. Also, included in the token is its id. The id specifies what type of token it is.

Instance Variables:
	id	<Array of: Integer>	the list of possible token types this represents. There can be overlapping tokens, so we list all of the id here. The default parser only looks at the first id, but we can redefine this behavior in a subclass to look at all possibilities until we find a valid token.
	start	<Integer>	the starting position of the token in the original input
	value	<Object>	the value of our token (normally a string, but could be anything)


"
Class {
	#name : #SmaCCToken,
	#superclass : #Object,
	#instVars : [
		'start',
		'ids',
		'value'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #'instance creation' }
SmaCCToken class >> value: aString [
	^ self value: aString start: 0 ids: #()
]

{ #category : #public }
SmaCCToken class >> value: aString start: anInteger id: anObject [
	^ self value: aString start: anInteger ids: anObject
]

{ #category : #'instance creation' }
SmaCCToken class >> value: aString start: anInteger ids: aCollection [
	^ self new
		value: aString start: anInteger ids: aCollection;
		yourself
]

{ #category : #comparing }
SmaCCToken >> = aSmaCCToken [
	^ self class = aSmaCCToken class
		and: [ self value = aSmaCCToken value ]
]

{ #category : #matching }
SmaCCToken >> copyInContext: aDictionary [
	^ self
]

{ #category : #comparing }
SmaCCToken >> hash [
	^ self value hash
]

{ #category : #public }
SmaCCToken >> id [
	^ ids
]

{ #category : #accessing }
SmaCCToken >> ids [
	^ ids
]

{ #category : #accessing }
SmaCCToken >> ids: anArray [
	ids := anArray
]

{ #category : #testing }
SmaCCToken >> isListMatch [
	^ false
]

{ #category : #testing }
SmaCCToken >> isPattern [
	^ false
]

{ #category : #matching }
SmaCCToken >> match: anObject inContext: aDictionary [
	^ self = anObject
]

{ #category : #printing }
SmaCCToken >> printOn: aStream [
	aStream
		nextPut: ${;
		nextPutAll: self value;
		nextPut: $(;
		nextPutAll: self startPosition printString;
		nextPut: $,;
		nextPutAll: self stopPosition printString;
		nextPut: $,;
		nextPutAll: self ids printString;
		nextPutAll: ')}'
]

{ #category : #accessing }
SmaCCToken >> startPosition [
	^ start
]

{ #category : #accessing }
SmaCCToken >> stopPosition [
	start isNil
		ifTrue: [ ^ nil ].
	^ start + value size - 1
]

{ #category : #accessing }
SmaCCToken >> value [
	^ value
]

{ #category : #'initialize-release' }
SmaCCToken >> value: aString start: startPositionInteger ids: aCollection [
	value := aString.
	start := startPositionInteger.
	ids := aCollection
]
