Class {
	#name : #IdentityHashBagTest,
	#superclass : #TestCase,
	#instVars : [
		'bag'
	],
	#category : #'Hashtable-Test'
}

{ #category : #running }
IdentityHashBagTest >> setUp [
	super setUp.
	bag := IdentityHashBag new.
]

{ #category : #testing }
IdentityHashBagTest >> testAdd [
	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.
	
	bag add: first.
	bag add: first.
	
	bag add: second.
	bag add: second.
	bag add: second.	
	
	self assert: ((bag occurrencesOf: first) = 2).
	self assert: ((bag occurrencesOf: second) = 3)
]

{ #category : #testing }
IdentityHashBagTest >> testAddWithOccurrances [
	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.

	bag add: first withOccurrences: 2.
	bag add: second withOccurrences: 3.
	
	self assert: ((bag occurrencesOf: first) = 2)
]

{ #category : #testing }
IdentityHashBagTest >> testRemove [
	| first second |
	first := String newFrom: 'key'.
	second := String newFrom: 'key'.
	
	bag add: first withOccurrences: 2.
	bag add: second withOccurrences: 3.
	bag remove: first.
	
	self assert: ((bag occurrencesOf: first) = 1).
	
	bag remove: first.
	self assert: ((bag occurrencesOf: first) = 0).
	
	self should: [ bag remove: first ] raise: Error.
	self assert: ((bag occurrencesOf: first) = 0).
	self assert: ((bag occurrencesOf: second) = 3).
]
