Class {
	#name : #FamixTWithStatementsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithStatementsTest',
	#classTraits : 'TFamixTWithStatementsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithStatementsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithStatements).
self entity class initializeSlots: self entity.
]
