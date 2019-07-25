Trait {
	#name : #TFamixTWithDeclaredExceptionsTest,
	#instVars : [
		'declaredException1',
		'declaredException2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithDeclaredExceptionsTest >> testDeclaredExceptions [
declaredException1 := MooseEntity new copyWithTalent: FamixTDeclaredException.
declaredException1 class initializeSlots: declaredException1.
model add: declaredException1.
declaredException2 := MooseEntity new copyWithTalent: FamixTDeclaredException.
declaredException2 class initializeSlots: declaredException2.
model add: declaredException2.
self entity addDeclaredException: declaredException1.
self entity addDeclaredException: declaredException2.
self assert: (self entity declaredExceptions notEmpty).
self assertCollection: self entity declaredExceptions hasSameElements: {  declaredException1. declaredException2 }.
self assert: declaredException1 definingEntity equals: self entity
]
