Class {
	#name : #SpecOfOrDisjunctionTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfOrDisjunctionTests >> testCreationByBinaryMessage [
	| spec1 spec2 compositeSpec |
	spec1 := SpecOfObjectState new.
	spec2 := SpecOfObjectState new.
	compositeSpec := spec1 | spec2.
	self assert: compositeSpec class = SpecOfOrDisjunction.
	self assert: compositeSpec specs first == spec1.
	self assert: compositeSpec specs last == spec2
]

{ #category : #tests }
SpecOfOrDisjunctionTests >> testMatches [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfOrDisjunction of: spec1 and: spec2.
	result := stateSpec validate: 5.
	
	self deny: (stateSpec matches: 3).
	self assert: (stateSpec matches: 2).
	self assert: (stateSpec matches: 'someValue')
]

{ #category : #tests }
SpecOfOrDisjunctionTests >> testValidateFailed [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfOrDisjunction of: spec1 and: spec2.
	result := stateSpec validate: 5.
	
	self assert: result isFailure.
	self assert: result spec == stateSpec
]

{ #category : #tests }
SpecOfOrDisjunctionTests >> testValidateSuccessful [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfOrDisjunction of: spec1 and: spec2.
	result := stateSpec validate: 2.
	
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfOrDisjunctionTests >> testValidateSuccessful2 [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfOrDisjunction of: spec1 and: spec2.
	result := stateSpec validate: 'someString'.
	
	self assert: result isSuccess
]
