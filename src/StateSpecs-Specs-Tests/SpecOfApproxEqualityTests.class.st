Class {
	#name : #SpecOfApproxEqualityTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfApproxEqualityTests >> testMatches [
	| spec |
	spec := SpecOfApproxEquality to: 10 within: 2.
	self assert: (spec matches: 11).
	self deny: (spec matches: 12)
]

{ #category : #tests }
SpecOfApproxEqualityTests >> testNumberIsEqualWithin [
	self assert: (11 isEqual: 10 within: 2).
	self deny: (12 isEqual: 10 within: 2)
]

{ #category : #tests }
SpecOfApproxEqualityTests >> testPointIsEqualWithin [
	self assert: (0.7 @ 0.7 isEqual: 0 @ 0 within: 1).
	self deny: (0.8 @ 0.8 isEqual: 0 @ 0 within: 1)
]

{ #category : #tests }
SpecOfApproxEqualityTests >> testValidationFailure [
	| spec result |
	spec := SpecOfApproxEquality to: 10 within: 2.
	
	result := spec validate: 12.
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "12" but it should be within 2 of 10'

]
