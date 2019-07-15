"
SmaCCNotRENode is a SmaCCRegularExpressionNode that inverts another SmaCCRegularExpressionNode matches.

Instance Variables:
	node	<SmaCCRegularExpressionNode>	the node whose match is being inverted


"
Class {
	#name : #SmaCCNotRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'node'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCNotRENode class >> on: aSmaCCCharacterRENode [
	^ self new
		node: aSmaCCCharacterRENode;
		yourself
]

{ #category : #private }
SmaCCNotRENode >> asNFAStartingWith: aSmaCCNode [
	^ self characterNode asNFAStartingWith: aSmaCCNode
]

{ #category : #private }
SmaCCNotRENode >> characterNode [
	^ (SmaCCCharacterRENode characters: self characters)
		addStates: states;
		action: action;
		yourself
]

{ #category : #private }
SmaCCNotRENode >> characters [
	^ SmaCCGrammar allCharacters
		reject: [ :each | node characters includes: each ]
]

{ #category : #constructing }
SmaCCNotRENode >> makeCaseInsensitive [
	node makeCaseInsensitive
]

{ #category : #'initialize-release' }
SmaCCNotRENode >> node: aSmaCCCharacterRENode [
	node := aSmaCCCharacterRENode
]

{ #category : #private }
SmaCCNotRENode >> possibleMatchesDo: aBlock on: aStream [
	self characterNode possibleMatchesDo: aBlock on: aStream
]

{ #category : #accessing }
SmaCCNotRENode >> possibleMatchesSize [
	^ self characterNode possibleMatchesSize
]

{ #category : #printing }
SmaCCNotRENode >> printOn: aStream [
	self characterNode printOn: aStream
]
