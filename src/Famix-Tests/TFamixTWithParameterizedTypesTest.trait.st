Trait {
	#name : #TFamixTWithParameterizedTypesTest,
	#instVars : [
		'parameterizedType1',
		'parameterizedType2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithParameterizedTypesTest >> testParameterizedTypes [
parameterizedType1 := MooseEntity new copyWithTalent: FamixTParameterizedType.
parameterizedType1 class initializeSlots: parameterizedType1.
model add: parameterizedType1.
parameterizedType2 := MooseEntity new copyWithTalent: FamixTParameterizedType.
parameterizedType2 class initializeSlots: parameterizedType2.
model add: parameterizedType2.
self entity addParameterizedType: parameterizedType1.
self entity addParameterizedType: parameterizedType2.
self assert: (self entity parameterizedTypes notEmpty).
self assertCollection: self entity parameterizedTypes hasSameElements: {  parameterizedType1. parameterizedType2 }.
self assert: parameterizedType1 parameterizableClass equals: self entity
]
