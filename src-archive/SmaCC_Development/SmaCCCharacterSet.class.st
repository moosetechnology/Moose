Class {
	#name : #SmaCCCharacterSet,
	#superclass : #SmaCCIntegerSet,
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCCharacterSet class >> withAllCharactersTo: aCharacter [
	^ self new
		initializeWithAllCharactersTo: aCharacter;
		yourself
]

{ #category : #adding }
SmaCCCharacterSet >> add: aCharacter [
	super add: aCharacter asInteger.
	^ aCharacter
]

{ #category : #converting }
SmaCCCharacterSet >> asString [
	| stream |
	stream := WriteStream on: String new.
	self do: [ :each | stream nextPut: each ].
	^ stream contents
]

{ #category : #enumerating }
SmaCCCharacterSet >> do: aBlock [
	^ super do: [ :each | aBlock value: (Character value: each) ]
]

{ #category : #testing }
SmaCCCharacterSet >> includes: aCharacter [
	^ super includes: aCharacter asInteger
]

{ #category : #'initialize-release' }
SmaCCCharacterSet >> initializeWithAllCharactersTo: aCharacter [
	| current index value |
	self add: aCharacter.
	current := data.
	[ current isKindOf: Collection ]
		whileTrue: [ index := 1.
			[ (value := current at: index) = 0 ]
				whileTrue: [ current
						at: index
						put:
							((current isKindOf: ByteArray)
								ifTrue: [ 255 ]
								ifFalse: [ 1 ]).
					index := index + 1 ].
			(value isKindOf: Collection)
				ifFalse: [ current at: index put: (value bitOr: value - 1) ].
			current := value ]
]

{ #category : #removing }
SmaCCCharacterSet >> remove: aCharacter ifAbsent: aBlock [
	(self includes: aCharacter)
		ifFalse: [ ^ aBlock value ].
	super remove: aCharacter asInteger ifAbsent: aBlock.
	^ aCharacter
]
