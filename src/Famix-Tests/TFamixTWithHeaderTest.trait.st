Trait {
	#name : #TFamixTWithHeaderTest,
	#instVars : [
		'header'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithHeaderTest >> testWithHeader [
header:= MooseEntity new copyWithTalent: FamixTHeader.
self entity header: header.
self assert: (self entity header notNil).
self assert: self entity header equals: header.
self assert: header headerOwner equals: entity
]
