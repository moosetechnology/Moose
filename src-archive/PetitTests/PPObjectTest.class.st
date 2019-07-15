Class {
	#name : #PPObjectTest,
	#superclass : #PPAbstractParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #parsers }
PPObjectTest >> integer [
	^ PPPredicateObjectParser
		on: [ :each | each isKindOf: Integer ]
		message: 'integer expected'
]

{ #category : #parsers }
PPObjectTest >> string [
	^ PPPredicateObjectParser
		on: [ :each | each isKindOf: String ]
		message: 'string expected'
]

{ #category : #'testing-operators' }
PPObjectTest >> testChoice [
	| parser |
	parser := self integer / self string.
	self assert: parser parse: #(123) to: 123.
	self assert: parser parse: #('abc') to: 'abc'
]

{ #category : #'testing-fancy' }
PPObjectTest >> testFibonacci [
	"This parser accepts fibonacci sequences with arbitrary start pairs."
	
	| parser |
	parser := ((self integer , self integer) end ==> [ :pair | pair first + pair last ])
		/ (self integer , (self integer , self integer) and >=> [ :stream :continuation |
			| result |
			result := continuation value.
			(result isPetitFailure or: [ result first + result last first ~= result last last ])
				ifFalse: [ parser parseOn: stream ]
				ifTrue: [ PPFailure message: 'invalid fibonacci sequence' context: stream ] ]).
	self assert: parser parse: #(1 1) to: 2.
	self assert: parser parse: #(1 1 2) to: 3.
	self assert: parser parse: #(1 1 2 3) to: 5.
	self assert: parser parse: #(1 1 2 3 5) to: 8.
	self assert: parser parse: #(1 1 2 3 5 8) to: 13.
	self assert: parser parse: #(1 1 2 3 5 8 13) to: 21.
	self assert: parser fail: #().
	self assert: parser fail: #(1).
	self assert: parser fail: #(1 2 3 4) end: 2
	
]

{ #category : #testing }
PPObjectTest >> testInteger [
	self assert: self integer parse: #(123) to: 123.
	self assert: self integer fail: #('abc')
]

{ #category : #'testing-operators' }
PPObjectTest >> testSequence [
	| parser |
	parser := self integer , self string.
	self assert: parser parse: #(123 'abc') to: #(123 'abc').
	self assert: parser fail: #(123 456).
	self assert: parser fail: #('abc' 'def').
	self assert: parser fail: #('abc' 123)
	
]

{ #category : #testing }
PPObjectTest >> testString [
	self assert: self string parse: #('abc') to: 'abc'.
	self assert: self string fail: #(123)
]
