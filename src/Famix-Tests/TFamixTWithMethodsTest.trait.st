Trait {
	#name : #TFamixTWithMethodsTest,
	#instVars : [
		'method1',
		'method2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithMethodsTest >> testMethods [
method1 := MooseEntity new copyWithTalent: FamixTMethod.
method1 class initializeSlots: method1.
model add: method1.
method2 := MooseEntity new copyWithTalent: FamixTMethod.
method2 class initializeSlots: method2.
model add: method2.
self entity addMethod: method1.
self entity addMethod: method2.
self assert: (self entity methods notEmpty).
self assertCollection: self entity methods hasSameElements: {  method1. method2 }.
self assert: method1 parentType equals: self entity
]
