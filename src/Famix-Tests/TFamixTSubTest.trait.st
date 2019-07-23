Trait {
	#name : #TFamixTSubTest,
	#instVars : [
		'supers'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSubTest >> testSupers [
supers := MooseEntity new copyWithTalent: FamixTSuper. 
supers class initializeSlots: supers.
model add: supers.
self entity supers: supers. 
self assert: (self entity supers notNil).
self assert: self entity supers equals: supers.
self assertCollection: supers subs hasSameElements: {self entity}
]
