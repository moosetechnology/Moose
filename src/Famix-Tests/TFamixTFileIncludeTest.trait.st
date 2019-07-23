Trait {
	#name : #TFamixTFileIncludeTest,
	#instVars : [
		'source',
		'target'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFileIncludeTest >> testSource [
source := MooseEntity new copyWithTalent: FamixTWithFileIncludes. 
source class initializeSlots: source.
model add: source.
self entity source: source. 
self assert: (self entity source notNil).
self assert: self entity source equals: source.
self assertCollection: source outgoingIncludeRelations hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTFileIncludeTest >> testTarget [
target := MooseEntity new copyWithTalent: FamixTWithFileIncludes. 
target class initializeSlots: target.
model add: target.
self entity target: target. 
self assert: (self entity target notNil).
self assert: self entity target equals: target.
self assertCollection: target incomingIncludeRelations hasSameElements: {self entity}
]
