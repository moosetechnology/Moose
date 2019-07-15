"
I am process specific variable to hold MockBehaviour instance during particular test case execution.

I detect current test case by another process variable  CurrentExecutionEnvironment. It allows me to detect that test was changed.

I ensure that my value will be same only during single test execution
"
Class {
	#name : #MockCurrentBehaviour,
	#superclass : #ProcessLocalVariable,
	#category : 'Mocketry-Domain'
}

{ #category : #testing }
MockCurrentBehaviour class >> isInheritable [ 
	^true
]

{ #category : #operations }
MockCurrentBehaviour class >> useMockRole: aMockRole while: aBlock [
	self value useMockRole: aMockRole while: aBlock
]

{ #category : #operations }
MockCurrentBehaviour class >> validateOccurredMessagesBy: aSpecOfOccurredMessages [ 
	^self value validateOccurredMessagesBy: aSpecOfOccurredMessages  
]

{ #category : #accessing }
MockCurrentBehaviour >> installValue: aMockBehaviour intoForked: newProcess from: ownerProcess [
	
	aMockBehaviour isInheritableByFork ifFalse: [ ^self ].

	newProcess psValueAt: index put: aMockBehaviour
]

{ #category : #evaluating }
MockCurrentBehaviour >> value [

	| currentBehaviour currentEnv |
	currentEnv := CurrentExecutionEnvironment value.
	currentBehaviour := Processor activeProcess psValueAt: index.	
	
	(currentBehaviour notNil and: [currentEnv isMockBehaviourActive: currentBehaviour])
		ifTrue: [ ^currentBehaviour].

	currentBehaviour := currentEnv createMockBehaviour.
	self value: currentBehaviour.
	^currentBehaviour
]

{ #category : #evaluating }
MockCurrentBehaviour >> value: anObject [

	| currentBehaviour |
	currentBehaviour := Processor activeProcess psValueAt: index.
	currentBehaviour ifNotNil: [ currentBehaviour recoverGlobalStubs].
	
	super value: anObject
]
