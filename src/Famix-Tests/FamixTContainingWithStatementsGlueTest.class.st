Class {
	#name : #FamixTContainingWithStatementsGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTContainingWithStatementsGlueTest',
	#classTraits : 'TFamixTContainingWithStatementsGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTContainingWithStatementsGlueTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTContainingWithStatementsGlue).
self entity class initializeSlots: self entity.
]
