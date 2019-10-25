Class {
	#name : #FamixTWithEnumValuesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithEnumValuesTest',
	#classTraits : 'TFamixTWithEnumValuesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithEnumValuesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithEnumValues).
self entity class initializeSlots: self entity.
model add: entity. 
]
