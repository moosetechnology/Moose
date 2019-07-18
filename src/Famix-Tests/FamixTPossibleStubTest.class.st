Class {
	#name : #FamixTPossibleStubTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPossibleStubTest',
	#classTraits : 'TFamixTPossibleStubTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPossibleStubTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTPossibleStub).
self entity class initializeSlots: self entity.
]
