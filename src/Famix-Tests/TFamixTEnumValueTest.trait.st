Trait {
	#name : #TFamixTEnumValueTest,
	#instVars : [
		'parentEnum'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTEnumValueTest >> testParentEnum [
parentEnum := MooseEntity new copyWithTalent: FamixTWithEnumValues. 
parentEnum class initializeSlots: parentEnum.
model add: parentEnum.
self entity parentEnum: parentEnum. 
self assert: (self entity parentEnum notNil).
self assert: self entity parentEnum equals: parentEnum.
self assertCollection: parentEnum enumValues hasSameElements: {self entity}
]
