Class {
	#name : #PPIndentStreamTest,
	#superclass : #TestCase,
	#instVars : [
		'aStream'
	],
	#category : #'PetitIndent-Tests'
}

{ #category : #asserting }
PPIndentStreamTest >> assert: aPPStream position: position   line: line  column: col [
	
	self assert: (aPPStream  line: position) = line .
	self assert: (aPPStream  column: position) = col  .
]

{ #category : #'as yet unclassified' }
PPIndentStreamTest >> test1 [
	aStream := PPStream on:
'Hi there
	how are you?'.
	
	self 
		assert: aStream
		position: -1
		line: 0
		column: 0.
		
	self
		assert: aStream
		position: 0
		line: 1
		column: 1.
	self
		assert: aStream
		position: 3
		line: 1
		column: 4.

	self
		assert: aStream
		position: 8
		line: 1
		column: 9.
				
	self
		assert: aStream
		position: 9
		line: 2
		column: 1.
		
	self
		assert: aStream
		position: 13
		line: 2
		column: 5.
		
	self
		assert: aStream
		position: 22
		line: 2
		column: 14.
]

{ #category : #'as yet unclassified' }
PPIndentStreamTest >> test2 [
	aStream := PPStream on:
'a
b

cd'.
	
	self 
		assert: aStream
		position: -1
		line: 0
		column: 0.
		
	self
		assert: aStream
		position: 0
		line: 1
		column: 1.
	self
		assert: aStream
		position: 1
		line: 1
		column: 2.
	self
		assert: aStream
		position: 2
		line: 2
		column: 1.
	self
		assert: aStream
		position: 3
		line: 2
		column: 2.
	self
		assert: aStream
		position: 4
		line: 3
		column: 1.
	self
		assert: aStream
		position: 5
		line: 4
		column: 1.
	self
		assert: aStream
		position: 6
		line: 4
		column: 2.
	self
		assert: aStream
		position: 7
		line: 4
		column: 3.
	
	self should: [ aStream line: 8 ] raise: Error.
	self should: [ aStream column: 8 ] raise: Error.	
]

{ #category : #'as yet unclassified' }
PPIndentStreamTest >> testEmptyStream [
	aStream := PPStream on:
'

'.
	self
		assert: aStream
		position: -1
		line: 0
		column: 0.
	self
		assert: aStream
		position: 0
		line: 1
		column: 1.
	self
		assert: aStream
		position: 1
		line: 2
		column: 1.
	self
		assert: aStream
		position: 2
		line: 3
		column: 1.
]
