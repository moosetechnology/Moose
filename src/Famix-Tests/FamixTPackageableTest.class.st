Class {
	#name : #FamixTPackageableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPackageableTest',
	#classTraits : 'TFamixTPackageableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPackageableTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTPackageable).
self entity class initializeSlots: self entity.
]
