Trait {
	#name : #TFamixTWithInvocationsTest,
	#instVars : [
		'invocation1',
		'invocation2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithInvocationsTest >> testOutgoingInvocations [
invocation1 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation1 class initializeSlots: invocation1.
model add: invocation1.
invocation2 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation2 class initializeSlots: invocation2.
model add: invocation2.
self entity addOutgoingInvocation: invocation1.
self entity addOutgoingInvocation: invocation2.
self assert: (self entity outgoingInvocations notEmpty).
self assertCollection: self entity outgoingInvocations hasSameElements: {  invocation1. invocation2 }.
self assert: invocation1 sender equals: self entity
]
