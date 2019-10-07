Trait {
	#name : #TFamixTWithInheritancesTest,
	#instVars : [
		'subInheritance1',
		'subInheritance2',
		'superInheritance1',
		'superInheritance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithInheritancesTest >> testSubInheritances [
superInheritance1 := MooseEntity new copyWithTalent: FamixTInheritance.
superInheritance1 class initializeSlots: superInheritance1.
model add: superInheritance1.
superInheritance2 := MooseEntity new copyWithTalent: FamixTInheritance.
superInheritance2 class initializeSlots: superInheritance2.
model add: superInheritance2.
self entity addSubInheritance: superInheritance1.
self entity addSubInheritance: superInheritance2.
self assert: (self entity subInheritances notEmpty).
self assertCollection: self entity subInheritances hasSameElements: {  superInheritance1. superInheritance2 }.
self assert: superInheritance1 superclass equals: self entity
]

{ #category : #tests }
TFamixTWithInheritancesTest >> testSuperInheritances [
subInheritance1 := MooseEntity new copyWithTalent: FamixTInheritance.
subInheritance1 class initializeSlots: subInheritance1.
model add: subInheritance1.
subInheritance2 := MooseEntity new copyWithTalent: FamixTInheritance.
subInheritance2 class initializeSlots: subInheritance2.
model add: subInheritance2.
self entity addSuperInheritance: subInheritance1.
self entity addSuperInheritance: subInheritance2.
self assert: (self entity superInheritances notEmpty).
self assertCollection: self entity superInheritances hasSameElements: {  subInheritance1. subInheritance2 }.
self assert: subInheritance1 subclass equals: self entity
]
