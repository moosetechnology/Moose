Trait {
	#name : #TFamixTWithThrownExceptionsTest,
	#instVars : [
		'thrownException1',
		'thrownException2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithThrownExceptionsTest >> testThrownExceptions [
thrownException1 := MooseEntity new copyWithTalent: FamixTThrownException.
thrownException1 class initializeSlots: thrownException1.
model add: thrownException1.
thrownException2 := MooseEntity new copyWithTalent: FamixTThrownException.
thrownException2 class initializeSlots: thrownException2.
model add: thrownException2.
self entity addThrownException: thrownException1.
self entity addThrownException: thrownException2.
self assert: (self entity thrownExceptions notEmpty).
self assertCollection: self entity thrownExceptions hasSameElements: {  thrownException1. thrownException2 }.
self assert: thrownException1 definingEntity equals: self entity
]
