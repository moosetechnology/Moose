Class {
	#name : #REPConcernStatusTest,
	#superclass : #TestCase,
	#category : #'Arki-Tests-Reporter'
}

{ #category : #testing }
REPConcernStatusTest >> testUnion [
	self assert: (REPConcernSuccessStatus new union: REPConcernSuccessStatus new) isSuccessStatus.
	self assert: (REPConcernSuccessStatus new union: REPConcernFailureStatus new) isFailureStatus.
	self assert: (REPConcernSuccessStatus new union: REPConcernErrorStatus new) isSuccessStatus.
	self assert: (REPConcernSuccessStatus new union: REPConcernNeutralStatus new) isSuccessStatus.
	
	self assert: (REPConcernNeutralStatus new union: REPConcernErrorStatus new) isNeutralStatus.
	self assert: (REPConcernNeutralStatus new union: REPConcernSuccessStatus new) isSuccessStatus.
	self assert: (REPConcernNeutralStatus new union: REPConcernFailureStatus new) isFailureStatus.
	self assert: (REPConcernNeutralStatus new union: REPConcernNeutralStatus new) isNeutralStatus.

	self assert: (REPConcernErrorStatus new union: REPConcernErrorStatus new) isNeutralStatus.
	self assert: (REPConcernErrorStatus new union: REPConcernSuccessStatus new) isSuccessStatus.
	self assert: (REPConcernErrorStatus new union: REPConcernFailureStatus new) isFailureStatus.
	self assert: (REPConcernErrorStatus new union: REPConcernNeutralStatus new) isNeutralStatus.

	self assert: (REPConcernFailureStatus new union: REPConcernSuccessStatus new) isFailureStatus.
	self assert: (REPConcernFailureStatus new union: REPConcernFailureStatus new) isFailureStatus.
	self assert: (REPConcernFailureStatus new union: REPConcernErrorStatus new) isFailureStatus.
	self assert: (REPConcernFailureStatus new union: REPConcernNeutralStatus new) isFailureStatus.

]
