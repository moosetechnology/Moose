Trait {
	#name : #TFamixTWithHeaderTest,
	#instVars : [
		'header'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithHeaderTest >> testHeader [
header := MooseEntity new copyWithTalent: FamixTHeader. 
header class initializeSlots: header.
model add: header.
self entity header: header. 
self assert: (self entity header notNil).
self assert: self entity header equals: header.
self assert: header headerOwner equals: self entity
]
