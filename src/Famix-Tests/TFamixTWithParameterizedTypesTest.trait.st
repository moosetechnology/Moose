Trait {
	#name : #TFamixTWithParameterizedTypesTest,
	#instVars : [
		'parameterizedtype1',
		'parameterizedtype2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithParameterizedTypesTest >> testWithParameterizedTypes [
parameterizedtype1:= MooseEntity new copyWithTalent: FamixTParameterizedType.
parameterizedtype2:= MooseEntity new copyWithTalent: FamixTParameterizedType.
self entity addParameterizedType: parameterizedtype1.
self entity addParameterizedType: parameterizedtype2.
self assert: (self entity parameterizedTypes notEmpty).
	self assertCollection: self entity parameterizedTypes hasSameElements: { parameterizedtype1. parameterizedtype2 }.
self assert: parameterizedtype1 parameterizableClass equals: entity
]

{ #category : #tests }
TFamixTWithParameterizedTypesTest >> testWithoutParameterizedTypes [
			self assert: (self entity parameterizedTypes isEmpty)
]
