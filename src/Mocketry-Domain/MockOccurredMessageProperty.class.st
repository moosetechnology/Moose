"
My subclasses represent concrete property of message send as a root parent of SpecOfObjectProperty.
Subclasses should implement single method #extractValueFromMessage to initialize a value of property.
 
Instances can be created by 
	
	SpecOfOccurredMessageProcessProperty of: aMockOccurredMessage

Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>
"
Class {
	#name : #MockOccurredMessageProperty,
	#superclass : #SpecOfObjectItselfProperty,
	#instVars : [
		'message'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredMessageProperty class >> of: aMessage [
	^self new 
		message: aMessage
]

{ #category : #initialization }
MockOccurredMessageProperty >> extractValueFromMessage [
	self subclassResponsibility 
]

{ #category : #accessing }
MockOccurredMessageProperty >> message [
	^ message
]

{ #category : #accessing }
MockOccurredMessageProperty >> message: anOccurredMessage [
	message := anOccurredMessage.
	self extractValueFromMessage
]
