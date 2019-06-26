Trait {
	#name : #TFamixTWithEnumValuesTest,
	#instVars : [
		'enumvalue1',
		'enumvalue2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithEnumValuesTest >> testWithEnumValues [
enumvalue1:= MooseEntity new copyWithTalent: FamixTEnumValue.
enumvalue2:= MooseEntity new copyWithTalent: FamixTEnumValue.
self entity addEnumValue: enumvalue1.
self entity addEnumValue: enumvalue2.
self assert: (self entity enumValues notEmpty).
	self assertCollection: self entity enumValues hasSameElements: { enumvalue1. enumvalue2 }.
self assert: enumvalue1 parentEnum equals: entity
]

{ #category : #tests }
TFamixTWithEnumValuesTest >> testWithoutEnumValues [
			self assert: (self entity enumValues isEmpty)
]
