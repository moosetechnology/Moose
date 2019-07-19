Trait {
	#name : #TFamixTThrownExceptionTest,
	#instVars : [
		'definingEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTThrownExceptionTest >> testDefiningEntity [
definingEntity := MooseEntity new copyWithTalent: FamixTWithThrownExceptions. 
definingEntity class initializeSlots: definingEntity.
model add: definingEntity.
self entity definingEntity: definingEntity. 
self assert: (self entity definingEntity notNil).
self assert: self entity definingEntity equals: definingEntity.
self assertCollection: definingEntity thrownExceptions hasSameElements: {self entity}
]
