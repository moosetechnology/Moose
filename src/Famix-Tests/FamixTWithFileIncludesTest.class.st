Class {
	#name : #FamixTWithFileIncludesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithFileIncludesTest',
	#classTraits : 'TFamixTWithFileIncludesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithFileIncludesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithFileIncludes).
self entity class initializeSlots: self entity.
]
