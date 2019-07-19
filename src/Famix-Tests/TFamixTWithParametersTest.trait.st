Trait {
	#name : #TFamixTWithParametersTest,
	#instVars : [
		'parameter1',
		'parameter2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithParametersTest >> testParameters [
parameter1 := MooseEntity new copyWithTalent: FamixTParameter.
parameter1 class initializeSlots: parameter1.
model add: parameter1.
parameter2 := MooseEntity new copyWithTalent: FamixTParameter.
parameter2 class initializeSlots: parameter2.
model add: parameter2.
self entity addParameter: parameter1.
self entity addParameter: parameter2.
self assert: (self entity parameters notEmpty).
self assertCollection: self entity parameters hasSameElements: {  parameter1. parameter2 }.
self assert: parameter1 parentBehaviouralEntity equals: self entity
]
