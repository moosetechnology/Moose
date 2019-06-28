Class {
	#name : #FamixTParameterTest,
	#superclass : #TestCase,
	#traits : 'TFamixTParameterTest',
	#classTraits : 'TFamixTParameterTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTParameterTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTParameter).
self entity class initializeSlots: self entity.
]
