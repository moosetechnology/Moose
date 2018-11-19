Class {
	#name : #XMLIntegerReaderTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #testing }
XMLIntegerReaderTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLIntegerReaderTest >> integerReaderClass [
	^ XMLIntegerReader
]

{ #category : #accessing }
XMLIntegerReaderTest >> maxBase [
	^ self integerReaderClass maxBase
]

{ #category : #accessing }
XMLIntegerReaderTest >> maxIntegerValue [
	^ self integerReaderClass maxIntegerValue
]

{ #category : #'instance creation' }
XMLIntegerReaderTest >> newIntegerReaderOn: aStream [
	^ self integerReaderClass on: aStream
]

{ #category : #'instance creation' }
XMLIntegerReaderTest >> newStreamOn: aCollection [
	^ XMLExceptionRaisingReadStream on: aCollection
]

{ #category : #tests }
XMLIntegerReaderTest >> testBaseMarker [
	2 to: self maxBase do: [:base | | stream defaultBase |
		defaultBase := (base - 1) max: 2.
		stream := self newStreamOn: ((base printStringBase: base) copyWithFirst: $#).
		self
			assert:
				(self integerReaderClass
					readFrom: stream
					withBase: base
					andPrefixes: '@#$'
					orBase: defaultBase) = base;
			assert: stream atEnd.

		stream := self newStreamOn: (base printStringBase: defaultBase).
		self
			assert:
				(self integerReaderClass
					readFrom: stream
					withBase: base
					andPrefixes: '@#$'
					orBase: defaultBase) = base;
			assert: stream atEnd]
]

{ #category : #tests }
XMLIntegerReaderTest >> testBases [
	2 to: self maxBase do: [:base | | stream |
		(0 to: base), (base + 1 to: base * 10 by: base) do: [:i |
			stream := self newStreamOn: (i printStringBase: base).
			self
				assert: (self integerReaderClass readFrom: stream withBase: base) = i;
				assert: stream atEnd]].
	self
		should: [
			self integerReaderClass
				readFrom: (self newStreamOn: '1')
				withBase: 1]
		raise: Error.
	self
		should: [
			self integerReaderClass
				readFrom: (self newStreamOn: '1')
				withBase: self maxBase + 1]
		raise: Error.
]

{ #category : #tests }
XMLIntegerReaderTest >> testMaxIntegerValue [
	| maxValue |

	(maxValue := self maxIntegerValue)
		ifNil: [^ self].
	2 to: self maxBase do: [:base |
		self assert:
			(self integerReaderClass
				readFrom: (self newStreamOn: (maxValue printStringBase: base))
				withBase: base) = maxValue.
		1 to: base do: [:i |
			self  assert:
				(self integerReaderClass
					readFrom: (self newStreamOn: ((maxValue + i) printStringBase: base))
					withBase: base) = maxValue]].
]

{ #category : #tests }
XMLIntegerReaderTest >> testNonDigit [
	2 to: self maxBase do: [:base | | digitInterval letterInterval uppercaseLetterInterval |
		base > 10
			ifTrue: [
				digitInterval := $0 asciiValue to: $9 asciiValue.
				letterInterval := $a asciiValue to: $a asciiValue + (base - 11).
				uppercaseLetterInterval := $A asciiValue to: $A asciiValue + (base - 11)]
			ifFalse: [
				digitInterval := $0 asciiValue to: $0 asciiValue + base - 1.
				letterInterval := #().
				uppercaseLetterInterval := #()].
		0 to: 256 do: [:each | | char reader |
			char := each asCharacter.
			reader := self newIntegerReaderOn: (self newStreamOn: char asString).
			((digitInterval includes: each)
				or: [(letterInterval includes: each)
					or: [uppercaseLetterInterval includes: each]])
				ifTrue: [
					self
						assert: (reader nextIntegerWithBase: base) notNil;
						assert: reader atEnd]
				ifFalse: [
					self
						assert: (reader nextIntegerWithBase: base) isNil;
						deny: reader atEnd;
						assert: reader next = char;
						assert: reader atEnd]]]
]

{ #category : #tests }
XMLIntegerReaderTest >> testPositioning [
	| reader string |

	string := 'test'.
	reader := self newIntegerReaderOn: (self newStreamOn: string).
	string do: [:each |
		self
			deny: reader atEnd;
			assert: reader peek = each;
			assert: reader next = each].
	self
		assert: reader atEnd;
		assert: reader peek isNil;
		assert: reader next isNil.
]

{ #category : #tests }
XMLIntegerReaderTest >> testPrintStream [
	| printStream reader |

	printStream := String new writeStream.
	(reader := self newIntegerReaderOn: (self newStreamOn: '123xABChdefO11'))
		printStream: printStream.
	self
		assert: (reader nextIntegerWithBase: 10) = 123;
		assert: printStream contents = '123';
		assert: (reader nextIntegerWithBase: 16 andPrefixes: 'x' orBase: 10) = 2748;
		assert: printStream contents = '123xABC';
		assert: (reader nextIntegerWithBase: 16 andPrefixes: 'h' orBase: 10) = 3567;
		assert: printStream contents = '123xABChdef'.

	reader printStream: nil.
	self
		assert: (reader nextIntegerWithBase: 8 andPrefixes: 'oO' orBase: 10) = 9;
		assert: printStream contents = '123xABChdef';
		assert: reader atEnd.
]

{ #category : #tests }
XMLIntegerReaderTest >> testReadLimit [
	2 to: self maxBase do: [:base | | stream |
		"101 regardless of base"
		stream := self newStreamOn: (base * base + 1 printStringBase: base).
		self
			assert: (self integerReaderClass readFrom: stream withBase: base upToLimit: 2) = base;
			deny: stream atEnd;
			assert: stream next == $1]
]
