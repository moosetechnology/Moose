Class {
	#name : #FamixTWithPackagesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithPackagesTest',
	#classTraits : 'TFamixTWithPackagesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithPackagesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithPackages).
self entity class initializeSlots: self entity.
model add: entity. 
]
