Trait {
	#name : #TFamixTInvocationTest,
	#instVars : [
		'invocable1',
		'invocable2',
		'receiver',
		'sender'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTInvocationTest >> testCandidates [
invocable1 := MooseEntity new copyWithTalent: FamixTInvocable.
invocable1 class initializeSlots: invocable1.
model add: invocable1.
invocable2 := MooseEntity new copyWithTalent: FamixTInvocable.
invocable2 class initializeSlots: invocable2.
model add: invocable2.
self entity addCandidate: invocable1.
self entity addCandidate: invocable2.
self assert: (self entity candidates notEmpty).
self assertCollection: self entity candidates hasSameElements: {  invocable1. invocable2 }.
self assertCollection: invocable1 incomingInvocations hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTInvocationTest >> testReceiver [
receiver := MooseEntity new copyWithTalent: FamixTInvocationsReceiver. 
receiver class initializeSlots: receiver.
model add: receiver.
self entity receiver: receiver. 
self assert: (self entity receiver notNil).
self assert: self entity receiver equals: receiver.
self assertCollection: receiver receivingInvocations hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTInvocationTest >> testSender [
sender := MooseEntity new copyWithTalent: FamixTWithInvocations. 
sender class initializeSlots: sender.
model add: sender.
self entity sender: sender. 
self assert: (self entity sender notNil).
self assert: self entity sender equals: sender.
self assertCollection: sender outgoingInvocations hasSameElements: {self entity}
]
