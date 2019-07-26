Trait {
	#name : #TFamixTTypeTest,
	#instVars : [
		'typeContainer'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypeTest >> testTypeContainer [
typeContainer := MooseEntity new copyWithTalent: FamixTWithTypes. 
typeContainer class initializeSlots: typeContainer.
model add: typeContainer.
self entity typeContainer: typeContainer. 
self assert: (self entity typeContainer notNil).
self assert: self entity typeContainer equals: typeContainer.
self assertCollection: typeContainer types hasSameElements: {self entity}
]
