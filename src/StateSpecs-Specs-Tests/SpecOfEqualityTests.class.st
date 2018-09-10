Class {
	#name : #SpecOfEqualityTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfEqualityTests >> testCreationFromObject [
	| subject result |
	subject := Object new.
	result := subject asStateSpec.
	self assert: result class = SpecOfEquality.
	self assert: result requiredValue == subject
]

{ #category : #tests }
SpecOfEqualityTests >> testMatches [

	| spec |
	spec := SpecOfEquality requiredValue: 'some object'.

	self assert: (spec matches: 'some' ,' object' ).
	self deny: (spec matches: 'some different object')
]

{ #category : #tests }
SpecOfEqualityTests >> testMatchesByteArray [

	| spec |
	spec := SpecOfEquality requiredValue: #[1 2 3].

	self assert: (spec matches: #[1 2 3] copy).
	self deny: (spec matches: #[3 2 1])
]

{ #category : #tests }
SpecOfEqualityTests >> testMatchesToEqualCollectionWithAnotherOrder [

	| spec |
	spec := SpecOfEquality requiredValue: #(1 2 3).

	self assert: (spec matches: #(2 1 3 ))
]

{ #category : #tests }
SpecOfEqualityTests >> testMatchesWithDenial [

	| spec |
	spec := (SpecOfEquality requiredValue: 'some object') not.

	self deny: (spec matches: 'some object' ).
	self assert: (spec matches: 'some different object')
]

{ #category : #tests }
SpecOfEqualityTests >> testValidateFailed [
	| requiredValue subject spec result |

	requiredValue := 'Object'.
	subject := 'Other object'.
	spec := SpecOfEquality requiredValue: requiredValue.
	result := spec validate: subject.
	self assert: result isFailure.
	self assert: result subject == subject.
	self assert: result spec == spec.
]

{ #category : #tests }
SpecOfEqualityTests >> testValidateFailedIfDenialSpec [
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := requiredValue.
	
	spec := SpecOfEquality requiredValue: requiredValue.
	spec denial: true.
	result := spec validate: subject.
	self assert: result isFailure.
	self assert: result subject == subject.
	self assert: result spec == spec
]

{ #category : #tests }
SpecOfEqualityTests >> testValidateSuccessful [
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := requiredValue.
	
	spec := SpecOfEquality requiredValue: requiredValue.
	result := spec validate: subject.
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfEqualityTests >> testValidateSuccessfulIfDenialSpec [
	| requiredValue subject spec result |
	requiredValue := 'Object'.
	subject := 'Other object'.
	spec := SpecOfEquality requiredValue: requiredValue.
	spec denial: true.
	result := spec validate: subject.
	self assert: result isSuccess
]
