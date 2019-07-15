Class {
	#name : #SpecOfAndConjunctionTests,
	#superclass : #TestCase,
	#instVars : [
		'actual'
	],
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfAndConjunctionTests >> testCreationByBinaryMessage [
	| spec1 spec2 compositeSpec |
	spec1 := SpecOfObjectState new.
	spec2 := SpecOfObjectState new.
	compositeSpec := spec1 & spec2.
	self assert: compositeSpec class = SpecOfAndConjunction.
	self assert: compositeSpec specs first == spec1.
	self assert: compositeSpec specs last == spec2
]

{ #category : #tests }
SpecOfAndConjunctionTests >> testMatches [
	| spec1 spec2 stateSpec |
	spec1 := SpecOfEquality requiredValue: #expectedValue.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	
	self deny: (stateSpec matches: #wrongValue).
	self assert: (stateSpec matches: #expectedValue)

]

{ #category : #tests }
SpecOfAndConjunctionTests >> testValidateFailed [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: #expectedValue.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	result := stateSpec validate: #wrongValue.
	
	self assert: result isFailure.
	self assert: result spec == spec1

]

{ #category : #tests }
SpecOfAndConjunctionTests >> testValidateFailed2 [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: 2.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	result := stateSpec validate: 2.
	
	self assert: result isFailure.
	self assert: result spec == spec2

]

{ #category : #tests }
SpecOfAndConjunctionTests >> testValidateSuccessful [
	| spec1 spec2 stateSpec result |
	spec1 := SpecOfEquality requiredValue: #expectedValue.
	spec2 := SpecOfObjectSuperclass requiredClass: String.
	
	stateSpec := SpecOfAndConjunction of: spec1 and: spec2.
	result := stateSpec validate: #expectedValue.
	
	self assert: result isSuccess

]
