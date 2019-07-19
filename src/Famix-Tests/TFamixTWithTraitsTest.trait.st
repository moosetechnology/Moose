Trait {
	#name : #TFamixTWithTraitsTest,
	#instVars : [
		'trait1',
		'trait2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTraitsTest >> testTraits [
trait1 := MooseEntity new copyWithTalent: FamixTTrait.
trait1 class initializeSlots: trait1.
model add: trait1.
trait2 := MooseEntity new copyWithTalent: FamixTTrait.
trait2 class initializeSlots: trait2.
model add: trait2.
self entity addTrait: trait1.
self entity addTrait: trait2.
self assert: (self entity traits notEmpty).
self assertCollection: self entity traits hasSameElements: {  trait1. trait2 }.
self assert: trait1 traitOwner equals: self entity
]
