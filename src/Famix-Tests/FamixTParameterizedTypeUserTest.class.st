Class {
	#name : #FamixTParameterizedTypeUserTest,
	#superclass : #TestCase,
	#traits : 'TFamixTParameterizedTypeUserTest',
	#classTraits : 'TFamixTParameterizedTypeUserTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTParameterizedTypeUserTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTParameterizedTypeUser).
self entity class initializeSlots: self entity.
]
