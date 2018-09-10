"
I am exception to signal specification failure.

SpecOfValidationFailure signals me by #raise method.
	validationResult raise
	
Internal Representation and Key Implementation Points.

    Instance Variables
	reason:		<SpecOfValidationFailure>

"
Class {
	#name : #SpecOfFailed,
	#superclass : #Error,
	#instVars : [
		'reason'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfFailed class >> raiseWith: aValidationFailing [ 
	(self withReason: aValidationFailing) signal
]

{ #category : #'instance creation' }
SpecOfFailed class >> withReason: aValidationFailing [ 
	^self new reason: aValidationFailing
]

{ #category : #accessing }
SpecOfFailed >> allowExtraDebugging [

	messageText := self messageText, '. Proceed to debug it'
]

{ #category : #'private - actions' }
SpecOfFailed >> defaultAction [
	^reason debugSpecOver: self
]

{ #category : #testing }
SpecOfFailed >> isResumable [
	^true
]

{ #category : #displaying }
SpecOfFailed >> messageText [
	^messageText ifNil: [messageText := reason description]
]

{ #category : #accessing }
SpecOfFailed >> reason [
	^ reason
]

{ #category : #accessing }
SpecOfFailed >> reason: anObject [
	reason := anObject
]

{ #category : #'sunit support' }
SpecOfFailed >> sunitAnnounce: aTestCase toResult: aTestResult [
	aTestResult addFailure: aTestCase
]
