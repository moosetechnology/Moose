Class {
	#name : #FamixTWithImmediateSourceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithImmediateSourceTest',
	#classTraits : 'TFamixTWithImmediateSourceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithImmediateSourceTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithImmediateSource).
self entity class initializeSlots: self entity.
model add: entity. 
]
