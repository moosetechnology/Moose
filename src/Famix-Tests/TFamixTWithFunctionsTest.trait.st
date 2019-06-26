Trait {
	#name : #TFamixTWithFunctionsTest,
	#instVars : [
		'function1',
		'function2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithFunctionsTest >> testWithFunctions [
function1:= MooseEntity new copyWithTalent: FamixTFunction.
function2:= MooseEntity new copyWithTalent: FamixTFunction.
self entity addFunction: function1.
self entity addFunction: function2.
self assert: (self entity functions notEmpty).
	self assertCollection: self entity functions hasSameElements: { function1. function2 }.
self assert: function1 functionOwner equals: entity
]

{ #category : #tests }
TFamixTWithFunctionsTest >> testWithoutFunctions [
			self assert: (self entity functions isEmpty)
]
