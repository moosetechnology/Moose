Class {
	#name : #SpecOfComplexStateTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfComplexStateTests >> testCreation [
	
	| spec1 complexSpec |
	spec1 := SpecOfEquality requiredValue: 1.
	
	complexSpec := SpecOfComplexState of: spec1 and: 3.

	self assert: complexSpec specs first equals: spec1.
	self assert: complexSpec specs last class equals: SpecOfEquality.
	self assert: complexSpec specs last requiredValue equals: 3
]
