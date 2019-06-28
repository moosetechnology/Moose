Class {
	#name : #FamixTPackageTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPackageTest',
	#classTraits : 'TFamixTPackageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPackageTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTPackage).
self entity class initializeSlots: self entity.
]
