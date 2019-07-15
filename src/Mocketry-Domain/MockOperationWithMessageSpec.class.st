"
I represent abstract operation which should be performed on given SpecOfExpectedMessage.

I provide DSL-kind message to modify my spec and to execute operation after this.

My subclasses should implement method #execute.

For public API look at methods. They are all public DSL.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spec:		<SpecOfExpectedMessage>
"
Class {
	#name : #MockOperationWithMessageSpec,
	#superclass : #Object,
	#instVars : [
		'spec'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOperationWithMessageSpec class >> on: anExpectedMessageSpec [

	^self new 
		spec: anExpectedMessageSpec 
		
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> atLeast: numberOfTimes [
	spec usage minCount: numberOfTimes.
	self execute
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> atLeast: minNumberOfTimes atMost: maxNumberOfTimes [
	spec usage 
		minCount: minNumberOfTimes;
		maxCount: maxNumberOfTimes.
	self execute
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> atMost: numberOfTimes [
	spec usage maxCount: numberOfTimes.
	self execute
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> exactly: numberOfTimes [
	spec usage exactCount: numberOfTimes.
	self execute
]

{ #category : #execution }
MockOperationWithMessageSpec >> execute [
	self subclassResponsibility 
]

{ #category : #'conditions vaildation' }
MockOperationWithMessageSpec >> inAnotherProcess [

	spec addSpec: SpecOfAsynchMessage forActiveProcess.
	self execute
]

{ #category : #'conditions vaildation' }
MockOperationWithMessageSpec >> inThisProcess [

	spec addSpec: SpecOfAsynchMessage forActiveProcess not.
	self execute
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> once [
	self exactly: 1
]

{ #category : #accessing }
MockOperationWithMessageSpec >> spec [
	^ spec
]

{ #category : #accessing }
MockOperationWithMessageSpec >> spec: anObject [
	spec := anObject
]

{ #category : #'usage validation' }
MockOperationWithMessageSpec >> twice [
	self exactly: 2
]
