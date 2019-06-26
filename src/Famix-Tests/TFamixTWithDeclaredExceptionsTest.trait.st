Trait {
	#name : #TFamixTWithDeclaredExceptionsTest,
	#instVars : [
		'declaredexception1',
		'declaredexception2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithDeclaredExceptionsTest >> testWithDeclaredExceptions [
declaredexception1:= MooseEntity new copyWithTalent: FamixTDeclaredException.
declaredexception2:= MooseEntity new copyWithTalent: FamixTDeclaredException.
self entity addDeclaredException: declaredexception1.
self entity addDeclaredException: declaredexception2.
self assert: (self entity declaredExceptions notEmpty).
	self assertCollection: self entity declaredExceptions hasSameElements: { declaredexception1. declaredexception2 }.
self assert: declaredexception1 definingEntity equals: entity
]

{ #category : #tests }
TFamixTWithDeclaredExceptionsTest >> testWithoutDeclaredExceptions [
			self assert: (self entity declaredExceptions isEmpty)
]
