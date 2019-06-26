Trait {
	#name : #TFamixTWithReferencesTest,
	#instVars : [
		'reference1',
		'reference2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithReferencesTest >> testWithReferences [
reference1:= MooseEntity new copyWithTalent: FamixTReference.
reference2:= MooseEntity new copyWithTalent: FamixTReference.
self entity addOutgoingReference: reference1.
self entity addOutgoingReference: reference2.
self assert: (self entity outgoingReferences notEmpty).
	self assertCollection: self entity outgoingReferences hasSameElements: { reference1. reference2 }.
self assert: reference1 source equals: entity
]

{ #category : #tests }
TFamixTWithReferencesTest >> testWithoutReferences [
			self assert: (self entity outgoingReferences isEmpty)
]
