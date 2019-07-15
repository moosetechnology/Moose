Class {
	#name : #XPathNodeTestWithPredicatesTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #asserting }
XPathNodeTestWithPredicatesTest >> assertNodeTestWithPredicates: aNodeTestWithPredicates hasPredicates: aPredicateOrPredicateCollection [
	self assert:
		aNodeTestWithPredicates predicates asArray =
			(aPredicateOrPredicateCollection isCollection
				ifTrue: [aPredicateOrPredicateCollection asArray]
				ifFalse: [Array with: aPredicateOrPredicateCollection])
]

{ #category : #accessing }
XPathNodeTestWithPredicatesTest >> classTested [
	^ XPathNodeTestWithPredicates
]

{ #category : #'instance creation' }
XPathNodeTestWithPredicatesTest >> newNodeTestWithPredicates [
	^ self newNodeTestWithPredicates: self predicates
]

{ #category : #'instance creation' }
XPathNodeTestWithPredicatesTest >> newNodeTestWithPredicates: aPredicateOrPredicateCollection [
	^ self classTested
		nodeTest: self nodeTest
		predicates: aPredicateOrPredicateCollection
]

{ #category : #'instance creation' }
XPathNodeTestWithPredicatesTest >> newNodeTestWithSinglePredicate [
	^ self newNodeTestWithPredicates: self singlePredicate
]

{ #category : #accessing }
XPathNodeTestWithPredicatesTest >> nodeTest [
	^ 'test'
]

{ #category : #accessing }
XPathNodeTestWithPredicatesTest >> predicates [
	"using block predicates here would make 'self predicates ~= self predicates'
	because '[1] ~= [1]'"
	^ Array
		with: 1
		with: 2
		with: 3
		with: 4
]

{ #category : #accessing }
XPathNodeTestWithPredicatesTest >> singlePredicate [
	^ self predicates first
]

{ #category : #tests }
XPathNodeTestWithPredicatesTest >> testChainingPredicate [
	| newNodeTestWithPredicates |

	newNodeTestWithPredicates := self newNodeTestWithSinglePredicate.
	self
		assert: newNodeTestWithPredicates class == self classTested;
		assert: newNodeTestWithPredicates nodeTest = self nodeTest.
	self
		assertNodeTestWithPredicates: newNodeTestWithPredicates
		hasPredicates: self singlePredicate.

	2 to: self predicates size do: [:i | | oldNodeTestWithPredicates |
		oldNodeTestWithPredicates := newNodeTestWithPredicates.
		newNodeTestWithPredicates :=
			oldNodeTestWithPredicates ?? (self predicates at: i).
		self
			assert: newNodeTestWithPredicates class == self classTested;
			assert: newNodeTestWithPredicates nodeTest = self nodeTest.
		self
			assertNodeTestWithPredicates: newNodeTestWithPredicates
			hasPredicates: (self predicates copyFrom: 1 to: i).

		self
			deny: oldNodeTestWithPredicates == newNodeTestWithPredicates;
			assert: oldNodeTestWithPredicates nodeTest = self nodeTest.
		self
			assertNodeTestWithPredicates: oldNodeTestWithPredicates
			hasPredicates: (self predicates copyFrom: 1 to: i - 1)].
]

{ #category : #tests }
XPathNodeTestWithPredicatesTest >> testChainingPredicates [
	| newNodeTestWithPredicates oldNodeTestWithPredicates |

	newNodeTestWithPredicates := self newNodeTestWithPredicates.
	self
		assert: newNodeTestWithPredicates class == self classTested;
		assert: newNodeTestWithPredicates nodeTest = self nodeTest.
	self
		assertNodeTestWithPredicates: newNodeTestWithPredicates
		hasPredicates: self predicates.

	oldNodeTestWithPredicates := newNodeTestWithPredicates.
	newNodeTestWithPredicates :=
		oldNodeTestWithPredicates ?? self predicates.
	self
		assert: newNodeTestWithPredicates class == self classTested;
		assert: newNodeTestWithPredicates nodeTest = self nodeTest.
	self
		assertNodeTestWithPredicates: newNodeTestWithPredicates
		hasPredicates: self predicates, self predicates.

	self
		deny: oldNodeTestWithPredicates == newNodeTestWithPredicates;
		assert: oldNodeTestWithPredicates nodeTest = self nodeTest.
	self
		assertNodeTestWithPredicates: oldNodeTestWithPredicates
		hasPredicates: self predicates.
]
