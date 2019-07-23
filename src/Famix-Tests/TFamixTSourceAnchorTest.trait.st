Trait {
	#name : #TFamixTSourceAnchorTest,
	#instVars : [
		'element'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSourceAnchorTest >> testElement [
element := MooseEntity new copyWithTalent: FamixTWithSourceAnchor. 
element class initializeSlots: element.
model add: element.
self entity element: element. 
self assert: (self entity element notNil).
self assert: self entity element equals: element.
self assert: element sourceAnchor equals: self entity
]
