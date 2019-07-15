Class {
	#name : #PPArithmeticParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #accessing }
PPArithmeticParserTest >> parserClass [
	^ PPArithmeticParser
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testAdd [
	self assert: '1 + 2' is: 3.
	self assert: '2 + 1' is: 3.
	self assert: '1 + 2.3' is: 3.3.
	self assert: '2.3 + 1' is: 3.3.
	self assert: '1 + -2' is: -1.
	self assert: '-2 + 1' is: -1
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testAddMany [
	self assert: '1' is: 1.
	self assert: '1 + 2' is: 3.
	self assert: '1 + 2 + 3' is: 6.
	self assert: '1 + 2 + 3 + 4' is: 10.
	self assert: '1 + 2 + 3 + 4 + 5' is: 15
]

{ #category : #'testing-expression' }
PPArithmeticParserTest >> testBrackets [
	self assert: '(1)' is: 1.
	self assert: '(1 + 2)' is: 3.
	
	self assert: '((1))' is: 1.
	self assert: '((1 + 2))' is: 3.

	self assert: '2 * (3 + 4)' is: 14.
	self assert: '(2 + 3) * 4' is: 20.
	self assert: '6 / (2 + 4)' is: 1.
	self assert: '(2 + 6) / 2' is: 4
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testDiv [
	self assert: '12 / 3' is: 4.
	self assert: '-16 / -4' is: 4
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testDivMany [
	self assert: '100 / 2' is: 50.
	self assert: '100 / 2 / 2' is: 25.
	self assert: '100 / 2 / 2 / 5' is: 5.
	self assert: '100 / 2 / 2 / 5 / 5' is: 1
	
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testMul [
	self assert: '2 * 3' is: 6.
	self assert: '2 * -4' is: -8
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testMulMany [
	self assert: '1 * 2' is: 2.
	self assert: '1 * 2 * 3' is: 6.
	self assert: '1 * 2 * 3 * 4' is: 24.
	self assert: '1 * 2 * 3 * 4 * 5' is: 120
]

{ #category : #testing }
PPArithmeticParserTest >> testNum [
	self assert: '0' is: 0.
	self assert: '0.0' is: 0.0.
	self assert: '1' is: 1.
	self assert: '1.2' is: 1.2.
	self assert: '34' is: 34.
	self assert: '56.78' is: 56.78.
	self assert: '-9' is: -9.
	self assert: '-9.9' is: -9.9
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testPow [
	self assert: '2 ^ 3' is: 8.
	self assert: '-2 ^ 3' is: -8.
	self assert: '-2 ^ -3' is: -0.125
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testPowMany [
	self assert: '4 ^ 3' is: 64.
	self assert: '4 ^ 3 ^ 2' is: 262144.
	self assert: '4 ^ 3 ^ 2 ^ 1' is: 262144.
	self assert: '4 ^ 3 ^ 2 ^ 1 ^ 0' is: 262144
]

{ #category : #'testing-expression' }
PPArithmeticParserTest >> testPriority [
	self assert: '2 * 3 + 4' is: 10.
	self assert: '2 + 3 * 4' is: 14.
	self assert: '6 / 3 + 4' is: 6.
	self assert: '2 + 6 / 2' is: 5
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testSub [
	self assert: '1 - 2' is: -1.
	self assert: '1.2 - 1.2' is: 0.
	self assert: '1 - -2' is: 3.
	self assert: '-1 - -2' is: 1
]

{ #category : #'testing-operations' }
PPArithmeticParserTest >> testSubMany [
	self assert: '1' is: 1.
	self assert: '1 - 2' is: -1.
	self assert: '1 - 2 - 3' is: -4.
	self assert: '1 - 2 - 3 - 4' is: -8.
	self assert: '1 - 2 - 3 - 4 - 5' is: -13
]
