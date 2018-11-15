Class {
	#name : #PPTokenTest,
	#superclass : #PPAbstractParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #accessing }
PPTokenTest >> identifier [
	^ #word asParser plus token
]

{ #category : #utilities }
PPTokenTest >> parse: aString using: aParser [
	^ aParser parse: aString
]

{ #category : #testing }
PPTokenTest >> testCollection [
	| input result |
	input := 'foo    '.
	result := self parse: input using: self identifier.
	self assert: result collection equals: input.
	self assert: result collection == input
]

{ #category : #'testing-querying' }
PPTokenTest >> testColumn [
	| input parser result |
	input := '1' , (String with: (Character codePoint: 13)) , '12' , (String with: (Character codePoint: 13) with: (Character codePoint: 10)) , '123'
		, (String with: (Character codePoint: 10)) , '1234'.
	parser := #any asParser token star.
	result := parser parse: input.
	result with: #(1 2 1 2 3 4 1 2 3 4 1 2 3 4) do: [ :token :line | self assert: token column equals: line ]
]

{ #category : #'testing-copying' }
PPTokenTest >> testCopyFromTo [
	| result other |
	result := PPToken on: 'abc'.
	other := result copyFrom: 2 to: 2.
	self assert: other size equals: 1.
	self assert: other start equals: 2.
	self assert: other stop equals: 2.
	self assert: other collection equals: result collection
]

{ #category : #'testing-comparing' }
PPTokenTest >> testEquality [
	| token1 token2 |
	token1 := self parse: 'foo' using: self identifier.
	token2 := self parse: 'foo' using: self identifier.
	self deny: token1 == token2.
	self assert: token1 equals: token2.
	self assert: token1 hash equals: token2 hash
]

{ #category : #testing }
PPTokenTest >> testInitialize [
	PPToken initialize
]

{ #category : #'testing-values' }
PPTokenTest >> testInputValue [
	| input result |
	input := 'foo'.
	result := self parse: input using: self identifier.
	self assert: result inputValue equals: input.
	self deny: result inputValue == input
]

{ #category : #'testing-querying' }
PPTokenTest >> testLine [
	| input parser result |
	input := '1' , (String with: (Character codePoint: 13)) , '12' , (String with: (Character codePoint: 13) with: (Character codePoint: 10)) , '123'
		, (String with: (Character codePoint: 10)) , '1234'.
	parser := #any asParser token star.
	result := parser parse: input.
	result with: #(1 1 2 2 2 2 3 3 3 3 4 4 4 4) do: [ :token :line | self assert: token line equals: line ]
]

{ #category : #testing }
PPTokenTest >> testNew [
	self should: [ PPToken new ] raise: Error.
	
]

{ #category : #'testing-values' }
PPTokenTest >> testParsedValue [
	| input result |
	input := 'foo'.
	result := self parse: input using: self identifier.
	self assert: result parsedValue equals: #($f $o $o)
]

{ #category : #testing }
PPTokenTest >> testPrinting [
	| result |
	result := PPToken on: 'var'.
	self assert: result printString includesSubstring: 'PPToken[1,3]'
]

{ #category : #testing }
PPTokenTest >> testSize [
	| result |
	result := self parse: 'foo' using: self identifier.
	self assert: result size equals: 3
]

{ #category : #testing }
PPTokenTest >> testStart [
	| result |
	result := self parse: 'foo' using: self identifier.
	self assert: result start equals: 1
]

{ #category : #testing }
PPTokenTest >> testStop [
	| result |
	result := self parse: 'foo' using: self identifier.
	self assert: result stop equals: 3
]

{ #category : #testing }
PPTokenTest >> testValue [
	| result |
	result := PPToken on: 'var'.
	self should: [ result value ] raise: Notification
]
