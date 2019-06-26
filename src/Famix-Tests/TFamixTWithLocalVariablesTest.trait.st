Trait {
	#name : #TFamixTWithLocalVariablesTest,
	#instVars : [
		'localvariable1',
		'localvariable2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithLocalVariablesTest >> testWithLocalVariables [
localvariable1:= MooseEntity new copyWithTalent: FamixTLocalVariable.
localvariable2:= MooseEntity new copyWithTalent: FamixTLocalVariable.
self entity addLocalVariable: localvariable1.
self entity addLocalVariable: localvariable2.
self assert: (self entity localVariables notEmpty).
	self assertCollection: self entity localVariables hasSameElements: { localvariable1. localvariable2 }.
self assert: localvariable1 parentBehaviouralEntity equals: entity
]

{ #category : #tests }
TFamixTWithLocalVariablesTest >> testWithoutLocalVariables [
			self assert: (self entity localVariables isEmpty)
]
