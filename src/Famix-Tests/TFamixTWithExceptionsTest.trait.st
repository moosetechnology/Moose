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
TFamixTWithExceptionsTest >> testWithExceptions [
exception1:= MooseEntity new copyWithTalent: FamixTException.
exception2:= MooseEntity new copyWithTalent: FamixTException.
self entity addException: exception1.
self entity addException: exception2.
self assert: (self entity exceptions notEmpty).
	self assertCollection: self entity exceptions hasSameElements: { exception1. exception2 }.
self assert: exception1 exceptionClass equals: entity
]

{ #category : #tests }
TFamixTWithExceptionsTest >> testWithoutExceptions [
			self assert: (self entity exceptions isEmpty)
]
