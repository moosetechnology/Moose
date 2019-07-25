Trait {
	#name : #TFamixTSuperInheritanceTest,
	#instVars : [
		'superclass'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSuperInheritanceTest >> testSuperclass [
superclass := MooseEntity new copyWithTalent: FamixTWithSuperInheritances. 
superclass class initializeSlots: superclass.
model add: superclass.
self entity superclass: superclass. 
self assert: (self entity superclass notNil).
self assert: self entity superclass equals: superclass.
self assertCollection: superclass subInheritances hasSameElements: {self entity}
]
