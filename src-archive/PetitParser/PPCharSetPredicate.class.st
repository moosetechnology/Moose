Class {
	#name : #PPCharSetPredicate,
	#superclass : #Object,
	#instVars : [
		'block',
		'classification'
	],
	#category : #'PetitParser-Tools'
}

{ #category : #'instance creation' }
PPCharSetPredicate class >> on: aBlock [
	^ self basicNew initializeOn: aBlock
]

{ #category : #initialization }
PPCharSetPredicate >> initializeOn: aBlock [
	block := aBlock.
	classification := Array new: 255.
	1 to: classification size do: [ :index |
		classification at: index put: (block
			value: (Character codePoint: index)) ]
]

{ #category : #evaluating }
PPCharSetPredicate >> value: aCharacter [
	| index |
	index := aCharacter asInteger.
	index == 0
		ifTrue: [ ^ block value: aCharacter ].
	index > 255
		ifTrue: [ ^ block value: aCharacter ].
	^ classification at: index
]
