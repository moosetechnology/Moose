Class {
	#name : #FamixTWithSignatureTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSignatureTest',
	#classTraits : 'TFamixTWithSignatureTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSignatureTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithSignature).
self entity class initializeSlots: self entity.
]
