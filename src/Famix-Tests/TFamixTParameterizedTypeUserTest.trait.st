Trait {
	#name : #TFamixTParameterizedTypeUserTest,
	#instVars : [
		'withParameterizedTypeUsers1',
		'withParameterizedTypeUsers2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTParameterizedTypeUserTest >> testArgumentsInParameterizedTypes [
withParameterizedTypeUsers1 := MooseEntity new copyWithTalent: FamixTWithParameterizedTypeUsers.
withParameterizedTypeUsers1 class initializeSlots: withParameterizedTypeUsers1.
model add: withParameterizedTypeUsers1.
withParameterizedTypeUsers2 := MooseEntity new copyWithTalent: FamixTWithParameterizedTypeUsers.
withParameterizedTypeUsers2 class initializeSlots: withParameterizedTypeUsers2.
model add: withParameterizedTypeUsers2.
self entity addArgumentsInParameterizedType: withParameterizedTypeUsers1.
self entity addArgumentsInParameterizedType: withParameterizedTypeUsers2.
self assert: (self entity argumentsInParameterizedTypes notEmpty).
self assertCollection: self entity argumentsInParameterizedTypes hasSameElements: {  withParameterizedTypeUsers1. withParameterizedTypeUsers2 }.
self assertCollection: withParameterizedTypeUsers1 arguments hasSameElements: {self entity}
]
