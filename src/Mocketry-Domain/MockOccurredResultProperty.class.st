"
I represent message send result as root parent of SpecOfObjectProperty.

My instances can be created by 
	
	SpecOfOccurredResultProperty message: aMockOccurredMessage

Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>
"
Class {
	#name : #MockOccurredResultProperty,
	#superclass : #SpecOfObjectItselfProperty,
	#instVars : [
		'message'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredResultProperty class >> message: anOccurredMessage [
	
	^(self of: anOccurredMessage returnedValue)
		message: anOccurredMessage 
]

{ #category : #accessing }
MockOccurredResultProperty >> message [
	^ message
]

{ #category : #accessing }
MockOccurredResultProperty >> message: anObject [
	message := anObject
]

{ #category : #printing }
MockOccurredResultProperty >> stringForSpecTitle [ 
	^message printWithoutResult 
]
