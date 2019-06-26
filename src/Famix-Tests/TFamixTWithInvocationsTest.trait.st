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
TFamixTWithInvocationsTest >> testWithInvocations [
invocation1:= MooseEntity new copyWithTalent: FamixTInvocation.
invocation2:= MooseEntity new copyWithTalent: FamixTInvocation.
self entity addOutgoingInvocation: invocation1.
self entity addOutgoingInvocation: invocation2.
self assert: (self entity outgoingInvocations notEmpty).
	self assertCollection: self entity outgoingInvocations hasSameElements: { invocation1. invocation2 }.
self assert: invocation1 sender equals: entity
]

{ #category : #tests }
TFamixTWithInvocationsTest >> testWithoutInvocations [
			self assert: (self entity outgoingInvocations isEmpty)
]
