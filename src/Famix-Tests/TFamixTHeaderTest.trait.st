Trait {
	#name : #TFamixTHeaderTest,
	#instVars : [
		'headerOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTHeaderTest >> testHeaderOwner [
headerOwner := MooseEntity new copyWithTalent: FamixTWithHeader. 
headerOwner class initializeSlots: headerOwner.
model add: headerOwner.
self entity headerOwner: headerOwner. 
self assert: (self entity headerOwner notNil).
self assert: self entity headerOwner equals: headerOwner.
self assert: headerOwner header equals: self entity
]
