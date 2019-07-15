Class {
	#name : #MAPluggableCondition,
	#superclass : #MACondition,
	#instVars : [
		'receiver',
		'selector',
		'arguments',
		'index'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #initialization }
MAPluggableCondition >> initializeReceiver: anObject selector: aSelector arguments: anArray index: anInteger [
	receiver := anObject.
	selector := aSelector.
	arguments := anArray.
	index := anInteger
]

{ #category : #evaluating }
MAPluggableCondition >> value: anObject [
	| actualReceiver actualArguments |
	actualReceiver := index = 0
		ifFalse: [ receiver ]
		ifTrue: [ anObject ].
	actualArguments := index > 0
		ifFalse: [ arguments ]
		ifTrue: [
			arguments copy 
				at: index put: anObject;
				yourself ].
	^ actualReceiver
		perform: selector
		withArguments: actualArguments
]
