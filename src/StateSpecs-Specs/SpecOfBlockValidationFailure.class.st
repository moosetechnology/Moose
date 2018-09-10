"
I represent block validation failure for expected exception. 
I am implemented to support passing errors logic which described in SpecOfBlockFailure comment.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	errorValidationResult:		<SpecOfValidationFailure>
"
Class {
	#name : #SpecOfBlockValidationFailure,
	#superclass : #SpecOfValidationFailure,
	#instVars : [
		'errorValidationResult'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfBlockValidationFailure class >> noErrorIn: aBlock butShouldBe: aSpecOfBlockFailure [

	^self spec: aSpecOfBlockFailure for: aBlock

	

]

{ #category : #'instance creation' }
SpecOfBlockValidationFailure class >> unexpectedError: errorValidationResult in: aBlock butShouldBe: aSpecOfBlockFailure [

	^(self spec: aSpecOfBlockFailure for: aBlock)
		errorValidationResult: errorValidationResult
	

]

{ #category : #debugging }
SpecOfBlockValidationFailure >> debugSpecOver: aSpecFailed [

	errorValidationResult ifNil: [ ^super debugSpecOver: aSpecFailed ].
	
	aSpecFailed allowExtraDebugging.
	super debugSpecOver: aSpecFailed.
		
	spec passUnexpectedFailures.
	(spec validate: subject) raise
]

{ #category : #printing }
SpecOfBlockValidationFailure >> description [
	errorValidationResult ifNil: [ ^'Got no failures but ' , spec description ].
	
	^errorValidationResult description
]

{ #category : #accessing }
SpecOfBlockValidationFailure >> errorValidationResult [
	^ errorValidationResult
]

{ #category : #accessing }
SpecOfBlockValidationFailure >> errorValidationResult: anObject [
	errorValidationResult := anObject
]
