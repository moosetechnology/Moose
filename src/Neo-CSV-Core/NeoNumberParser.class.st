"
I am NeoNumberParser, an alternative number parser that needs only a minimal read stream protocol. 

I accept the following syntax:

	number
	  int
	  int frac
	  int exp
	  int frac exp
	int
	  digits
	  - digits
	frac
	  . digits
	exp
	  e digits
	digits
	  digit
	  digit digits
	e
	  e
	  e+
	  e-
	  E
	  E+
	  E-

where digit depends on the base (2 to 36), 0 .. 9, A-Z, a-z.
"
Class {
	#name : #NeoNumberParser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'base',
		'radixPoint'
	],
	#category : 'Neo-CSV-Core'
}

{ #category : #'instance creation' }
NeoNumberParser class >> on: stringOrStream [
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ self new
		on: stream;
		yourself
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream [
	^ (self on: stringOrStream) next
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream base: base [
	^ (self on: stringOrStream)
		base: base;
		next
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream base: base ifFail: block [
	^ [ self parse: stringOrStream base: base ]
		on: Error
		do: block
]

{ #category : #queries }
NeoNumberParser class >> parse: stringOrStream ifFail: block [
	^ [ self parse: stringOrStream ]
		on: Error
		do: block
]

{ #category : #testing }
NeoNumberParser >> atEnd [
	^ stream atEnd
]

{ #category : #'initialize-release' }
NeoNumberParser >> base: integer [
	self assert: (integer between: 2 and: 36) description: 'Number base must be between 2 and 36'.
	base := integer
]

{ #category : #parsing }
NeoNumberParser >> consumeWhitespace [
	"Strip whitespaces from the input stream."

	[ stream atEnd not and: [ stream peek isSeparator ] ] 
		whileTrue: [ stream next ]

]

{ #category : #parsing }
NeoNumberParser >> failIfNotAtEnd [
	self atEnd
		ifFalse: [ self error: 'extraneous input detected' ]
]

{ #category : #'initialize-release' }
NeoNumberParser >> initialize [
	super initialize.
	self base: 10.
	self radixPoint: $.
]

{ #category : #accessing }
NeoNumberParser >> next [
	^ self parseNumber
]

{ #category : #'initialize-release' }
NeoNumberParser >> on: readStream [
	stream := readStream 
]

{ #category : #parsing }
NeoNumberParser >> parseNumber [
	| negated number |
	negated := stream peekFor: $-.
	number := self parseNumberInteger.
	(stream peekFor: radixPoint)
		ifTrue: [ number := number + self parseNumberFraction ].
	((stream peekFor: $e) or: [ stream peekFor: $E ])
		ifTrue: [ number := number * self parseNumberExponent ].
	negated
		ifTrue: [ number := number negated ].
	^ number
]

{ #category : #parsing }
NeoNumberParser >> parseNumberExponent [
	| number negated x |
	number := 0.
	(negated := stream peekFor: $-)
		ifFalse: [ stream peekFor: $+ ].
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			number := base * number + x. 
			stream next ].
	negated
		ifTrue: [ number := number negated ].
	^ base raisedTo: number
]

{ #category : #parsing }
NeoNumberParser >> parseNumberFraction [
	| number power x |
	number := 0.
	power := 1.0.
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			number := base * number + x.
			power := power * base.
			stream next ].
	^ number / power
]

{ #category : #parsing }
NeoNumberParser >> parseNumberInteger [
	| number x found |
	number := 0.
	found := false.
	[ (x := stream peek) notNil and: [ (x := x digitValue) >= 0 and: [ x < base ] ] ]
		whileTrue: [ 
			found := true.
			number := base * number + x.
			stream next ].
	found 
		ifFalse: [ self error: 'Integer digit expected' ].
	^ number
]

{ #category : #'initialize-release' }
NeoNumberParser >> radixPoint: radixCharacter [
	radixPoint := radixCharacter 
]
