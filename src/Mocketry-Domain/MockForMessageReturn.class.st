"
I am special mock which are returned from messages as default value when no expectation is defined.

I contain message which was produced me. And my printed value includes information about it.

Also I try to mimic false in ifTrue/ifFalse conditions. When I detect it I replace myself with false.
And I try to do same logic for arithmetics operations. I replace myself by zero when I detect that numbers logic is performed with me.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>
"
Class {
	#name : #MockForMessageReturn,
	#superclass : #MockHelper,
	#instVars : [
		'message'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockForMessageReturn class >> from: anOccurredMessage [
	^self withoutName 
		mockOwnerMessage: anOccurredMessage 
]

{ #category : #'instance creation' }
MockForMessageReturn class >> from: anOccurredMessage withBehaviour: aGhostBehavior [
	^self withoutName 
		mockOwnerMessage: anOccurredMessage;
		ghostBehaviour: aGhostBehavior
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToFloat: rcvr andCompare: selector [

	^self adaptToFloat: rcvr andSend: selector
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToFloat: rcvr andSend: selector [

	self mockBecome: 0.0.
	^rcvr perform: selector with: 0.0
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToFraction: rcvr andCompare: selector [

	^self adaptToFraction: rcvr andSend: selector
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToFraction: rcvr andSend: selector [

	^self adaptToInteger: rcvr andSend: selector
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToInteger: rcvr andCompare: selector [

	^self adaptToInteger: rcvr andSend: selector
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToInteger: rcvr andSend: selector [

	self mockBecome: 0.
	^rcvr perform: selector with: 0
]

{ #category : #'arithmetics simulation' }
MockForMessageReturn >> adaptToPoint: rcvr andSend: selector [

	| zero |
	zero := 0@0.
	self mockBecome: zero.
	^rcvr perform: selector with: zero
]

{ #category : #converting }
MockForMessageReturn >> asOccurredMessageResult [
	^MockOccurredDefaultReturn with: self
]

{ #category : #printing }
MockForMessageReturn >> ghostPrintString [
	
	^'Result(', self mockName, ') of: ', message printWithoutResult
]

{ #category : #private }
MockForMessageReturn >> mockBecome: anObject [
	(Array with: self)	elementsForwardIdentityTo: (Array with: anObject) copyHash: false
]

{ #category : #accessing }
MockForMessageReturn >> mockOwnerMessage [
	^message
]

{ #category : #accessing }
MockForMessageReturn >> mockOwnerMessage: anOccurredMessage [
	message := anOccurredMessage 	
]

{ #category : #'boolean simulation' }
MockForMessageReturn >> mustBeBoolean [
	| sender |
	
	sender := thisContext sender.
	sender pc: sender previousPc.

	self mockBecome: false
]
