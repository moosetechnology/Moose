"
I specify arbitrary condition during message send. 
I am used by MockExpectedMessage to validate any state in time when expectation should be executed.

My instance can be created by 
	SpecOfMessageSendCondition of: aSubjectBlock by: aSpec
or it is created by dsl messages: 
	mock stub someMessage when: [ anyState ] is: true
or
	mock stub someMessage when: [ anyState ] is: (Instance of: Number)
 
Internal Representation and Key Implementation Points.

    Instance Variables
	conditionSpec:		<SpecOfObjectState>
	subjectBlock:		<BlockClosure>


    Implementation Points
"
Class {
	#name : #SpecOfMessageSendCondition,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'conditionSpec',
		'subjectBlock'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfMessageSendCondition class >> of: subjectBlock by: aSpecOfObjectState [
	^self new 
		subjectBlock: subjectBlock;
		conditionSpec: aSpecOfObjectState 
]

{ #category : #testing }
SpecOfMessageSendCondition >> basicMatches: aMessageSend [

	| subject |
	subject := subjectBlock valueWithEnoughArguments: aMessageSend arguments.
	^(conditionSpec matches: subject)
]

{ #category : #accessing }
SpecOfMessageSendCondition >> conditionSpec [
	^ conditionSpec
]

{ #category : #accessing }
SpecOfMessageSendCondition >> conditionSpec: anObjectOrSpec [
	conditionSpec := anObjectOrSpec asStateSpec
]

{ #category : #accessing }
SpecOfMessageSendCondition >> invertChildren [
	super invertChildren.
	
	conditionSpec invert
]

{ #category : #accessing }
SpecOfMessageSendCondition >> subjectBlock [
	^ subjectBlock
]

{ #category : #accessing }
SpecOfMessageSendCondition >> subjectBlock: anObject [
	subjectBlock := anObject
]

{ #category : #validation }
SpecOfMessageSendCondition >> validate: aMessageSend [ 
	| subject |
	subject := subjectBlock valueWithEnoughArguments: aMessageSend arguments.
	
	^(conditionSpec validate: subject)
]
