Trait {
	#name : #TFamixTWithSuperInheritancesTest,
	#instVars : [
		'superinheritance1',
		'superinheritance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSuperInheritancesTest >> testWithSuperInheritances [
superinheritance1:= MooseEntity new copyWithTalent: FamixTSuperInheritance.
superinheritance2:= MooseEntity new copyWithTalent: FamixTSuperInheritance.
self entity addSubInheritance: superinheritance1.
self entity addSubInheritance: superinheritance2.
self assert: (self entity subInheritances notEmpty).
	self assertCollection: self entity subInheritances hasSameElements: { superinheritance1. superinheritance2 }.
self assert: superinheritance1 superclass equals: entity
]

{ #category : #tests }
TFamixTWithSuperInheritancesTest >> testWithoutSuperInheritances [
			self assert: (self entity subInheritances isEmpty)
]
