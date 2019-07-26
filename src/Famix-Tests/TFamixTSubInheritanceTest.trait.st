Trait {
	#name : #TFamixTSubInheritanceTest,
	#instVars : [
		'subclass'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSubInheritanceTest >> testSubclass [
subclass := MooseEntity new copyWithTalent: FamixTWithSubInheritances. 
subclass class initializeSlots: subclass.
model add: subclass.
self entity subclass: subclass. 
self assert: (self entity subclass notNil).
self assert: self entity subclass equals: subclass.
self assertCollection: subclass superInheritances hasSameElements: {self entity}
]
