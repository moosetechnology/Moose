"
I represent of captured argument from series of occurred message sends.

I should be retrived by direct message to suitable class Arg:
	Arg argName 
 
I supposed to be used as argument spec in expectations. When expectation is executed I capture given message argument for future verification. I allow tests to be looked like: 

	mock stub someMessageWith: Arg argName.
	
 	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue
 
I capture all argument values from multiple message sends. 
To retrieve values of concrete call use:

	Arg argName fromFirstCall should be: #first.	
	Arg argName fromLastCall should be: #last.
	(Arg argName fromCall: 2) should be: #second.

Internal Representation and Key Implementation Points.

    Instance Variables
	messageSpec:		<SpecOfMessageSend>
	name:		<String>
	values:		<OrderedCollection>
"
Class {
	#name : #MockArgCapture,
	#superclass : #Object,
	#instVars : [
		'name',
		'messageSpec',
		'values'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockArgCapture class >> named: aString [ 
	^self new 
		name: aString
]

{ #category : #specs }
MockArgCapture >> asSimpleValue [
	^self
]

{ #category : #specs }
MockArgCapture >> asSpecOfArg: argumentNumber of: aMessageSendSpec [

	messageSpec := aMessageSendSpec.
	
	^SpecOfMessageArgument number: argumentNumber requiredValue: self
]

{ #category : #specs }
MockArgCapture >> asStateSpec [
	^self
]

{ #category : #validation }
MockArgCapture >> basicMatches: anObject [
	^true
]

{ #category : #'capturing arguments' }
MockArgCapture >> captureValue: anObject [

	anObject isAllowAutoStub ifTrue: [ anObject stub ].
	
	values add: anObject
]

{ #category : #'delegation messages' }
MockArgCapture >> doesNotUnderstand: aMessage [
	
	self validateSingleValue.
	
	^aMessage sendTo: self fromFirstCall
]

{ #category : #accessing }
MockArgCapture >> fromCall: callNumber [
	
	self validateNumberOfCalls: callNumber.
	
	^values at: callNumber
]

{ #category : #accessing }
MockArgCapture >> fromFirstCall [
	^self fromCall: 1
]

{ #category : #accessing }
MockArgCapture >> fromLastCall [
	^self fromCall: values size
]

{ #category : #initialization }
MockArgCapture >> initialize [
	super initialize.
	
	values := OrderedCollection new
]

{ #category : #specs }
MockArgCapture >> isSimpleValue [
	^true
]

{ #category : #accessing }
MockArgCapture >> messageSpec [
	^ messageSpec
]

{ #category : #accessing }
MockArgCapture >> messageSpec: anObject [
	messageSpec := anObject
]

{ #category : #accessing }
MockArgCapture >> name [
	^ name
]

{ #category : #accessing }
MockArgCapture >> name: anObject [
	name := anObject
]

{ #category : #printing }
MockArgCapture >> printOn: aStream [
	super printOn: aStream.
	
	aStream << $( << name << $)
]

{ #category : #specs }
MockArgCapture >> should [ 

	| expression |
	self validateSingleValue.
	
	expression := self fromFirstCall should.
	expression receiverOwner: self.
	^expression
]

{ #category : #printing }
MockArgCapture >> stringForSpecTitle [ 

	^'Arg ', name
]

{ #category : #validation }
MockArgCapture >> validate: anObject [
	
	^SpecOfValidationResult success
]

{ #category : #validation }
MockArgCapture >> validateNumberOfCalls: callsNumber [
	| expectedMessageSpec |
	messageSpec ifNil: [ self error: 'Capture is not initialized with messageSpec!' ].
	
	expectedMessageSpec := SpecOfExpectedMessage new.
	expectedMessageSpec messageSend: messageSpec.
	expectedMessageSpec usage minCount: callsNumber.
		
	MockCurrentBehaviour validateOccurredMessagesBy: expectedMessageSpec.
	
	values ifEmpty: [ self error: 'No argument was captured!' ].
	values size < callsNumber ifTrue: [ 
		self error: 'Arguments was captured ', values size asString
							, ' times but should be ', callsNumber ]			
]

{ #category : #validation }
MockArgCapture >> validateSingleValue [ 

	self validateNumberOfCalls: 1.
	
	values asSet size > 1 ifTrue: [ self error: 'Multiple args was captured! Choose concrete by #fromCall:' ].
]

{ #category : #accessing }
MockArgCapture >> values [
	^ values
]

{ #category : #accessing }
MockArgCapture >> values: anObject [
	values := anObject
]

{ #category : #specs }
MockArgCapture >> where [ 

	self validateSingleValue.
	
	^self fromFirstCall where
]
