"
I represent a process property where message was sent. I am a root parent of SpecOfObjectProperty.

My instances can be created by 
	
	SpecOfOccurredMessageProcessProperty of: aMockOccurredMessage

Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>
"
Class {
	#name : #MockOccurredMessageProcessProperty,
	#superclass : #MockOccurredMessageProperty,
	#category : 'Mocketry-Domain'
}

{ #category : #initialization }
MockOccurredMessageProcessProperty >> extractValueFromMessage [
	value := message process
]

{ #category : #printing }
MockOccurredMessageProcessProperty >> stringForSpecTitle [ 
	^'process of ', message printWithoutResult
]
