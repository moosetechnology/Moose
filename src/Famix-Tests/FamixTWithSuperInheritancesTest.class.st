Class {
	#name : #FamixTWithSuperInheritancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSuperInheritancesTest',
	#classTraits : 'TFamixTWithSuperInheritancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSuperInheritancesTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTWithSuperInheritances).
self entity class initializeSlots: self entity.
]
