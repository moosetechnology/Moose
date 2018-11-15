Class {
	#name : #PPContextTest,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #'PetitTests-Tests'
}

{ #category : #'as yet unclassified' }
PPContextTest >> context [
	^ PPContext new
]

{ #category : #'as yet unclassified' }
PPContextTest >> setUp [
	super setUp.
	context := self context.
]

{ #category : #tests }
PPContextTest >> testFurthestFailure [
	| f1 f2 |
	
	f1 := PPFailure message: #foo context: context at: 1.
	self assert: context furthestFailure = f1.	
	f2 := PPFailure message: #foo context: context at: 1.
	self assert: context furthestFailure = f1.	
	f2 := PPFailure message: #foo context: context at: 3.
	self assert: context furthestFailure = f2.
]

{ #category : #tests }
PPContextTest >> testMemoization [
	| stream memento memento2 collection |
	stream := 'abc' asPetitStream.
	context := context stream: stream.
	collection := OrderedCollection new.

	context propertyAt: #foo put: collection.
	
	memento := context remember.
	
	self assert: memento isNil not.
	
	context next.
	collection add: #element.
	self assert: (context propertyAt: #foo) size = 1. 	

	memento2 := context remember.

	context restore: memento.
	self assert: (context propertyAt: #foo) size = 0. 
	self assert: context position = 0.
	
	context restore: memento2.
	self assert: (context propertyAt: #foo) size = 1. 
	self assert: context position = 1.

]

{ #category : #tests }
PPContextTest >> testMemoization2 [
	| stream memento |
	stream := 'abc' asPetitStream.
	context := context stream: stream.
	
	memento := context remember.
	
	context next.
	self assert: context position = 1.
	
	context restore: memento.
	self assert: context position = 0.

]

{ #category : #tests }
PPContextTest >> testMemoization3 [
	| stream memento memento2 collection |
	stream := 'abc' asPetitStream.
	context := context stream: stream.
	collection := OrderedCollection new.

	memento := context remember.
	context propertyAt: #foo put: collection.
	memento2 := context remember.
	
	context restore: memento.
	self assert: (context hasProperty: #foo) not.
	
	context restore: memento2.
	self assert: (context hasProperty: #foo).
]

{ #category : #tests }
PPContextTest >> testPutGlobals [
	self assert: (context hasGlobal: #foo) not.
	self assert: (context hasGlobal: #bar) not.	
	
	self should: [ context globalAt: #foo ] raise: Error.
	self assert: (context globalAt: #foo ifAbsent: [ #bar ]) = #bar.
	
	self assert: (context globalAt: #foo ifAbsentPut: [ #bar ]) = #bar.	
	self assert: (context hasGlobal: #foo).
	self assert: (context hasGlobal: #bar) not.	
	self assert: (context globalAt: #foo) = #bar.
	
	self assert: (context globalAt: #foo ifAbsentPut: [ #zorg ]) = #bar.	
	self assert: (context hasGlobal: #foo).
	self assert: (context hasGlobal: #bar) not.	
	self assert: (context globalAt: #foo) = #bar.
	
	self assert: (context globalAt: #foo put: #zorg) = #zorg.	
	self assert: (context hasGlobal: #foo).
	self assert: (context hasGlobal: #bar) not.	
	self assert: (context globalAt: #foo) = #zorg.
	
	self should: [ context globalAt: #bar ] raise: Error.
	self assert: (context globalAt: #bar put: #foo) = #foo.
	self assert: (context globalAt: #foo) = #zorg.
	self assert: (context globalAt: #bar) = #foo.


]

{ #category : #tests }
PPContextTest >> testPutProperties [
	self assert: (context hasProperty: #foo) not.
	self assert: (context hasProperty: #bar) not.	
	
	self should: [ context propertyAt: #foo ] raise: Error.
	self assert: (context propertyAt: #foo ifAbsent: [ #bar ]) = #bar.
	
	self assert: (context propertyAt: #foo ifAbsentPut: [ #bar ]) = #bar.	
	self assert: (context hasProperty: #foo).
	self assert: (context hasProperty: #bar) not.	
	self assert: (context propertyAt: #foo) = #bar.
	
	self assert: (context propertyAt: #foo ifAbsentPut: [ #zorg ]) = #bar.	
	self assert: (context hasProperty: #foo).
	self assert: (context hasProperty: #bar) not.	
	self assert: (context propertyAt: #foo) = #bar.
	
	self assert: (context propertyAt: #foo put: #zorg) = #zorg.	
	self assert: (context hasProperty: #foo).
	self assert: (context hasProperty: #bar) not.	
	self assert: (context propertyAt: #foo) = #zorg.
	
	self should: [ context propertyAt: #bar ] raise: Error.
	self assert: (context propertyAt: #bar put: #foo) = #foo.
	self assert: (context propertyAt: #foo) = #zorg.
	self assert: (context propertyAt: #bar) = #foo.


]

{ #category : #tests }
PPContextTest >> testRemoveGlobals [
	context globalAt: #foo put: #zorg.
	context globalAt: #bar put: #qwark.	

	self assert: (context removeGlobal: #foo) = #zorg.
	self assert: (context removeGlobal: #bar) = #qwark.
	
	self should: [context removeGlobal: #foo] raise: Error.
	self assert: (context removeGlobal: #bar ifAbsent: [ #foobar ]) = #foobar.

]

{ #category : #tests }
PPContextTest >> testRemoveProperties [
	context propertyAt: #foo put: #zorg.
	context propertyAt: #bar put: #qwark.	

	self assert: (context removeProperty: #foo) = #zorg.
	self assert: (context removeProperty: #bar) = #qwark.
	
	self should: [context removeProperty: #foo] raise: Error.
	self assert: (context removeProperty: #bar ifAbsent: [ #foobar ]) = #foobar.

]

{ #category : #tests }
PPContextTest >> testStreamProtocol [
	context stream: 'hi there' asPetitStream.
	
	self assert: context position = 0.
	self assert: context peek = $h.
	self assert: context uncheckedPeek = $h.

	self assert: context next = $h.
	self assert: context peek = $i.
	self assert: context uncheckedPeek = $i.
	self assert: context position = 1.
	
	context skip: 2.
	self assert: context position = 3.
	self assert: context peek = $t.
	self assert: context atEnd not.
	
	self assert: (context next: 5) = 'there'.
	self assert: context position = 8.
	self assert: context atEnd.
]
