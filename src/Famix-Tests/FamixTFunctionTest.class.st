Class {
	#name : #FamixTFunctionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFunctionTest',
	#classTraits : 'TFamixTFunctionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFunctionTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTFunction).
self entity class initializeSlots: self entity.
model add: entity. 
]
