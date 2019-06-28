Class {
	#name : #FamixTWithParameterizedTypeUsersTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithParameterizedTypeUsersTest',
	#classTraits : 'TFamixTWithParameterizedTypeUsersTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithParameterizedTypeUsersTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithParameterizedTypeUsers).
self entity class initializeSlots: self entity.
]
