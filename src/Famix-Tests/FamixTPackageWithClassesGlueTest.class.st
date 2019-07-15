Class {
	#name : #FamixTPackageWithClassesGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPackageWithClassesGlueTest',
	#classTraits : 'TFamixTPackageWithClassesGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPackageWithClassesGlueTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTPackageWithClassesGlue).
self entity class initializeSlots: self entity.
]
