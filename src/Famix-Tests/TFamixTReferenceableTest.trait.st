Trait {
	#name : #TFamixTReferenceableTest,
	#instVars : [
		'reference1',
		'reference2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTReferenceableTest >> testIncomingReferences [
reference1 := MooseEntity new copyWithTalent: FamixTReference.
reference1 class initializeSlots: reference1.
model add: reference1.
reference2 := MooseEntity new copyWithTalent: FamixTReference.
reference2 class initializeSlots: reference2.
model add: reference2.
self entity addIncomingReference: reference1.
self entity addIncomingReference: reference2.
self assert: (self entity incomingReferences notEmpty).
self assertCollection: self entity incomingReferences hasSameElements: {  reference1. reference2 }.
self assert: reference1 target equals: self entity
]
