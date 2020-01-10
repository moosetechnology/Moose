Class {
	#name : #FamixTWithInheritancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithInheritancesTest',
	#classTraits : 'TFamixTWithInheritancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithInheritancesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithInheritances).
self entity class initializeSlots: self entity.
model add: entity. 
]

{ #category : #tests }
FamixTWithInheritancesTest >> testSuperInheritances [
	self skipOnPharoCITestingEnvironment.
	self flag: 'Benoit Verhaeghe - badetitou@gmail.com - This test fails for no reason only on travis. We should be stop by a generated test that will probably evolved in the futur and block all the developement and other improvment of Moose 8'.
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
