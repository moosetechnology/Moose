Trait {
	#name : #TFamixTWithDereferencedInvocationsTest,
	#instVars : [
		'dereferencedinvocation1',
		'dereferencedinvocation2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithDereferencedInvocationsTest >> testWithDereferencedInvocations [
dereferencedinvocation1:= MooseEntity new copyWithTalent: FamixTDereferencedInvocation.
dereferencedinvocation2:= MooseEntity new copyWithTalent: FamixTDereferencedInvocation.
self entity addDereferencedInvocation: dereferencedinvocation1.
self entity addDereferencedInvocation: dereferencedinvocation2.
self assert: (self entity dereferencedInvocations notEmpty).
	self assertCollection: self entity dereferencedInvocations hasSameElements: { dereferencedinvocation1. dereferencedinvocation2 }.
self assert: dereferencedinvocation1 referencer equals: entity
]

{ #category : #tests }
TFamixTWithDereferencedInvocationsTest >> testWithoutDereferencedInvocations [
			self assert: (self entity dereferencedInvocations isEmpty)
]
