Class {
	#name : #FamixTTraitUsageTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTraitUsageTest',
	#classTraits : 'TFamixTTraitUsageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTraitUsageTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTTraitUsage).
self entity class initializeSlots: self entity.
]
