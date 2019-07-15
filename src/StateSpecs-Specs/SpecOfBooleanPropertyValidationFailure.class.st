"
I represent object validation failure for boolean property.
I provide suitable description for incorrect property
"
Class {
	#name : #SpecOfBooleanPropertyValidationFailure,
	#superclass : #SpecOfValidationFailure,
	#category : 'StateSpecs-Specs'
}

{ #category : #printing }
SpecOfBooleanPropertyValidationFailure >> description [
	subjectOwner ifNil: [ ^subject stringForSpecValidation , ' ' , spec description].
	
	^super description
	
]
