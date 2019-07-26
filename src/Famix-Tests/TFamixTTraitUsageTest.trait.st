Trait {
	#name : #TFamixTTraitUsageTest,
	#instVars : [
		'trait',
		'user'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTraitUsageTest >> testTrait [
trait := MooseEntity new copyWithTalent: FamixTTrait. 
trait class initializeSlots: trait.
model add: trait.
self entity trait: trait. 
self assert: (self entity trait notNil).
self assert: self entity trait equals: trait.
self assertCollection: trait incomingTraitUsages hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTTraitUsageTest >> testUser [
user := MooseEntity new copyWithTalent: FamixTTraitUser. 
user class initializeSlots: user.
model add: user.
self entity user: user. 
self assert: (self entity user notNil).
self assert: self entity user equals: user.
self assertCollection: user outgoingTraitUsages hasSameElements: {self entity}
]
