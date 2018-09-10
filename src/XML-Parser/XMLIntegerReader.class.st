"
This class reads positive hex or decimal integers from minimal streams supporting #next, #peek, and #atEnd. It returns nil instead of raising errors for invalid integers.
"
Class {
	#name : #XMLIntegerReader,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'printStream'
	],
	#classVars : [
		'CharacterDigitValues'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #'class initialization' }
XMLIntegerReader class >> initialize [
	"self initialize"

	self initializeCharacterDigitValues
]

{ #category : #'class initialization' }
XMLIntegerReader class >> initializeCharacterDigitValues [
	| temp |

	"use an array instead of a dictionary for speed, and use a temp
	to fully initialize it before assignment to avoid possible race
	conditions during class reinitialization"
	temp := Array new: 255.
	#(#($0 $9 0) #($a $f 10) #($A $Z 10)) do: [:each |
		| firstDigitValue lastDigitValue baseValue |
		firstDigitValue := each first asciiValue.
		lastDigitValue := each second asciiValue.
		baseValue := each third.
		firstDigitValue
			to: lastDigitValue
			do: [:i |
				temp
					at: i
					put: i - firstDigitValue + baseValue]].
	CharacterDigitValues := temp.
]

{ #category : #defaults }
XMLIntegerReader class >> maxBase [
	^ 16
]

{ #category : #defaults }
XMLIntegerReader class >> maxIntegerValue [
	^ nil
]

{ #category : #'instance creation' }
XMLIntegerReader class >> on: aStringOrStream [
	^ self new on: aStringOrStream
]

{ #category : #'instance creation' }
XMLIntegerReader class >> readFrom: aStream [
	^ (self on: aStream) nextInteger
]

{ #category : #reading }
XMLIntegerReader class >> readFrom: aStream withBase: aBase [
	^ (self on: aStream) nextIntegerWithBase: aBase
]

{ #category : #reading }
XMLIntegerReader class >> readFrom: aStream withBase: aFirstBase andPrefixes: aCharacterCollection orBase: aSecondBase [
	^ (self on: aStream)
		nextIntegerWithBase: aFirstBase
		andPrefixes: aCharacterCollection
		orBase: aSecondBase
]

{ #category : #reading }
XMLIntegerReader class >> readFrom: aStream withBase: aFirstBase andPrefixes: aCharacterCollection orBase: aSecondBase upToLimit: aReadLimit [
	^ (self on: aStream)
		nextIntegerWithBase: aFirstBase
		andPrefixes: aCharacterCollection
		orBase: aSecondBase
		upToLimit: aReadLimit
]

{ #category : #reading }
XMLIntegerReader class >> readFrom: aStream withBase: aBase upToLimit: aReadLimit [
	^ (self on: aStream)
		nextIntegerWithBase: aBase
		upToLimit: aReadLimit
]

{ #category : #testing }
XMLIntegerReader >> atEnd [
	^ readStream atEnd
]

{ #category : #private }
XMLIntegerReader >> errorUnsupportedBase: aBase [
	Error signal: 'Unsupported base ', aBase printString
]

{ #category : #private }
XMLIntegerReader >> next [
	| nextChar |

	self atEnd
		ifFalse: [
			nextChar := readStream next.
			printStream
				ifNotNil: [printStream nextPut: nextChar]].
	^ nextChar.
]

{ #category : #private }
XMLIntegerReader >> nextDigitWithBase: aBase [
	| asciiValue digit |

	((asciiValue := self peek asciiValue) > 0
		and: [asciiValue <= CharacterDigitValues size
			and: [(digit := CharacterDigitValues at: asciiValue) notNil
				and: [digit < aBase]]])
				ifTrue: [
					self next.
					^ digit]
				ifFalse: [^ nil]
]

{ #category : #reading }
XMLIntegerReader >> nextInteger [
	^ self nextIntegerWithBase: 10
]

{ #category : #reading }
XMLIntegerReader >> nextIntegerWithBase: aBase [
	^ self
		nextIntegerWithBase: aBase
		upToLimit: nil
]

{ #category : #reading }
XMLIntegerReader >> nextIntegerWithBase: aFirstBase andPrefixes: aCharacterCollection orBase: aSecondBase [
	^ self
		nextIntegerWithBase: aFirstBase
		andPrefixes: aCharacterCollection
		orBase: aSecondBase
		upToLimit: nil
]

{ #category : #reading }
XMLIntegerReader >> nextIntegerWithBase: aFirstBase andPrefixes: aCharacterCollection orBase: aSecondBase upToLimit: aReadLimit [
	^ self
		nextIntegerWithBase:
			((self atEnd not
				and: [aCharacterCollection includes: self peek])
				ifTrue: [
					self next.
					aFirstBase]
				ifFalse: [aSecondBase])
		upToLimit: aReadLimit
]

{ #category : #reading }
XMLIntegerReader >> nextIntegerWithBase: aBase upToLimit: aReadLimit [
	| integer maxValue maxBaseValue digitValue readLimit |

	(aBase > 1
		and: [aBase <= self class maxBase])
		ifFalse: [self errorUnsupportedBase: aBase].

	self class maxIntegerValue
		ifNotNil: [:maxIntegerValue |
			maxValue := maxIntegerValue.
			maxBaseValue := (maxValue / aBase) floor].
	readLimit := aReadLimit.
	[self atEnd
		or: [(readLimit notNil and: [readLimit <= 0])
			or: [(digitValue := self nextDigitWithBase: aBase) isNil]]]
		whileFalse: [
			integer
				ifNil: [integer := 0].
	
			maxBaseValue
				ifNotNil: [
					integer > maxBaseValue
						ifTrue: [
							self overflowed.
							"handle overflow with saturation"
							^ maxValue]].
			integer := integer * aBase.

			maxValue
				ifNotNil: [
					integer > (maxValue - digitValue)
						ifTrue: [
							self overflowed.
							"handle overflow with saturation"
							^ maxValue]].
			integer := integer + digitValue.
			readLimit
				ifNotNil: [readLimit := readLimit - 1]].
	^ integer.
]

{ #category : #initialization }
XMLIntegerReader >> on: aStringOrStream [
	readStream :=
		aStringOrStream isStream
			ifTrue: [aStringOrStream]
			ifFalse: [aStringOrStream readStream]
]

{ #category : #private }
XMLIntegerReader >> overflowed [
	"can override to raise a warning or error"
]

{ #category : #private }
XMLIntegerReader >> peek [
	self atEnd
		ifTrue: [^ nil]
		ifFalse: [^ readStream peek]
]

{ #category : #accessing }
XMLIntegerReader >> printStream: aStream [
	printStream := aStream
]
