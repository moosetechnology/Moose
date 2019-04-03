Class {
	#name : #MooseGroupTeardownStorage,
	#superclass : #MooseGroupSetupStorage,
	#type : #variable,
	#instVars : [
		'tally'
	],
	#classVars : [
		'Tombstone'
	],
	#category : #'Moose-Core'
}

{ #category : #adding }
MooseGroupTeardownStorage >> add: anElement [ 
	 
	tally := tally + 1. 
	^elements add: anElement
]

{ #category : #enumerating }
MooseGroupTeardownStorage >> do: aBlock [ 
	 
	^elements do: [:each | Tombstone ~~ each ifTrue: [aBlock value: each]]
]

{ #category : #removing }
MooseGroupTeardownStorage >> remove: anElement ifAbsent: exceptionBlock [
	| index |
	index := (elements findFirst: [ :each | anElement = each ]) index isZero
		ifTrue: [ exceptionBlock value ].
	elements at: index put: Tombstone.
	tally := tally - 1.
	^ anElement
]

{ #category : #accessing }
MooseGroupTeardownStorage >> size [ 
	 
	^tally
]
