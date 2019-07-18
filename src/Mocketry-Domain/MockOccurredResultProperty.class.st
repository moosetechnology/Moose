"
I represent message send result as root parent of SpecOfObjectProperty.

My instances can be created by 
	
	SpecOfOccurredResultProperty of: aMockOccurredMessage

Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>
"
Class {
	#name : #MockOccurredResultProperty,
	#superclass : #MockOccurredMessageProperty,
	#category : 'Mocketry-Domain'
}

{ #category : #initialization }
MockOccurredResultProperty >> extractValueFromMessage [
	value := message returnedValue
]

{ #category : #printing }
MockOccurredResultProperty >> stringForSpecTitle [ 
	^message printWithoutResult
]
