Class {
	#name : #SpecOfObjectStateByPredicateTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfObjectStateByPredicateTests >> testCreationFromBlock [
	| subject result |
	subject := [:arg | true].
	result := subject asStateSpec.
	self assert: result class = SpecOfObjectStateByPredicate.
	self assert: result predicate == subject
]

{ #category : #tests }
SpecOfObjectStateByPredicateTests >> testMatches [
	| spec |
	spec := SpecOfObjectStateByPredicate from: [:arg | arg > 0].
	self assert: (spec matches: 10).
	self deny: (spec matches: -10)
]
