Trait {
	#name : #TFamixTDeclaredExceptionTest,
	#instVars : [
		'definingEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTDeclaredExceptionTest >> testDefiningEntity [
definingEntity := MooseEntity new copyWithTalent: FamixTWithDeclaredExceptions. 
definingEntity class initializeSlots: definingEntity.
model add: definingEntity.
self entity definingEntity: definingEntity. 
self assert: (self entity definingEntity notNil).
self assert: self entity definingEntity equals: definingEntity.
self assertCollection: definingEntity declaredExceptions hasSameElements: {self entity}
]
