Class {
	#name : #DynamixActivationTest,
	#superclass : #TestCase,
	#category : #'Dynamix-Tests-Core'
}

{ #category : #tests }
DynamixActivationTest >> testArguments [
	| activation argument1 argument2 |
	activation := DynamixActivation new.
	argument1 := DynamixReference new.
	argument2 := DynamixReference new.
	activation arguments: {argument1}.
	activation arguments add: argument2.
	self assert: (activation arguments includes: argument1).
	self assert: (activation arguments includes: argument2).
	self assert: (argument1 activationsWithArgument includes: activation).
	self assert: (argument2 activationsWithArgument includes: activation)
]

{ #category : #tests }
DynamixActivationTest >> testBehaviour [
	| activation behaviour |
	activation := DynamixActivation new.
	behaviour := FamixBehaviouralEntity new.
	activation behaviour: behaviour.
	self assert: behaviour activations size = 1.
	self assert: behaviour activations first = activation
]

{ #category : #tests }
DynamixActivationTest >> testDurationExplicitlySet [
	| activation |
	activation := DynamixActivation new.
	activation duration: 123.
	self assert: activation duration = 123
]

{ #category : #tests }
DynamixActivationTest >> testDurationExplicitlySetEvenIfStartAndStopIsPresent [
	| activation |
	activation := DynamixActivation new.
	activation start: Time now.
	activation stop: Time now.
	activation duration: 123.
	self assert: activation duration = 123
]

{ #category : #tests }
DynamixActivationTest >> testDurationFromStartAndStop [
	| activation |
	activation := DynamixActivation new.
	activation start: 1.
	activation stop: 2.
	self assert: activation duration = 1
]

{ #category : #tests }
DynamixActivationTest >> testReceiver [
	| activation receiver |
	activation := DynamixActivation new.
	receiver := DynamixReference new.
	activation receiver: receiver.
	self assert: activation receiver = receiver.
	self assert: (receiver activationsWithReceiver includes: activation)
]

{ #category : #tests }
DynamixActivationTest >> testReturn [
	| activation return |
	activation := DynamixActivation new.
	return := DynamixReference new.
	activation return: return.
	self assert: activation return = return.
	self assert: (return activationsWithReturn includes: activation)
]

{ #category : #tests }
DynamixActivationTest >> testTrace [
	| activation leafActivation trace |
	trace := DynamixTrace new.
	activation := DynamixActivation new.
	activation parent: trace.
	leafActivation := DynamixActivation new.	
	leafActivation parent: activation.
	self assert: leafActivation trace = trace
]
