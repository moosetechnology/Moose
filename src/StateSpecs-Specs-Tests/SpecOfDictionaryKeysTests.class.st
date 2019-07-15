Class {
	#name : #SpecOfDictionaryKeysTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfDictionaryKeysTests >> testMatches [
	| spec subject1 subject2 |
	subject1 := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4;
				yourself.
	subject2 := (Dictionary new)
				add: 10 -> 1;
				add: 3 -> 4;
				yourself.
	spec := SpecOfDictionaryKeys requiredKey: 1.
	self assert: (spec matches: subject1).
	self deny: (spec matches: subject2)
]
