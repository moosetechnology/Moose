Trait {
	#name : #TFamixTInvocationsReceiverTest,
	#instVars : [
		'invocation1',
		'invocation2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTInvocationsReceiverTest >> testReceivingInvocations [
invocation1 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation1 class initializeSlots: invocation1.
model add: invocation1.
invocation2 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation2 class initializeSlots: invocation2.
model add: invocation2.
self entity addReceivingInvocation: invocation1.
self entity addReceivingInvocation: invocation2.
self assert: (self entity receivingInvocations notEmpty).
self assertCollection: self entity receivingInvocations hasSameElements: {  invocation1. invocation2 }.
self assert: invocation1 receiver equals: self entity
]
