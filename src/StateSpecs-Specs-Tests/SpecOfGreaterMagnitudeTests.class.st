Class {
	#name : #SpecOfGreaterMagnitudeTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #testing }
SpecOfGreaterMagnitudeTests >> testMatchesWithStrongOption [
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfGreaterMagnitude than: requiredValue strong: true.
	self deny: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue - 1).
	self assert: (spec matches: requiredValue + 1)
]

{ #category : #testing }
SpecOfGreaterMagnitudeTests >> testMatchesWithoutStrongOption [
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfGreaterMagnitude than: requiredValue strong: false.
	self assert: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue - 1).
	self assert: (spec matches: requiredValue + 1)
]

{ #category : #testing }
SpecOfGreaterMagnitudeTests >> testNotStrongByDefault [

	| spec |
	spec := SpecOfGreaterMagnitude new.

	self deny: spec isStrong
]
