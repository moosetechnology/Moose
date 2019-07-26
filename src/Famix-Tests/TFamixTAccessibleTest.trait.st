Trait {
	#name : #TFamixTAccessibleTest,
	#instVars : [
		'access1',
		'access2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAccessibleTest >> testIncomingAccesses [
access1 := MooseEntity new copyWithTalent: FamixTAccess.
access1 class initializeSlots: access1.
model add: access1.
access2 := MooseEntity new copyWithTalent: FamixTAccess.
access2 class initializeSlots: access2.
model add: access2.
self entity addIncomingAccess: access1.
self entity addIncomingAccess: access2.
self assert: (self entity incomingAccesses notEmpty).
self assertCollection: self entity incomingAccesses hasSameElements: {  access1. access2 }.
self assert: access1 variable equals: self entity
]
