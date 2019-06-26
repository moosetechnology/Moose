Trait {
	#name : #TFamixTWithImplicitVariablesTest,
	#instVars : [
		'implicitvariable1',
		'implicitvariable2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithImplicitVariablesTest >> testWithImplicitVariables [
implicitvariable1:= MooseEntity new copyWithTalent: FamixTImplicitVariable.
implicitvariable2:= MooseEntity new copyWithTalent: FamixTImplicitVariable.
self entity addImplicitVariable: implicitvariable1.
self entity addImplicitVariable: implicitvariable2.
self assert: (self entity implicitVariables notEmpty).
	self assertCollection: self entity implicitVariables hasSameElements: { implicitvariable1. implicitvariable2 }.
self assert: implicitvariable1 parentBehaviouralEntity equals: entity
]

{ #category : #tests }
TFamixTWithImplicitVariablesTest >> testWithoutImplicitVariables [
			self assert: (self entity implicitVariables isEmpty)
]
