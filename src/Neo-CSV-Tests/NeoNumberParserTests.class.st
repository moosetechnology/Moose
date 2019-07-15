"
I am NeoNumberParserTests the unit test suite for NeoNumberParser.
"
Class {
	#name : #NeoNumberParserTests,
	#superclass : #TestCase,
	#category : 'Neo-CSV-Tests'
}

{ #category : #testing }
NeoNumberParserTests >> testBinaryIntegers [
	self assert: (NeoNumberParser parse: '1111011' base: 2) equals: 123.
	self assert: (NeoNumberParser parse: '-1111011' base: 2) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 2) equals: 0.


]

{ #category : #testing }
NeoNumberParserTests >> testDecimalIntegers [
	self assert: (NeoNumberParser parse: '123') equals: 123.
	self assert: (NeoNumberParser parse: '-123') equals: -123.
	self assert: (NeoNumberParser parse: '0') equals: 0.
	self assert: (NeoNumberParser parse: '12345678901234567890') equals: 12345678901234567890.

	self 
		assert: (NeoNumberParser parse: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') 
		equals: 12345678901234567890123456789012345678901234567890123456789012345678901234567890.
		
	self assert: (NeoNumberParser parse: '00123ABC') equals: 123.
	self assert: (NeoNumberParser parse: '-0') equals: 0.

]

{ #category : #testing }
NeoNumberParserTests >> testErrors [
	self should: [ NeoNumberParser parse: nil ] raise: Error.
	self should: [ NeoNumberParser parse: '' ] raise: Error.
	self should: [ NeoNumberParser parse: '.5' ] raise: Error.
	
	self should: [ NeoNumberParser parse: '-' ] raise: Error.
	self should: [ NeoNumberParser parse: '+' ] raise: Error.
	self should: [ NeoNumberParser parse: 'x' ] raise: Error.
	
	self should: [ NeoNumberParser parse: '-a' ] raise: Error.
	self should: [ NeoNumberParser parse: '_' ] raise: Error.
]

{ #category : #testing }
NeoNumberParserTests >> testFloats [
	#('1.5' 1.5 '-1.5' -1.5 '0.0' 0.0 '3.14159' 3.14159 '1e3' 1000.0 '1e-2' 0.01)
		pairsDo: [ :string :float | 
			self assert: ((NeoNumberParser parse: string) closeTo: float) ]
]

{ #category : #testing }
NeoNumberParserTests >> testFloatsRadixPoint [
	#('1,5' 1.5 '-1,5' -1.5 '0,0' 0.0 '3,14159' 3.14159 '1e3' 1000.0 '1e-2' 0.01)
		pairsDo: [ :string :float | 
			self assert: (((NeoNumberParser on: string) radixPoint: $,; next) closeTo: float) ]
]

{ #category : #testing }
NeoNumberParserTests >> testHexadecimalIntegers [
	self assert: (NeoNumberParser parse: '7B' base: 16) equals: 123.
	self assert: (NeoNumberParser parse: '-7B' base: 16) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 16) equals: 0.
	"On some platforms Character>>#digitValue only handles uppercase,
	then NeoNumberParser cannot deal with lowercase hex characters"
	$a digitValue = 10 ifFalse: [ ^ self ].
	self assert: (NeoNumberParser parse: '7b' base: 16) equals: 123.
	self assert: (NeoNumberParser parse: '-7b' base: 16) equals: -123

]

{ #category : #testing }
NeoNumberParserTests >> testNumberExtraction [
	self assert: (NeoNumberParser parse: '00123ABC') equals: 123.
	self assert: ((NeoNumberParser on: '  123ABC') consumeWhitespace; next) equals: 123.
	self should: [ (NeoNumberParser on: '  123ABC') consumeWhitespace; next; failIfNotAtEnd ] raise: Error.

]

{ #category : #testing }
NeoNumberParserTests >> testOctalIntegers [
	self assert: (NeoNumberParser parse: '173' base: 8) equals: 123.
	self assert: (NeoNumberParser parse: '-173' base: 8) equals: -123.
	self assert: (NeoNumberParser parse: '0' base: 8) equals: 0.


]
