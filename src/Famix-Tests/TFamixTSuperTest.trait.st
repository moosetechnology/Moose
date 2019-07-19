Trait {
	#name : #TFamixTSuperTest,
	#instVars : [
		'sub1',
		'sub2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSuperTest >> testSubs [
sub1 := MooseEntity new copyWithTalent: FamixTSub.
sub1 class initializeSlots: sub1.
model add: sub1.
sub2 := MooseEntity new copyWithTalent: FamixTSub.
sub2 class initializeSlots: sub2.
model add: sub2.
self entity addSub: sub1.
self entity addSub: sub2.
self assert: (self entity subs notEmpty).
self assertCollection: self entity subs hasSameElements: {  sub1. sub2 }.
self assert: sub1 supers equals: self entity
]
