Trait {
	#name : #TFamixTInvocableTest,
	#instVars : [
		'invocation1',
		'invocation2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTInvocableTest >> testIncomingInvocations [
invocation1 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation1 class initializeSlots: invocation1.
model add: invocation1.
invocation2 := MooseEntity new copyWithTalent: FamixTInvocation.
invocation2 class initializeSlots: invocation2.
model add: invocation2.
self entity addIncomingInvocation: invocation1.
self entity addIncomingInvocation: invocation2.
self assert: (self entity incomingInvocations notEmpty).
self assertCollection: self entity incomingInvocations hasSameElements: {  invocation1. invocation2 }.
self assertCollection: invocation1 candidates hasSameElements: {self entity}
]
