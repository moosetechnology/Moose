Trait {
	#name : #TFamixTWithDereferencedInvocationsTest,
	#instVars : [
		'dereferencedInvocation1',
		'dereferencedInvocation2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithDereferencedInvocationsTest >> testDereferencedInvocations [
dereferencedInvocation1 := MooseEntity new copyWithTalent: FamixTDereferencedInvocation.
dereferencedInvocation1 class initializeSlots: dereferencedInvocation1.
model add: dereferencedInvocation1.
dereferencedInvocation2 := MooseEntity new copyWithTalent: FamixTDereferencedInvocation.
dereferencedInvocation2 class initializeSlots: dereferencedInvocation2.
model add: dereferencedInvocation2.
self entity addDereferencedInvocation: dereferencedInvocation1.
self entity addDereferencedInvocation: dereferencedInvocation2.
self assert: (self entity dereferencedInvocations notEmpty).
self assertCollection: self entity dereferencedInvocations hasSameElements: {  dereferencedInvocation1. dereferencedInvocation2 }.
self assert: dereferencedInvocation1 referencer equals: self entity
]
