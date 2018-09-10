"
I represent expected exception which should be signalled when corresponding message send wil be intercepted.

My instances can be created by 
	MockExpectedException exception: Error
or with exception isntance:
	MockExpectedException exception: anError
 
Internal Representation and Key Implementation Points.

    Instance Variables
	exception:		<Exception>
"
Class {
	#name : #MockExpectedException,
	#superclass : #MockExpectedAction,
	#instVars : [
		'exception'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedException class >> exception: anExceptionClass [ 
	^self new exception: anExceptionClass
]

{ #category : #accessing }
MockExpectedException >> exception [
	^ exception
]

{ #category : #accessing }
MockExpectedException >> exception: anObject [
	exception := anObject
]

{ #category : #evaluating }
MockExpectedException >> executeFor: anOccurredMessage [ 
	exception signal
]
