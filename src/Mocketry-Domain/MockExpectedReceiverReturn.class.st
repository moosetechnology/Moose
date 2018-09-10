"
I represent expected message result which will return receiver of intercepted message
"
Class {
	#name : #MockExpectedReceiverReturn,
	#superclass : #MockExpectedAction,
	#category : 'Mocketry-Domain'
}

{ #category : #evaluating }
MockExpectedReceiverReturn >> executeFor: anOccurredMessage [ 
	^anOccurredMessage receiver
]
