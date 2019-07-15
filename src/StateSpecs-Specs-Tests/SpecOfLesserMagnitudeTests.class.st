Class {
	#name : #SpecOfLesserMagnitudeTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #testing }
SpecOfLesserMagnitudeTests >> testMatchesWithStrongOption [
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfLesserMagnitude than: requiredValue strong: true.
	self deny: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue + 1).
	self assert: (spec matches: requiredValue - 1)
]

{ #category : #testing }
SpecOfLesserMagnitudeTests >> testMatchesWithoutStrongOption [
	| requiredValue spec |
	requiredValue := 10.
	spec := SpecOfLesserMagnitude than: requiredValue strong: false.
	self assert: (spec matches: requiredValue).
	self deny: (spec matches: requiredValue + 1).
	self assert: (spec matches: requiredValue - 1)
]

{ #category : #testing }
SpecOfLesserMagnitudeTests >> testNotStrongByDefault [

	| spec |
	spec := SpecOfLesserMagnitude new.

	self deny: spec isStrong
]
