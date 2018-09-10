Class {
	#name : #SpecOfNegationTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfNegationTests >> testMatches [
	| spec1 spec2 stateSpec |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfNegation of: spec1 and: spec2.
	
	self deny: (stateSpec matches: 2).
	self deny: (stateSpec matches: 'someString').
	self assert: (stateSpec matches: 10)
]

{ #category : #tests }
SpecOfNegationTests >> testValidateFailed [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfNegation of: spec1 and: spec2.
	result := stateSpec validate: 2.
	
	self assert: result isFailure.
	self assert: result spec == spec1
]

{ #category : #tests }
SpecOfNegationTests >> testValidateFailed2 [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfNegation of: spec1 and: spec2.
	result := stateSpec validate: 'someString'.
	
	self assert: result isFailure.
	self assert: result spec == spec2
]

{ #category : #tests }
SpecOfNegationTests >> testValidateSuccessful [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfNegation of: spec1 and: spec2.
	result := stateSpec validate: 5.
	
	self assert: result isSuccess
]
