Trait {
	#name : #TFamixTFileTest,
	#instVars : [
		'withFiles1',
		'withFiles2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFileTest >> testEntities [
withFiles1 := MooseEntity new copyWithTalent: FamixTWithFiles.
withFiles1 class initializeSlots: withFiles1.
model add: withFiles1.
withFiles2 := MooseEntity new copyWithTalent: FamixTWithFiles.
withFiles2 class initializeSlots: withFiles2.
model add: withFiles2.
self entity addEntity: withFiles1.
self entity addEntity: withFiles2.
self assert: (self entity entities notEmpty).
self assertCollection: self entity entities hasSameElements: {  withFiles1. withFiles2 }.
self assertCollection: withFiles1 containerFiles hasSameElements: {self entity}
]
