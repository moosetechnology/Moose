"
I am special operation on SpecOfExpectedMessage which is used to modify given spec by my DSL api and validate it immediatelly.

So for example after sending me message once I will change usage spec of expected message and immediatelly validate occurred message by it. 

I am used during received message validation: 
	mock should receive someMessage once
	 
Look at my superclass comment and methods
"
Class {
	#name : #MockDetailedMessagesValidation,
	#superclass : #MockOperationWithMessageSpec,
	#category : 'Mocketry-Domain'
}

{ #category : #execution }
MockDetailedMessagesValidation >> execute [
	
	^MockCurrentBehaviour validateOccurredMessagesBy: spec
]

{ #category : #'extra validation' }
MockDetailedMessagesValidation >> which [

	| result lastMessage |
	result := self execute.
	lastMessage := result occurredMessages last.
	
	^SpecOfObjectPropertyBuilder new 
		property: (MockOccurredResultProperty message: lastMessage)
]
