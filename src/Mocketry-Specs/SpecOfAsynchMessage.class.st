"
I am specification of asynchronous message send which means that I describe that message send should be occurred in not originalProcess.

Internal Representation and Key Implementation Points.

    Instance Variables
	originalProcess:		<Process>
"
Class {
	#name : #SpecOfAsynchMessage,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'originalProcess'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfAsynchMessage class >> forActiveProcess [
	^self new 
		originalProcess: Processor activeProcess
]

{ #category : #testing }
SpecOfAsynchMessage >> basicMatches: anOccurredMessage [
	
	^anOccurredMessage process ~= originalProcess
]

{ #category : #accessing }
SpecOfAsynchMessage >> originalProcess [
	^ originalProcess
]

{ #category : #accessing }
SpecOfAsynchMessage >> originalProcess: anObject [
	originalProcess := anObject
]

{ #category : #validation }
SpecOfAsynchMessage >> validationFailureFor: anOccuredMessage [

	^SpecOfWrongMessageProcess spec: self for: anOccuredMessage 
]
