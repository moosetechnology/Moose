Trait {
	#name : #TFamixTTraitTest,
	#instVars : [
		'traitUsage1',
		'traitUsage2',
		'traitOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTraitTest >> testIncomingTraitUsages [
traitUsage1 := MooseEntity new copyWithTalent: FamixTTraitUsage.
traitUsage1 class initializeSlots: traitUsage1.
model add: traitUsage1.
traitUsage2 := MooseEntity new copyWithTalent: FamixTTraitUsage.
traitUsage2 class initializeSlots: traitUsage2.
model add: traitUsage2.
self entity addIncomingTraitUsage: traitUsage1.
self entity addIncomingTraitUsage: traitUsage2.
self assert: (self entity incomingTraitUsages notEmpty).
self assertCollection: self entity incomingTraitUsages hasSameElements: {  traitUsage1. traitUsage2 }.
self assert: traitUsage1 trait equals: self entity
]

{ #category : #tests }
TFamixTTraitTest >> testTraitOwner [
traitOwner := MooseEntity new copyWithTalent: FamixTWithTraits. 
traitOwner class initializeSlots: traitOwner.
model add: traitOwner.
self entity traitOwner: traitOwner. 
self assert: (self entity traitOwner notNil).
self assert: self entity traitOwner equals: traitOwner.
self assertCollection: traitOwner traits hasSameElements: {self entity}
]
