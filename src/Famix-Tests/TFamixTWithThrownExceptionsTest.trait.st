Trait {
	#name : #TFamixTWithThrownExceptionsTest,
	#instVars : [
		'thrownexception1',
		'thrownexception2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithThrownExceptionsTest >> testWithThrownExceptions [
thrownexception1:= MooseEntity new copyWithTalent: FamixTThrownException.
thrownexception2:= MooseEntity new copyWithTalent: FamixTThrownException.
self entity addThrownException: thrownexception1.
self entity addThrownException: thrownexception2.
self assert: (self entity thrownExceptions notEmpty).
	self assertCollection: self entity thrownExceptions hasSameElements: { thrownexception1. thrownexception2 }.
self assert: thrownexception1 definingEntity equals: entity
]

{ #category : #tests }
TFamixTWithThrownExceptionsTest >> testWithoutThrownExceptions [
			self assert: (self entity thrownExceptions isEmpty)
]
