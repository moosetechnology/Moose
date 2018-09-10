"
I represent signalled exception during message send.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	exception:		<Exception>
"
Class {
	#name : #MockOccurredExceptionSignal,
	#superclass : #MockOccurredMessageResult,
	#instVars : [
		'exception'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredExceptionSignal class >> exception: anException [
	^self new 
		exception: anException
]

{ #category : #accessing }
MockOccurredExceptionSignal >> exception [
	^ exception
]

{ #category : #accessing }
MockOccurredExceptionSignal >> exception: anObject [
	exception := anObject
]

{ #category : #testing }
MockOccurredExceptionSignal >> isReturnOf: anObjectOrSpec [

	^false
]

{ #category : #testing }
MockOccurredExceptionSignal >> isSignalOf: anExceptionOrSpec [

	^anExceptionOrSpec asStateSpec matches: exception
]

{ #category : #printing }
MockOccurredExceptionSignal >> printOn: aStream [
	
	aStream << 'raised '; print: exception
]

{ #category : #printing }
MockOccurredExceptionSignal >> stringForSpecValidation [
	
	^'raised ', exception stringForSpecValidation 
]
