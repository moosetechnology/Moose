Trait {
	#name : #TFamixTWithCaughtExceptionsTest,
	#instVars : [
		'caughtexception1',
		'caughtexception2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithCaughtExceptionsTest >> testWithCaughtExceptions [
caughtexception1:= MooseEntity new copyWithTalent: FamixTCaughtException.
caughtexception2:= MooseEntity new copyWithTalent: FamixTCaughtException.
self entity addCaughtException: caughtexception1.
self entity addCaughtException: caughtexception2.
self assert: (self entity caughtExceptions notEmpty).
	self assertCollection: self entity caughtExceptions hasSameElements: { caughtexception1. caughtexception2 }.
self assert: caughtexception1 definingEntity equals: entity
]

{ #category : #tests }
TFamixTWithCaughtExceptionsTest >> testWithoutCaughtExceptions [
			self assert: (self entity caughtExceptions isEmpty)
]
