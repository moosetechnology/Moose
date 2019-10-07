Trait {
	#name : #TFamixTInheritanceTest,
	#instVars : [
		'subclass',
		'superclass'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTInheritanceTest >> testSubclass [
subclass := MooseEntity new copyWithTalent: FamixTWithInheritances. 
subclass class initializeSlots: subclass.
model add: subclass.
self entity subclass: subclass. 
self assert: (self entity subclass notNil).
self assert: self entity subclass equals: subclass.
self assertCollection: subclass superInheritances hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTInheritanceTest >> testSuperclass [
superclass := MooseEntity new copyWithTalent: FamixTWithInheritances. 
superclass class initializeSlots: superclass.
model add: superclass.
self entity superclass: superclass. 
self assert: (self entity superclass notNil).
self assert: self entity superclass equals: superclass.
self assertCollection: superclass subInheritances hasSameElements: {self entity}
]
