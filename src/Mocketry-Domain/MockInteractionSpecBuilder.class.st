"
I am special  mock role which intercepts all messages to build and validate group of expected message specs.
During intercepting I build SpecOfExpectedMessage for every mock call and add it to my composite spec. Then this spec is validated.

I am used during group messages validation: 
	[mock someMessage.
	mock2 someMessage2 once] should occur
and 
	[mock someMessage.
	mock2 someMessage2 once] should occurInSameOrder

Internal Representation and Key Implementation Points.

    Instance Variables
	spec:		<SpecOfObjectsInteraction>
"
Class {
	#name : #MockInteractionSpecBuilder,
	#superclass : #MockRole,
	#instVars : [
		'spec'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockInteractionSpecBuilder class >> for: anObjectsInteractionSpec [

	^self new 
		spec: anObjectsInteractionSpec 
]

{ #category : #processing }
MockInteractionSpecBuilder >> processMessageSend: anOccurredMessage by: aMockBehaviour [
	
	| messageSpec |
	messageSpec := SpecOfExpectedMessage from: anOccurredMessage.
	
	spec addExpectedMessage: messageSpec.
	
	^MockDetailedExpectationBuilding on: messageSpec
]

{ #category : #accessing }
MockInteractionSpecBuilder >> spec [
	^ spec
]

{ #category : #accessing }
MockInteractionSpecBuilder >> spec: anObject [
	spec := anObject
]
