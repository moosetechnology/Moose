Class {
	#name : #FamixTMethodTest,
	#superclass : #TestCase,
	#traits : 'TFamixTMethodTest',
	#classTraits : 'TFamixTMethodTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTMethodTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTMethod).
self entity class initializeSlots: self entity.
]
