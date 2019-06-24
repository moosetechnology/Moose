Trait {
	#name : #TFamixTWithTypedStructuresTest,
	#instVars : [
		'typedstructure1',
		'typedstructure2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTypedStructuresTest >> testWithTypedStructures [
typedstructure1:= MooseEntity new copyWithTalent: FamixTTypedStructure.
typedstructure2:= MooseEntity new copyWithTalent: FamixTTypedStructure.
self entity addBehaviourWithDeclaredType: typedstructure1.
self entity addBehaviourWithDeclaredType: typedstructure2.
self assert: (self entity structuresWithDeclaredType notEmpty).
	self assertCollection: self entity structuresWithDeclaredType hasSameElements: { typedstructure1. typedstructure2 }.
self assert: typedstructure1 declaredType equals: entity
]

{ #category : #tests }
TFamixTWithTypedStructuresTest >> testWithoutTypedStructures [
			self assert: (self entity structuresWithDeclaredType isEmpty)
]
