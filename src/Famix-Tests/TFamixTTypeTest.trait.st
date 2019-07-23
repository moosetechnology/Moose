Trait {
	#name : #TFamixTTypeTest,
	#instVars : [
		'isAbstract',
		'typeContainer'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypeTest >> testIsAbstract [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity isAbstract: 'aLiteral'. 
self assert: (self entity isAbstract notNil).
self assert: self entity isAbstract equals: 'aLiteral' .
]

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
