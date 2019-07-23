Trait {
	#name : #TFamixTWithExceptionsTest,
	#instVars : [
		'exception1',
		'exception2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithExceptionsTest >> testExceptions [
exception1 := MooseEntity new copyWithTalent: FamixTException.
exception1 class initializeSlots: exception1.
model add: exception1.
exception2 := MooseEntity new copyWithTalent: FamixTException.
exception2 class initializeSlots: exception2.
model add: exception2.
self entity addException: exception1.
self entity addException: exception2.
self assert: (self entity exceptions notEmpty).
self assertCollection: self entity exceptions hasSameElements: {  exception1. exception2 }.
self assert: exception1 exceptionClass equals: self entity
]
