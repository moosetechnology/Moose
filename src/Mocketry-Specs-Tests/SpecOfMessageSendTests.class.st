Class {
	#name : #SpecOfMessageSendTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageSendTests >> testCreationFromMessageSend [

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #selector arguments: #(arg1 arg2)).
	
	spec where specs should haveSize: 4.
	spec where specs first should beInstanceOf: SpecOfMessageReceiver.
	spec where specs first requiredValue requiredValue should be: #receiver.
	
	spec where specs second should beInstanceOf: SpecOfMessageSelector.
	spec where specs second requiredValue requiredValue should be: #selector.
	
	spec where specs third should beInstanceOf: SpecOfMessageArgument.
	spec where specs third argumentNumber should be: 1.
	spec where specs third requiredValue requiredValue should be: #arg1.
	
	spec where specs fourth should beInstanceOf: SpecOfMessageArgument.
	spec where specs fourth argumentNumber should be: 2.
	spec where specs fourth requiredValue requiredValue should be: #arg2.
]

{ #category : #tests }
SpecOfMessageSendTests >> testDescription [

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg'
]

{ #category : #tests }
SpecOfMessageSendTests >> testDescriptionWhenAnySelector [

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: 10 selector: Any).
	
	spec where description should equal: '10 should receive Any'
]

{ #category : #tests }
SpecOfMessageSendTests >> testDescriptionWhenDenialApplied [

	| spec |
	spec := (SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #someMessageWith: argument: #someArg)) not.
	
	spec where description should equal: '#receiver should not receive someMessageWith: #someArg'
]

{ #category : #tests }
SpecOfMessageSendTests >> testDescriptionWhenReceiverIsExplicitSpec [

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: (Kind of: Number) selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '(be a kind of Number) should receive someMessageWith: #someArg'
]
