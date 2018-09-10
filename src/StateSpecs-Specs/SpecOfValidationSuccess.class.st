"
I represent successful spec validation.

My superclass define singleton for me 

	SpecOfValidationResult success
"
Class {
	#name : #SpecOfValidationSuccess,
	#superclass : #SpecOfValidationResult,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfValidationSuccess >> isFailure [
	^false
]

{ #category : #accessing }
SpecOfValidationSuccess >> raise [
]
