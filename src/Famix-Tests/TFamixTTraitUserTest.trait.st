Trait {
	#name : #TFamixTTraitUserTest,
	#instVars : [
		'traitUsage1',
		'traitUsage2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTraitUserTest >> testOutgoingTraitUsages [
traitUsage1 := MooseEntity new copyWithTalent: FamixTTraitUsage.
traitUsage1 class initializeSlots: traitUsage1.
model add: traitUsage1.
traitUsage2 := MooseEntity new copyWithTalent: FamixTTraitUsage.
traitUsage2 class initializeSlots: traitUsage2.
model add: traitUsage2.
self entity addOutgoingTraitUsage: traitUsage1.
self entity addOutgoingTraitUsage: traitUsage2.
self assert: (self entity outgoingTraitUsages notEmpty).
self assertCollection: self entity outgoingTraitUsages hasSameElements: {  traitUsage1. traitUsage2 }.
self assert: traitUsage1 user equals: self entity
]
