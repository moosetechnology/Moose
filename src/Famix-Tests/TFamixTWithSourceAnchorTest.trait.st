Trait {
	#name : #TFamixTWithSourceAnchorTest,
	#instVars : [
		'sourceAnchor'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSourceAnchorTest >> testSourceAnchor [
sourceAnchor := MooseEntity new copyWithTalent: FamixTSourceAnchor. 
sourceAnchor class initializeSlots: sourceAnchor.
model add: sourceAnchor.
self entity sourceAnchor: sourceAnchor. 
self assert: (self entity sourceAnchor notNil).
self assert: self entity sourceAnchor equals: sourceAnchor.
self assert: sourceAnchor element equals: self entity
]
