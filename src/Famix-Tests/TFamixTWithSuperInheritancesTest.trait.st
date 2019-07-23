Trait {
	#name : #TFamixTWithSuperInheritancesTest,
	#instVars : [
		'superInheritance1',
		'superInheritance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSuperInheritancesTest >> testSubInheritances [
superInheritance1 := MooseEntity new copyWithTalent: FamixTSuperInheritance.
superInheritance1 class initializeSlots: superInheritance1.
model add: superInheritance1.
superInheritance2 := MooseEntity new copyWithTalent: FamixTSuperInheritance.
superInheritance2 class initializeSlots: superInheritance2.
model add: superInheritance2.
self entity addSubInheritance: superInheritance1.
self entity addSubInheritance: superInheritance2.
self assert: (self entity subInheritances notEmpty).
self assertCollection: self entity subInheritances hasSameElements: {  superInheritance1. superInheritance2 }.
self assert: superInheritance1 superclass equals: self entity
]
