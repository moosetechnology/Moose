Class {
	#name : #FamixTSuperInheritanceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSuperInheritanceTest',
	#classTraits : 'TFamixTSuperInheritanceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSuperInheritanceTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTSuperInheritance).
self entity class initializeSlots: self entity.
]
