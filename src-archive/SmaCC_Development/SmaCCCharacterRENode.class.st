"
SmaCCCharacterRENode is a SmaCCRegularExpressionNode that matches a character.

Instance Variables:
	characters	<String>	the characters we accept
	ignoreCase	<Boolean>	should we ignore case when accepting the characters


"
Class {
	#name : #SmaCCCharacterRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'characters',
		'ignoreCase'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCCharacterRENode class >> characters: aSmaCCCharacterSet [
	^ self new
		characters: aSmaCCCharacterSet;
		yourself
]

{ #category : #private }
SmaCCCharacterRENode >> asNFAStartingWith: aSmaCCNode [
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	startNode addEdgeTo: endNode onCharacters: characters.
	^ endNode
]

{ #category : #testing }
SmaCCCharacterRENode >> canMergeWith: aSmaCCRegularExpressionNode [
	^ self class = aSmaCCRegularExpressionNode class
		and:
			[ characters notNil
				and:
					[ aSmaCCRegularExpressionNode characters notNil
						and: [ self action = aSmaCCRegularExpressionNode action ] ] ]
]

{ #category : #accessing }
SmaCCCharacterRENode >> characters [
	^ characters
]

{ #category : #'initialize-release' }
SmaCCCharacterRENode >> characters: aSmaCCCharacterSet [
	characters := aSmaCCCharacterSet
]

{ #category : #'initialize-release' }
SmaCCCharacterRENode >> initialize [
	super initialize.
	ignoreCase := false
]

{ #category : #constructing }
SmaCCCharacterRENode >> makeCaseInsensitive [
	| newCharacters |
	ignoreCase := true.
	newCharacters := characters copy.
	characters
		do: [ :each | 
			| upper lower |
			upper := each asUppercase.
			lower := each asLowercase.
			upper asInteger > SmaCCGrammar maximumCharacterValue
				ifFalse: [ newCharacters add: upper ].
			lower asInteger > SmaCCGrammar maximumCharacterValue
				ifFalse: [ newCharacters add: lower ] ].
	characters := newCharacters
]

{ #category : #accessing }
SmaCCCharacterRENode >> matchingCharacters [
	^ ignoreCase
		ifTrue: [ characters reject: [ :each | each isLowercase ] ]
		ifFalse: [ characters ]
]

{ #category : #private }
SmaCCCharacterRENode >> possibleMatchesDo: aBlock on: aStream [
	self matchingCharacters
		do:
			[ :each | 
			aStream nextPut: each.
			aBlock value.
			aStream skip: -1 ]
]

{ #category : #accessing }
SmaCCCharacterRENode >> possibleMatchesSize [
	^ self matchingCharacters size
]

{ #category : #printing }
SmaCCCharacterRENode >> printCharacter: aCharacter on: aStream [
	(aCharacter asInteger between: 32 and: 126)
		ifTrue: [ ^ aStream nextPut: aCharacter ].
	aStream nextPutAll: '\x'.
	aCharacter asInteger printOn: aStream base: 16 showRadix: false
]

{ #category : #printing }
SmaCCCharacterRENode >> printOn: aStream [
	| allCharacters |
	characters size = 1
		ifTrue: [ ^ self printCharacter: characters first on: aStream ].
	aStream nextPut: $[.
	allCharacters := characters.
	characters size > 128
		ifTrue: [ allCharacters := ((0 to: SmaCCGrammar maximumCharacterValue) collect: [ :each | Character value: each ])
				reject: [ :each | characters includes: each ].
			allCharacters size < characters size
				ifTrue: [ aStream nextPut: $^ ] ].
	allCharacters do: [ :each | self printCharacter: each on: aStream ].
	aStream nextPut: $]
]

{ #category : #constructing }
SmaCCCharacterRENode >> | aSmaCCRegularExpressionNode [
	(self canMergeWith: aSmaCCRegularExpressionNode)
		ifFalse: [ ^ super | aSmaCCRegularExpressionNode ].
	characters := characters , aSmaCCRegularExpressionNode characters.
	^ self
]
