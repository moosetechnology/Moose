Trait {
	#name : #TFamixTWithImplicitVariablesTest,
	#instVars : [
		'implicitVariable1',
		'implicitVariable2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithImplicitVariablesTest >> testImplicitVariables [
implicitVariable1 := MooseEntity new copyWithTalent: FamixTImplicitVariable.
implicitVariable1 class initializeSlots: implicitVariable1.
model add: implicitVariable1.
implicitVariable2 := MooseEntity new copyWithTalent: FamixTImplicitVariable.
implicitVariable2 class initializeSlots: implicitVariable2.
model add: implicitVariable2.
self entity addImplicitVariable: implicitVariable1.
self entity addImplicitVariable: implicitVariable2.
self assert: (self entity implicitVariables notEmpty).
self assertCollection: self entity implicitVariables hasSameElements: {  implicitVariable1. implicitVariable2 }.
self assert: implicitVariable1 parentBehaviouralEntity equals: self entity
]
