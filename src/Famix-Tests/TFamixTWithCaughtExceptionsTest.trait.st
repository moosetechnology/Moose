Trait {
	#name : #TFamixTWithCaughtExceptionsTest,
	#instVars : [
		'caughtException1',
		'caughtException2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithCaughtExceptionsTest >> testCaughtExceptions [
caughtException1 := MooseEntity new copyWithTalent: FamixTCaughtException.
caughtException1 class initializeSlots: caughtException1.
model add: caughtException1.
caughtException2 := MooseEntity new copyWithTalent: FamixTCaughtException.
caughtException2 class initializeSlots: caughtException2.
model add: caughtException2.
self entity addCaughtException: caughtException1.
self entity addCaughtException: caughtException2.
self assert: (self entity caughtExceptions notEmpty).
self assertCollection: self entity caughtExceptions hasSameElements: {  caughtException1. caughtException2 }.
self assert: caughtException1 definingEntity equals: self entity
]
