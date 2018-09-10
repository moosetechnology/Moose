"
I represent spec validation failure.

My instances can be created by 
	
	SpecOfValidationFailure spec: aSpecOfObjectState for: anObject 
or
	SpecOfValidationResult failed: aSpecOfObjectState for: anObject

I implement #description method to provide detailed information about validation failure.

In case of internal property validation of some object I need information about it to correctly describe that wrong property belongs to given owner. For this I use variable subjectOwner to build more clever description of validation failure

Public API and Key Messages

- description
- raise 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spec:		<SpecOfObjectState>
	subject:		<Object>
	subjectOwner:		<Object>


    Implementation Points
"
Class {
	#name : #SpecOfValidationFailure,
	#superclass : #SpecOfValidationResult,
	#instVars : [
		'spec',
		'subject',
		'subjectOwner'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfValidationFailure class >> spec: aStateSpec for: anObject [ 
	^self new
		subject: anObject;
		spec: aStateSpec
]

{ #category : #debugging }
SpecOfValidationFailure >> debugSpecOver: aSpecFailed [
	spec debugValidationFailingOver: aSpecFailed
]

{ #category : #printing }
SpecOfValidationFailure >> description [
	subjectOwner ifNil: [ 
		^'Got "', subject stringForSpecValidation , '" but it ' , spec description].
	
	^'Got "', subject stringForSpecValidation , '" from ', subjectOwner stringForSpecValidation, ' but it ' , spec description.
]

{ #category : #testing }
SpecOfValidationFailure >> isFailure [
	^true
]

{ #category : #printing }
SpecOfValidationFailure >> printOn: aStream [

	super printOn: aStream.
	aStream << $( << self description << $)
]

{ #category : #accessing }
SpecOfValidationFailure >> raise [
	| error |
	error := SpecOfFailed withReason: self.
	spec failureDescription ifNotNil: [ :desc | error messageText: desc].
	error signal
]

{ #category : #accessing }
SpecOfValidationFailure >> spec [
	^spec
]

{ #category : #accessing }
SpecOfValidationFailure >> spec: aStateSpec [ 
	spec := aStateSpec
]

{ #category : #accessing }
SpecOfValidationFailure >> subject [
	^subject
]

{ #category : #accessing }
SpecOfValidationFailure >> subject: anObject [ 
	subject := anObject
]

{ #category : #accessing }
SpecOfValidationFailure >> subjectOwner [
	^ subjectOwner
]

{ #category : #accessing }
SpecOfValidationFailure >> subjectOwner: anObject [
	subjectOwner := anObject
]
