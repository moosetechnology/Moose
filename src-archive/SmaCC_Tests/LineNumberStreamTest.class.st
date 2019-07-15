Class {
	#name : #LineNumberStreamTest,
	#superclass : #TestCase,
	#category : #'SmaCC_Tests'
}

{ #category : #private }
LineNumberStreamTest >> addCRLFsTo: aString [
	^ aString
		copyReplaceAll: '\'
		with: (String with: Character cr with: Character lf)
]

{ #category : #private }
LineNumberStreamTest >> addCRsTo: aString [
	^ aString copyReplaceAll: '\' with: (String with: Character cr)
]

{ #category : #private }
LineNumberStreamTest >> addLFsTo: aString [
	^ aString copyReplaceAll: '\' with: (String with: Character lf)
]

{ #category : #tests }
LineNumberStreamTest >> testCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4
			timesRepeat:
				[ self
					assert: stream columnNumber = (stream next asInteger - $0 asInteger) ].
		stream upTo: Character lf ]
]

{ #category : #tests }
LineNumberStreamTest >> testCRLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4
			timesRepeat:
				[ self
					assert: stream columnNumber = (stream next asInteger - $0 asInteger) ].
		stream upTo: Character cr ]
]

{ #category : #tests }
LineNumberStreamTest >> testEmptyLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '\\\')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		stream upTo: Character cr ]
]

{ #category : #tests }
LineNumberStreamTest >> testForwardPositionCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	stream position: 3.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1
]

{ #category : #tests }
LineNumberStreamTest >> testLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4
			timesRepeat:
				[ self
					assert: stream columnNumber = (stream next asInteger - $0 asInteger) ].
		stream upTo: Character lf ]
]

{ #category : #tests }
LineNumberStreamTest >> testNoLines [
	| stream index |
	stream := SmaCCLineNumberStream on: (ReadStream on: 'this is a test').
	self assert: stream lineNumber = 1.
	index := 1.
	stream
		do:
			[ :each | 
			self assert: stream lineNumber = 1.
			index := index + 1.
			self assert: stream columnNumber = index ]
]

{ #category : #tests }
LineNumberStreamTest >> testPositionCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	self assert: stream lineNumber = 1.
	stream upTo: $5.
	self assert: stream lineNumber = 4.
	stream position: 0.
	self assert: stream lineNumber = 1.
	self assert: stream columnNumber = 1.
	stream position: 3.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1
]

{ #category : #tests }
LineNumberStreamTest >> testPositionCRLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1\2\3\4')).
	self assert: stream lineNumber = 1.
	stream upTo: $5.
	self assert: stream lineNumber = 4.
	stream skip: -1.
	self assert: stream lineNumber = 4.
	self assert: stream columnNumber = 1.
	stream position: 0.
	self assert: stream lineNumber = 1.
	self assert: stream columnNumber = 1.
	stream position: 2.
	self assert: stream lineNumber = 2.
	self assert: stream columnNumber = 1
]
