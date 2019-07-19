Trait {
	#name : #TFamixTTypedStructureTest,
	#instVars : [
		'declaredType'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypedStructureTest >> testDeclaredType [
declaredType := MooseEntity new copyWithTalent: FamixTWithTypedStructures. 
declaredType class initializeSlots: declaredType.
model add: declaredType.
self entity declaredType: declaredType. 
self assert: (self entity declaredType notNil).
self assert: self entity declaredType equals: declaredType.
self assertCollection: declaredType structuresWithDeclaredType hasSameElements: {self entity}
]
