Trait {
	#name : #TFamixTWithParameterizedTypeUsersTest,
	#instVars : [
		'parameterizedTypeUser1',
		'parameterizedTypeUser2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithParameterizedTypeUsersTest >> testArguments [
parameterizedTypeUser1 := MooseEntity new copyWithTalent: FamixTParameterizedTypeUser.
parameterizedTypeUser1 class initializeSlots: parameterizedTypeUser1.
model add: parameterizedTypeUser1.
parameterizedTypeUser2 := MooseEntity new copyWithTalent: FamixTParameterizedTypeUser.
parameterizedTypeUser2 class initializeSlots: parameterizedTypeUser2.
model add: parameterizedTypeUser2.
self entity addArgument: parameterizedTypeUser1.
self entity addArgument: parameterizedTypeUser2.
self assert: (self entity arguments notEmpty).
self assertCollection: self entity arguments hasSameElements: {  parameterizedTypeUser1. parameterizedTypeUser2 }.
self assertCollection: parameterizedTypeUser1 argumentsInParameterizedTypes hasSameElements: {self entity}
]
