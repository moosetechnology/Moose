"
I represent intercepted message send.
I extend information defined in ordinar MessageSend. I add process in which context message was occurred. And I add result which represents result of message execution. 

I implement nice printing.

Public API and Key Messages

- extractResultForm: aBlock 
it will execute given block to catch result of self execution
 
- setUpDefaultResult 
It set default execution result which depends on receiver. For Mocks it will be special new mock. And for real object stubs it will be result of original method execution.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	process:		<Process>
	result:		<MockOccurredMessageResult>
"
Class {
	#name : #MockOccurredMessage,
	#superclass : #MessageSend,
	#instVars : [
		'process',
		'result'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredMessage class >> receiver: anObject selector: aSymbol result: anOccurredMessageResult [

	^(self receiver: anObject selector: aSymbol) result: anOccurredMessageResult 
]

{ #category : #comparing }
MockOccurredMessage >> = aMockOccurredMessage [
	"Occured message sends should not be equal if they include same parameters.
	They are always different entities which reflect sends at different time"
	 
	^self == aMockOccurredMessage

]

{ #category : #accessing }
MockOccurredMessage >> extractResultFrom: aBlock [

	| returnedValue |
	returnedValue := aBlock on: Exception - Halt do: [ :err | 
		result := MockOccurredExceptionSignal exception: err.
		err pass ].
	
	result := returnedValue asOccurredMessageResult.
	^returnedValue
]

{ #category : #testing }
MockOccurredMessage >> hasRaisedExceptionLike: anExceptionOrSpec [

	^result isSignalOf: anExceptionOrSpec
]

{ #category : #testing }
MockOccurredMessage >> hasReturnedValueLike: anObjectOrSpec [

	^result isReturnOf: anObjectOrSpec
]

{ #category : #comparing }
MockOccurredMessage >> hash [
	"Occured message sends should not be equal if they include same parameters.
	They are always different entities which reflect sends at different time"
	 
	^ self identityHash 
]

{ #category : #initialization }
MockOccurredMessage >> initialize [
	super initialize.
	
	process := Processor activeProcess
]

{ #category : #printing }
MockOccurredMessage >> printMessage [

	^String streamContents: [ :s | self printMessageOn: s ]
]

{ #category : #printing }
MockOccurredMessage >> printMessageOn: aStream [

	arguments isEmpty ifTrue: [^ aStream << selector].
	arguments with: selector keywords do: [:arg :word |
		aStream << word; space; << arg stringForSpecTitle; space].
	aStream skip: -1
]

{ #category : #printing }
MockOccurredMessage >> printOn: aStream [

	arguments ifNil: [ 
		^super printOn: aStream].
	
	self printWithoutResultOn: aStream.

	result ifNotNil: [ aStream << ' '; print: result ]
]

{ #category : #printing }
MockOccurredMessage >> printWithoutResult [
	
	^String streamContents: [ :s | self printWithoutResultOn: s ]
]

{ #category : #printing }
MockOccurredMessage >> printWithoutResultOn: aStream [
	
	aStream << receiver stringForSpecTitle; << ' '.
	self printMessageOn: aStream
]

{ #category : #accessing }
MockOccurredMessage >> process [
	^ process
]

{ #category : #accessing }
MockOccurredMessage >> process: anObject [
	process := anObject
]

{ #category : #accessing }
MockOccurredMessage >> result [
	^ result
]

{ #category : #accessing }
MockOccurredMessage >> result: anObject [
	result := anObject
]

{ #category : #accessing }
MockOccurredMessage >> returnedValue [
	^self result value
]

{ #category : #accessing }
MockOccurredMessage >> setUpUnexpectedResult [

	^self extractResultFrom: [ receiver stubDoesNotExpect: self ]
]

{ #category : #printing }
MockOccurredMessage >> stringForResultSpec [

	^result stringForSpecValidation , ' from ', self printWithoutResult
]
