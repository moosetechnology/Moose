Class {
	#name : #SmaCCReferenceRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'regexNode',
		'creationBlock'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCReferenceRENode class >> creationBlock: aBlock [
	^ self new
		creationBlock: aBlock;
		yourself
]

{ #category : #private }
SmaCCReferenceRENode >> asNFAStartingWith: aSmaCCNode [
	^ self regexNode asNFAStartingWith: aSmaCCNode
]

{ #category : #'initialize-release' }
SmaCCReferenceRENode >> creationBlock: aBlock [
	creationBlock := aBlock
]

{ #category : #private }
SmaCCReferenceRENode >> possibleMatchesDo: aBlock on: aStream [
	^ self regexNode possibleMatchesDo: aBlock on: aStream
]

{ #category : #accessing }
SmaCCReferenceRENode >> possibleMatchesSize [
	^ self regexNode possibleMatchesSize
]

{ #category : #private }
SmaCCReferenceRENode >> regexNode [
	regexNode isNil
		ifTrue: [ regexNode := creationBlock value copy.
			regexNode action: self action.
			regexNode position: self position.
			regexNode addStates: self states ].
	^ regexNode
]
