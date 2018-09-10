"
I represent expected mock action which defined by block.
I will return block result as execution result.

I can be created with block by: 
	MockExpectedPluggableAction baseOn: aBlock.
or by block: 
	aBlock asMockExpectationAction
	
Internal Representation and Key Implementation Points.

    Instance Variables
	block:		<BlockClosure>
"
Class {
	#name : #MockExpectedPluggableAction,
	#superclass : #MockExpectedAction,
	#instVars : [
		'block'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedPluggableAction class >> basedOn: aBlockContext [ 
	^self new block: aBlockContext
]

{ #category : #accessing }
MockExpectedPluggableAction >> block [
	^block
]

{ #category : #accessing }
MockExpectedPluggableAction >> block: anObject [
	block := anObject
]

{ #category : #evaluating }
MockExpectedPluggableAction >> executeFor: anOccurredMessage [ 
	^block valueWithEnoughArguments: anOccurredMessage arguments
]
