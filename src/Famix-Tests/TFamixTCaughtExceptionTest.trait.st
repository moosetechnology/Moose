Trait {
	#name : #TFamixTCaughtExceptionTest,
	#instVars : [
		'definingEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTCaughtExceptionTest >> testDefiningEntity [
definingEntity := MooseEntity new copyWithTalent: FamixTWithCaughtExceptions. 
definingEntity class initializeSlots: definingEntity.
model add: definingEntity.
self entity definingEntity: definingEntity. 
self assert: (self entity definingEntity notNil).
self assert: self entity definingEntity equals: definingEntity.
self assertCollection: definingEntity caughtExceptions hasSameElements: {self entity}
]
