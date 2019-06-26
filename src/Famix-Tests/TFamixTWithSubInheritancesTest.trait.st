Trait {
	#name : #TFamixTWithSubInheritancesTest,
	#instVars : [
		'subinheritance1',
		'subinheritance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSubInheritancesTest >> testWithSubInheritances [
subinheritance1:= MooseEntity new copyWithTalent: FamixTSubInheritance.
subinheritance2:= MooseEntity new copyWithTalent: FamixTSubInheritance.
self entity addSuperInheritance: subinheritance1.
self entity addSuperInheritance: subinheritance2.
self assert: (self entity superInheritances notEmpty).
	self assertCollection: self entity superInheritances hasSameElements: { subinheritance1. subinheritance2 }.
self assert: subinheritance1 subclass equals: entity
]

{ #category : #tests }
TFamixTWithSubInheritancesTest >> testWithoutSubInheritances [
			self assert: (self entity superInheritances isEmpty)
]
