Class {
	#name : #FamixTHeaderTest,
	#superclass : #TestCase,
	#traits : 'TFamixTHeaderTest',
	#classTraits : 'TFamixTHeaderTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTHeaderTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTHeader).
self entity class initializeSlots: self entity.
]
