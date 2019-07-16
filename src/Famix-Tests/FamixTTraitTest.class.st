Class {
	#name : #FamixTTraitTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTraitTest',
	#classTraits : 'TFamixTTraitTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTraitTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTTrait).
self entity class initializeSlots: self entity.
]
