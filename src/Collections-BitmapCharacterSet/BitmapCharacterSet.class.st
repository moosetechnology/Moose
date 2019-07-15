"
This class implements a set of Character objects similar to CharacterSet and WideCharacterSet, but it uses a bitmap internally to test if wide (multibyte) characters belong to it rather than using a Dictionary like WideCharacterSet does. For byte characters, a simple 256-element Array is used, the same as with CharacterSet, which is faster but uses more memory.

(Used by and heavily optimized for XMLParser; please refactor carefully)
"
Class {
	#name : #BitmapCharacterSet,
	#superclass : #Collection,
	#instVars : [
		'byteCharacters',
		'wideCharacters',
		'tally'
	],
	#category : #'Collections-BitmapCharacterSet'
}

{ #category : #inspecting }
BitmapCharacterSet class >> inspectorClass [
	"does not use Set class>>inspectorClass because it is incompatible"
	^ Smalltalk tools inspectorClass
]

{ #category : #'instance creation' }
BitmapCharacterSet class >> new [
	^ self new: 256
]

{ #category : #'instance creation' }
BitmapCharacterSet class >> new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{ #category : #'instance creation' }
BitmapCharacterSet class >> newFrom: aCollection [
	"for GS portability"
	^ self new
		addAll: aCollection;
		yourself	
]

{ #category : #copying }
BitmapCharacterSet >> , aCollection [
	"GS doesn't define #, for non-Sequenceable collections"
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
BitmapCharacterSet >> = anObject [
	self == anObject
		ifTrue: [^ true].

	(self species == anObject species
		and: [self size = anObject size])
		ifFalse: [^ false].

	self do: [:each |
		(anObject includes: each)
			ifFalse: [^ false]].
	^ true.
]

{ #category : #adding }
BitmapCharacterSet >> add: aCharacter [
	| asciiValue |

	"optimized for speed with inlining; do not refactor"
	(asciiValue := aCharacter asciiValue) < 256
		ifTrue: [
			(byteCharacters at: asciiValue + 1)
				ifFalse: [tally := tally + 1].
			byteCharacters
				at: asciiValue + 1
				put: true]
		ifFalse: [| byteIndex byte bitmask |
			"256 // 8 - 31 = 1 (first index), (256 + 8) // 8 - 31 = 2 (second), etc
			(with 'bitShift: -3' used over '// 8' for speed)"
			byteIndex := (asciiValue bitShift: -3) - 31.
			(wideCharacters == nil
				or: [byteIndex > wideCharacters size])
				ifTrue: [self growWideCharacterBitmapTo: (byteIndex * 1.5) asInteger].

			"raises an error if asciiValue > 16r10FFFF"
			byte := wideCharacters at: byteIndex.

			"for the byte bitmask, left shift 1 by 7 - (asciiValue \\ 8)
			(with 'bitAnd: 7' used over '\\ 8' for speed)"
			bitmask := 1 bitShift: 7 - (asciiValue bitAnd: 7).
			
			"increment the tally if the character is not already present"
			(byte bitAnd: bitmask) == 0
				ifTrue: [tally := tally + 1].

			wideCharacters
				at: byteIndex
				put: (byte bitOr: bitmask)].
	^ aCharacter.
]

{ #category : #adding }
BitmapCharacterSet >> addRangeFrom: aStartCharacter to: aStopCharacter [
	"Adds character range from aStartCharacter to aStopCharacter inclusive
	or none if aStartCharacter > aStopCharacter. Returns self to avoid
	creating a temp collection of the added characters."

	"chars don't support to:do: (compiled inline) and using to: and do:
	separately needlessly creates a (possibly large) temp array"
	aStartCharacter asciiValue
		to: aStopCharacter asciiValue
		do: [:i | self add: (Character value: i)]
]

{ #category : #private }
BitmapCharacterSet >> byteCharacters [
	^ byteCharacters
]

{ #category : #enumerating }
BitmapCharacterSet >> byteCharactersDo: aBlock [
	1 to: byteCharacters size do: [:i |
		(byteCharacters at: i)
			ifTrue: [aBlock value: (Character value: i - 1)]]
]

{ #category : #accessing }
BitmapCharacterSet >> capacity [
	^ byteCharacters size +
		(wideCharacters
			ifNil: [0]
			ifNotNil: [wideCharacters size * 8]).
]

{ #category : #converting }
BitmapCharacterSet >> complement [
	| copy |

	copy := self copyEmpty.
	0 to: 16r10FFFF do: [:i | | character |
		character := (Character value: i).
		(self includes: character)
			ifFalse: [copy add: character]].
	^ copy.
]

{ #category : #copying }
BitmapCharacterSet >> copyEmpty [
	"reimplemented for GS and Squeak compatibility"
	^ self species new: self capacity
]

{ #category : #enumerating }
BitmapCharacterSet >> do: aBlock [
	self
		byteCharactersDo: aBlock;
		wideCharactersDo: aBlock
]

{ #category : #private }
BitmapCharacterSet >> growWideCharacterBitmapTo: aSizeInBytes [
	| newSize |

	newSize := aSizeInBytes min: self maxWideCharactersSize.
	wideCharacters
		ifNil: [wideCharacters := ByteArray new: newSize]
		ifNotNil: [
			wideCharacters :=
				(ByteArray new: newSize)
					replaceFrom: 1
					to: wideCharacters size
					with: wideCharacters
					startingAt: 1].
]

{ #category : #testing }
BitmapCharacterSet >> hasWideCharacters [
	self wideCharactersDo: [:each | ^ true].
	^ false.
]

{ #category : #comparing }
BitmapCharacterSet >> hash [
	| hash |

	hash := self species hash.
	self byteCharactersDo: [:each |
		hash := hash bitXor: each hash].
	^ hash bitXor: self size hash.
]

{ #category : #testing }
BitmapCharacterSet >> includes: aCharacter [
	| asciiValue |

	"optimized for speed with inlining; do not refactor"
	(asciiValue := aCharacter asciiValue) < 256
		ifTrue: [^ byteCharacters at: asciiValue + 1]
		ifFalse: [| byteIndex |
			wideCharacters
				ifNil: [^ false].

			"256 // 8 - 31 = 1 (first index), (256 + 8) // 8 - 31 = 2 (second), etc
			(with 'bitShift: -3' used over '// 8' for speed)"
			(byteIndex := (asciiValue bitShift: -3) - 31) > wideCharacters size
				ifTrue: [^ false].

			"for the byte bitmask, left shift 1 by 7 - (asciiValue \\ 8)
			(with 'bitAnd: 7' used over '\\ 8' for speed)"
			^ ((wideCharacters at: byteIndex) bitAnd:
				(1 bitShift: 7 - (asciiValue bitAnd: 7))) > 0]
]

{ #category : #testing }
BitmapCharacterSet >> includesRangeFrom: aStartCharacter to: aStopCharacter [
	"Tests for character range from aStartCharacter to aStopCharacter
	inclusive. Always returns true if aStartCharacter > aStopCharacter."

	"chars don't support to:do: (compiled inline) and using to: and do:
	separately needlessly creates a (possibly large) temp array"
	aStartCharacter asciiValue
		to: aStopCharacter asciiValue
		do: [:i |
			(self includes: (Character value: i))
				ifFalse: [^ false]].
	^ true.
]

{ #category : #initialization }
BitmapCharacterSet >> initialize: aCapacity [
	byteCharacters := Array new: 256 withAll: false.
	aCapacity > 256
		ifTrue: [
			"(257 - 1) // 8 - 31 = 1 (first byte),
			(257 + 8 - 1) // 8 - 31 = 2 (second byte), etc
			(with 'bitShift: -3' used over '// 8' for speed)"
			self growWideCharacterBitmapTo: ((aCapacity - 1) bitShift: -3) - 31].
	tally := 0.
]

{ #category : #testing }
BitmapCharacterSet >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #private }
BitmapCharacterSet >> maxWideCharactersSize [
	^ 139232 "(16r10FFFF bitShift: -3) - 31"
]

{ #category : #copying }
BitmapCharacterSet >> postCopy [
	byteCharacters := byteCharacters copy.
	wideCharacters
		ifNotNil: [wideCharacters := wideCharacters copy].
]

{ #category : #removing }
BitmapCharacterSet >> remove: aCharacter ifAbsent: aBlock [
	| asciiValue |

	"optimized for speed with inlining; do not refactor"
	(asciiValue := aCharacter asciiValue) < 256
		ifTrue: [
			(byteCharacters at: asciiValue + 1)
				ifFalse: [^ aBlock value].
			byteCharacters
				at: asciiValue + 1
				put: false]
		ifFalse: [| byteIndex byte bitmask |
			wideCharacters
				ifNil: [^ aBlock value].
	
			"256 // 8 - 31 = 1 (first index), (256 + 8) // 8 - 31 = 2 (second), etc
			(with 'bitShift: -3' used over '// 8' for speed)"
			(byteIndex := (asciiValue bitShift: -3) - 31) > wideCharacters size
				ifTrue: [^ aBlock value].

			"for the byte bitmask, left shift 1 by 7 - (asciiValue \\ 8)
			(with 'bitAnd: 7' used over '\\ 8' for speed)"
			bitmask := 1 bitShift: 7 - (asciiValue bitAnd: 7).
			((byte := wideCharacters at: byteIndex) bitAnd: bitmask) == 0
				ifTrue: [^ aBlock value].

			wideCharacters
				at: byteIndex
				put: (byte bitAnd: bitmask bitInvert)].
	tally := tally - 1.
	^ aCharacter.
]

{ #category : #removing }
BitmapCharacterSet >> removeAll [
	"empties but preserves the capacity"

	1 to: byteCharacters size do: [:i |
		byteCharacters
			at: i
			put: false].
	wideCharacters
		ifNotNil: [
			1 to: wideCharacters size do: [:i |
				wideCharacters
					at: i
					put: 0]].
	tally := 0.
]

{ #category : #removing }
BitmapCharacterSet >> removeRangeFrom: aStartCharacter to: aStopCharacter [
	"Removes character range from aStartCharacter to aStopCharacter inclusive
	or none if aStartCharacter > aStopCharacter. Returns self to avoid
	creating a temp collection of the removed characters."

	"chars don't support to:do: (compiled inline) and using to: and do:
	separately needlessly creates a (possibly large) temp array"
	aStartCharacter asciiValue
		to: aStopCharacter asciiValue
		do: [:i | self remove: (Character value: i)]
]

{ #category : #accessing }
BitmapCharacterSet >> size [
	^ tally
]

{ #category : #private }
BitmapCharacterSet >> wideCharacters [
	^ wideCharacters
]

{ #category : #enumerating }
BitmapCharacterSet >> wideCharactersDo: aBlock [
	"optimized for speed with to:do: and inlining; do not refactor"
	| baseValue |

	wideCharacters
		ifNil: [^ self].

	baseValue := 256.
	1 to: wideCharacters size do: [:byteIndex | | byte |
		(byte := wideCharacters at: byteIndex) == 0
			ifFalse: [
				0 to: 7 do: [:shiftIndex |
					(byte bitAnd: (1 bitShift: 7 - shiftIndex)) == 0
						ifFalse: [
							aBlock value:
								(Character value: baseValue + shiftIndex)]]].
		baseValue := baseValue + 8].
]
