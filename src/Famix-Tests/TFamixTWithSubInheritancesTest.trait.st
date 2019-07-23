Trait {
	#name : #TFamixTWithSubInheritancesTest,
	#instVars : [
		'subInheritance1',
		'subInheritance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSubInheritancesTest >> testSuperInheritances [
subInheritance1 := MooseEntity new copyWithTalent: FamixTSubInheritance.
subInheritance1 class initializeSlots: subInheritance1.
model add: subInheritance1.
subInheritance2 := MooseEntity new copyWithTalent: FamixTSubInheritance.
subInheritance2 class initializeSlots: subInheritance2.
model add: subInheritance2.
self entity addSuperInheritance: subInheritance1.
self entity addSuperInheritance: subInheritance2.
self assert: (self entity superInheritances notEmpty).
self assertCollection: self entity superInheritances hasSameElements: {  subInheritance1. subInheritance2 }.
self assert: subInheritance1 subclass equals: self entity
]
