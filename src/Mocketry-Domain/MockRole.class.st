"
I am root of different kind of mock roles which they can play during test execution.
MockBehaviour always redirect message processing to current mock role (by mockRole variable).
Since MockBehaviour is same for all mocks during single test execution modifying mockRole allows to change behaviour of all mocks. It make possible special block based approach for mocks teaching and validation: 

	[ mock someMessage willReturn: 2.
	mock2 someMessage2 willReturn: 10 ] should expect. 

	[ mock someMessage 
	mock2 someMessage2 twice ] should occur. 

My subclasses should implement method
	processMessageSend: anOccurredMessage by: aMockBehaviour
"
Class {
	#name : #MockRole,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #defaults }
MockRole class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #processing }
MockRole >> processMessageSend: anOccurredMessage by: aMockBehaviour [
	self subclassResponsibility 
]
