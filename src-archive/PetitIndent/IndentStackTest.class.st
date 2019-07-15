Class {
	#name : #IndentStackTest,
	#superclass : #TestCase,
	#instVars : [
		'stack',
		'result',
		'context'
	],
	#category : #'PetitIndent-Tests'
}

{ #category : #'as yet unclassified' }
IndentStackTest >> testCompare [
	| anotherStack parser |
	context := PPContext new.
	stack := context indentStack.

	context := PPContext new.
	anotherStack := context indentStack.
	
	self assert: stack ~~ anotherStack.
	self assert: stack = anotherStack.
	
	parser := 'a' asParser.
	stack push: parser.
	self assert: stack ~= anotherStack.
	
	anotherStack push: parser.
	self assert: stack = anotherStack.

]

{ #category : #'as yet unclassified' }
IndentStackTest >> testCompare2 [
	| anotherStack  |
	context := PPContext new.
	context stream: 'aaa' asPetitStream.
	stack := context indentStack.
	
	stack push: 'a' asParser.

	anotherStack := context remember indentStack.
	
	self assert: stack ~~ anotherStack.
	self assert: stack = anotherStack.
]

{ #category : #'as yet unclassified' }
IndentStackTest >> testMemo [
	| memento |
	context := PPContext new.
	context stream: 'aaa' asPetitStream.
	
	stack := context indentStack.
	stack push: 'a' asParser.
	stack push: 'b' asParser.
	self assert: stack size = 2.
	
	memento := context remember.
	
	stack pop.
	stack pop.
	self assert: stack size = 0.
	
	context restore: memento.
	stack := context indentStack.
	
	self assert: stack size = 2.
	
	

]

{ #category : #'as yet unclassified' }
IndentStackTest >> testPop [
	| parser |
	stack := IndentStack new.
	parser := 'foo' asParser.
	
	stack push: parser.
	
	self assert: stack pop = parser.
	self assert: stack size = 0.
	
	self assert: stack pop isPetitFailure.
	self assert: stack size = 0.
]

{ #category : #'as yet unclassified' }
IndentStackTest >> testPush [
	| parser |
	stack := IndentStack new.
	parser := 'foo' asParser.
	
	stack push: parser.
	self assert: stack size = 1.
	
	self assert: stack top = parser.
]

{ #category : #'as yet unclassified' }
IndentStackTest >> testReplay [
	stack := IndentStack new.
	stack push: 'a' asParser.
	stack push: 'b' asParser.
	
	context := PPContext new.
	context stream: 'ab' asPetitStream.
	
	result := stack replay: context.
	
	
	self assert: result = {'a' . 'b'} asOrderedCollection.
	self assert: context atEnd.
	
	stack := IndentStack new.
	context := PPContext new.
	context stream: 'ab' asPetitStream.
	
	result := stack replay: context.
	self assert: result = #() asOrderedCollection.
	self assert: context position = 0.
	


	stack := IndentStack new.
	stack push: 'a' asParser.
	stack push: 'b' asParser.
	
	context := PPContext new.
	context stream: 'ac' asPetitStream.
	
	result := stack replay: context.
	
	self assert: result isPetitFailure.
	self assert: context position = 0.
]
