Trait {
	#name : #TFamixTWithAccessesTest,
	#instVars : [
		'access1',
		'access2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAccessesTest >> testAccesses [
access1 := MooseEntity new copyWithTalent: FamixTAccess.
access1 class initializeSlots: access1.
model add: access1.
access2 := MooseEntity new copyWithTalent: FamixTAccess.
access2 class initializeSlots: access2.
model add: access2.
self entity addAccess: access1.
self entity addAccess: access2.
self assert: (self entity accesses notEmpty).
self assertCollection: self entity accesses hasSameElements: {  access1. access2 }.
self assert: access1 accessor equals: self entity
]
