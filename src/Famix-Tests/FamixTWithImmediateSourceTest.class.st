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
self entity: (MooseEntity new copyWithTalent:FamixTWithImmediateSource).
self entity class initializeSlots: self entity.
]
