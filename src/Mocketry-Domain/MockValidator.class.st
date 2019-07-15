"
I am special helper mock role which intercepts all messages to validate occurred behaviour with my object. 
During intercepting I build SpecOfExpectedMessage which I use to validate occurred behaviour. I put my object as receiver in these spec.

I am used during single message validation: 
	mock should receive someMessage once
	
Internal Representation and Key Implementation Points.

    Instance Variables
	withNegation:		<Boolean>
"
Class {
	#name : #MockValidator,
	#superclass : #MockHelperRole,
	#instVars : [
		'withNegation'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockValidator class >> for: anObject withNegation: aBoolean [
	^(self for: anObject)
		withNegation: aBoolean
]

{ #category : #processing }
MockValidator >> anyMessage [

	"This method for documenting purpose. Look at processing method. You will see that this particular selector is substituted by Any. It make possible to validate that there was any message to particular object (or any object):
		mock should receive anyMessage.
		Any should receive anyMessage"
]

{ #category : #processing }
MockValidator >> processTransformedMessageSend: anOccurredMessage by: aMockBehaviour [

	| spec |	
	spec := SpecOfExpectedMessage from: anOccurredMessage.
	spec denial: withNegation.
	
	aMockBehaviour validateOccurredMessagesBy: spec.
	
	^MockDetailedMessagesValidation on: spec
]

{ #category : #accessing }
MockValidator >> withNegation [
	^ withNegation
]

{ #category : #accessing }
MockValidator >> withNegation: anObject [
	withNegation := anObject
]
