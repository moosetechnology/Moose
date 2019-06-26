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
TFamixTWithTraitsTest >> testWithTraits [
trait1:= MooseEntity new copyWithTalent: FamixTTrait.
trait2:= MooseEntity new copyWithTalent: FamixTTrait.
self entity addTrait: trait1.
self entity addTrait: trait2.
self assert: (self entity traits notEmpty).
	self assertCollection: self entity traits hasSameElements: { trait1. trait2 }.
self assert: trait1 traitOwner equals: entity
]

{ #category : #tests }
TFamixTWithTraitsTest >> testWithoutTraits [
			self assert: (self entity traits isEmpty)
]
