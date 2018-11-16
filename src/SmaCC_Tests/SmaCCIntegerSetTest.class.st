Class {
	#name : #SmaCCIntegerSetTest,
	#superclass : #SmaCCBitCollectionTest,
	#category : #'SmaCC_Tests'
}

{ #category : #tests }
SmaCCIntegerSetTest >> testMergeBug [
	| a b |
	a := SmaCCIntegerSet with: 1.
	b := SmaCCIntegerSet with: 12000.
	a addAll: b.
	b
		add: 12001;
		add: 11999.
	self assert: a size = 2
]

{ #category : #tests }
SmaCCIntegerSetTest >> testNegative [
	| collection |
	collection := self newCollection.
	collection add: 1.
	collection add: -1.
	collection add: -100000.
	self assert: collection size = 3.
	self assert: (collection includes: 1).
	self assert: (collection includes: -1).
	self assert: (collection includes: -100000).
	self deny: (collection includes: 0)
]
