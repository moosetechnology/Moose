"
I am root of hierarchy of spec validation results.

My subclasses should implement method #raise to signal failures.
I define successful validation result as singleton.
	
	SpecOfValidationResult success  

Public API and Key Messages

- isSuccess   
- isFailure 
- raise
"
Class {
	#name : #SpecOfValidationResult,
	#superclass : #Object,
	#classVars : [
		'Success'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfValidationResult class >> failed: aSpecOfObjectState for: anObject [
	^SpecOfValidationFailure spec: aSpecOfObjectState for: anObject
]

{ #category : #defaults }
SpecOfValidationResult class >> success [
	^Success ifNil: [ Success := SpecOfValidationSuccess new ]
]

{ #category : #testing }
SpecOfValidationResult >> isFailure [
	self subclassResponsibility
]

{ #category : #testing }
SpecOfValidationResult >> isSuccess [
	^self isFailure not
]

{ #category : #accessing }
SpecOfValidationResult >> raise [
	self subclassResponsibility
]
