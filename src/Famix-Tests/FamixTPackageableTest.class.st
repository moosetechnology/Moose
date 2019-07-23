Class {
	#name : #FamixTPackageableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPackageableTest',
	#classTraits : 'TFamixTPackageableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPackageableTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTPackageable).
self entity class initializeSlots: self entity.
model add: entity. 
]
