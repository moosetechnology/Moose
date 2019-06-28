Class {
	#name : #FamixTFunctionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFunctionTest',
	#classTraits : 'TFamixTFunctionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFunctionTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTFunction).
self entity class initializeSlots: self entity.
]
