Trait {
	#name : #TFamixTWithSourceAnchorTest,
	#instVars : [
		'sourceanchor'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSourceAnchorTest >> testWithSourceAnchor [
sourceanchor:= MooseEntity new copyWithTalent: FamixTSourceAnchor.
self entity sourceAnchor: sourceanchor.
self assert: (self entity sourceAnchor notNil).
self assert: self entity sourceAnchor equals: sourceanchor.
self assert: sourceanchor element equals: entity
]
