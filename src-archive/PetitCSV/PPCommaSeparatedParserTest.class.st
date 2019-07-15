Class {
	#name : #PPCommaSeparatedParserTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'row',
		'cell',
		'rows'
	],
	#category : #PetitCSV
}

{ #category : #'as yet unclassified' }
PPCommaSeparatedParserTest >> parserClass [
	^ PPCommaSeparatedParser
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParserTest >> testCell [
	self assert: '123' is: #(('123')).
	self assert: 'abc' is: #(('abc')).
	self assert: 'ASDASD123' is: #(('ASDASD123')).

]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParserTest >> testSingleLine [
	self assert: '1 , 2, 3' is: #(('1' '2' '3')).
	self assert: 'a1 , 2, 3' is: #(('a1' '2' '3')).
	self assert: 'a , 2, 3' is: #(('a' '2' '3')).

]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParserTest >> testTwoLines [
	self assert: '1
2' is: {{'1'} .{'2'}}
]
