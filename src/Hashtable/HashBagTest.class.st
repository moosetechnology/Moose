Class {
	#name : #HashBagTest,
	#superclass : #TestCase,
	#instVars : [
		'bag'
	],
	#category : #'Hashtable-Test'
}

{ #category : #running }
HashBagTest >> setUp [
	super setUp.
	bag := HashBag new.
]

{ #category : #testing }
HashBagTest >> testAdd [
	bag add: 1.
	bag add: 1.
	
	self assert: ((bag occurrencesOf: 1) = 2)
]

{ #category : #testing }
HashBagTest >> testAddWithOccurrances [
	bag add: 1 withOccurrences: 2.
	
	self assert: ((bag occurrencesOf: 1) = 2)
]

{ #category : #testing }
HashBagTest >> testCopy [
	| copy |
	bag add: 1.
	copy := bag copy.
	
	self assert: ((bag occurrencesOf: 1) = 1).
	self assert: ((copy occurrencesOf: 1) = 1).
	
	copy remove: 1.
	
	self assert: ((bag occurrencesOf: 1) = 1).
	self assert: ((copy occurrencesOf: 1) = 0).
]

{ #category : #testing }
HashBagTest >> testRemove [
	bag add: 1 withOccurrences: 2.
	bag remove: 1.
	
	self assert: ((bag occurrencesOf: 1) = 1).
	
	bag remove: 1.
	self assert: ((bag occurrencesOf: 1) = 0).
	
	self should: [ bag remove: 1 ] raise: Error.
	self assert: ((bag occurrencesOf: 1) = 0).
]
