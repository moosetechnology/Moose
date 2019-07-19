Trait {
	#name : #TFamixTWithEnumValuesTest,
	#instVars : [
		'enumValue1',
		'enumValue2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithEnumValuesTest >> testEnumValues [
enumValue1 := MooseEntity new copyWithTalent: FamixTEnumValue.
enumValue1 class initializeSlots: enumValue1.
model add: enumValue1.
enumValue2 := MooseEntity new copyWithTalent: FamixTEnumValue.
enumValue2 class initializeSlots: enumValue2.
model add: enumValue2.
self entity addEnumValue: enumValue1.
self entity addEnumValue: enumValue2.
self assert: (self entity enumValues notEmpty).
self assertCollection: self entity enumValues hasSameElements: {  enumValue1. enumValue2 }.
self assert: enumValue1 parentEnum equals: self entity
]
