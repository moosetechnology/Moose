"
I am special helper mock role which intercepts all messages to produce expectations for my object.

I am used during stub teaching: 
	mock stub someMessage willReturn: 3
"
Class {
	#name : #MockStubTeacher,
	#superclass : #MockHelperRole,
	#category : 'Mocketry-Domain'
}

{ #category : #processing }
MockStubTeacher >> anyMessage [

	"This method for documenting purpose. Look at processing method. You will see that this particular selector is substituted by Any. It make possible to build expectation for any message of receiver object (or any object):
		mock stub anyMessage willReturn: 2.
		Any stub anyMessage willReturn: 10 "
]

{ #category : #processing }
MockStubTeacher >> processTransformedMessageSend: anOccurredMessage by: aMockBehaviour [
	
	| expectation |
	expectation := MockExpectedMessage from: anOccurredMessage.

	aMockBehaviour addExpectation: expectation.
	
	^expectation
]
