Trait {
	#name : #TFamixTWithTypedStructuresTest,
	#instVars : [
		'typedStructure1',
		'typedStructure2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTypedStructuresTest >> testStructuresWithDeclaredType [
typedStructure1 := MooseEntity new copyWithTalent: FamixTTypedStructure.
typedStructure1 class initializeSlots: typedStructure1.
model add: typedStructure1.
typedStructure2 := MooseEntity new copyWithTalent: FamixTTypedStructure.
typedStructure2 class initializeSlots: typedStructure2.
model add: typedStructure2.
self entity addBehaviourWithDeclaredType: typedStructure1.
self entity addBehaviourWithDeclaredType: typedStructure2.
self assert: (self entity structuresWithDeclaredType notEmpty).
self assertCollection: self entity structuresWithDeclaredType hasSameElements: {  typedStructure1. typedStructure2 }.
self assert: typedStructure1 declaredType equals: self entity
]
