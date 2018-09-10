Class {
	#name : #PPMemoizingSeaTest,
	#superclass : #PPSeaTest,
	#category : #'PetitIslands-Tests'
}

{ #category : #'as yet unclassified' }
PPMemoizingSeaTest class >> shouldInheritSelectors [ 
	^ true.
]

{ #category : #'as yet unclassified' }
PPMemoizingSeaTest >> seaClass [
	^ PPMemoizingSea 
]

{ #category : #testing }
PPMemoizingSeaTest >> testMemo [
	| parser  result1 result2 input |
	
	parser := self sea: ('class' asParser, self identifier, 'endclass' asParser).
	input := 'class Foo endclass' asPetitStream.
	
	context := PPContext new.
	
	result1 :=  parser parse: input withContext: context.
	result2 := parser parse: input withContext: context.
	self assert: (result1 == result2 ).
]
