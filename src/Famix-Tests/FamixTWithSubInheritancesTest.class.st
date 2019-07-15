Class {
	#name : #FamixTWithSubInheritancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSubInheritancesTest',
	#classTraits : 'TFamixTWithSubInheritancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSubInheritancesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithSubInheritances).
self entity class initializeSlots: self entity.
]
