Trait {
	#name : #TFamixTWithAccessesTest,
	#instVars : [
		'accesse1',
		'accesse2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAccessesTest >> testWithAccesses [
accesse1:= MooseEntity new copyWithTalent: FamixTAccess.
accesse2:= MooseEntity new copyWithTalent: FamixTAccess.
self entity addAccess: accesse1.
self entity addAccess: accesse2.
self assert: (self entity accesses notEmpty).
	self assertCollection: self entity accesses hasSameElements: { accesse1. accesse2 }.
self assert: accesse1 accessor equals: entity
]

{ #category : #tests }
TFamixTWithAccessesTest >> testWithoutAccesses [
			self assert: (self entity accesses isEmpty)
]
