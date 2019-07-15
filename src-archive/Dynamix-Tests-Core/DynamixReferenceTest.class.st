Class {
	#name : #DynamixReferenceTest,
	#superclass : #TestCase,
	#category : #'Dynamix-Tests-Core'
}

{ #category : #tests }
DynamixReferenceTest >> testActivationsWithArguments [
	| activation1 activation2 argument |
	activation1 := DynamixActivation new.
	activation2 := DynamixActivation new.
	argument := DynamixReference new.
	argument activationsWithArgument: {activation1}.
	argument activationsWithArgument add: activation2.
	self assert: (activation1 arguments includes: argument).
	self assert: (activation2 arguments includes: argument).
	self assert: (argument activationsWithArgument includes: activation1).
	self assert: (argument activationsWithArgument includes: activation2)
]

{ #category : #tests }
DynamixReferenceTest >> testActivationsWithReceiver [
	| activation1 activation2 receiver |
	activation1 := DynamixActivation new.
	activation2 := DynamixActivation new.
	receiver := DynamixReference new.
	receiver activationsWithReceiver: {activation1}.
	receiver activationsWithReceiver add: activation2.
	self assert: activation1 receiver = receiver.
	self assert: activation2 receiver = receiver.
	self assert: (receiver activationsWithReceiver includes: activation1).
	self assert: (receiver activationsWithReceiver includes: activation2)
]

{ #category : #tests }
DynamixReferenceTest >> testActivationsWithReturn [
	| activation1 activation2 return |
	activation1 := DynamixActivation new.
	activation2 := DynamixActivation new.
	return := DynamixReference new.
	return activationsWithReturn: {activation1}.
	return activationsWithReturn add: activation2.
	self assert: activation1 return = return.
	self assert: activation2 return = return.
	self assert: (return activationsWithReturn includes: activation1).
	self assert: (return activationsWithReturn includes: activation2)
]
