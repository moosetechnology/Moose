Class {
	#name : #SmaCCCharacterSetTest,
	#superclass : #SmaCCBitCollectionTest,
	#category : #'SmaCC_Tests'
}

{ #category : #private }
SmaCCCharacterSetTest >> setClass [
	^ SmaCCCharacterSet
]

{ #category : #private }
SmaCCCharacterSetTest >> supportsLargeValues [
	[ Character value: 1000 ]
		on: Error
		do: [ :ex | ^ false ].
	^ true
]

{ #category : #tests }
SmaCCCharacterSetTest >> testAllCharacterRange [
	| collection |
	collection := SmaCCCharacterSet withAllCharactersTo: (Character value: 254).
	self assert: collection size = 255.
	self deny: (collection includes: (Character value: 255)).
	self assert: (collection includes: (Character value: 254)).
	self assert: (collection includes: (Character value: 0)).
	self supportsLargeValues
		ifFalse: [ ^ self ].
	collection := SmaCCCharacterSet withAllCharactersTo: (Character value: (1 << 21) - 1).
	self assert: collection size = (1 << 21).
	self deny: (collection includes: (Character value: 1 << 21)).
	self assert: (collection includes: (Character value: (1 << 21) - 1)).
	self assert: (collection includes: (Character value: 0))
]

{ #category : #private }
SmaCCCharacterSetTest >> value: anInteger [
	^ Character
		value:
			(self supportsLargeValues
				ifTrue: [ anInteger ]
				ifFalse: [ anInteger bitAnd: 16rFF ])
]
