Trait {
	#name : #TFamixTReferenceTest,
	#instVars : [
		'source',
		'target'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTReferenceTest >> testSource [
source := MooseEntity new copyWithTalent: FamixTWithReferences. 
source class initializeSlots: source.
model add: source.
self entity source: source. 
self assert: (self entity source notNil).
self assert: self entity source equals: source.
self assertCollection: source outgoingReferences hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTReferenceTest >> testTarget [
target := MooseEntity new copyWithTalent: FamixTReferenceable. 
target class initializeSlots: target.
model add: target.
self entity target: target. 
self assert: (self entity target notNil).
self assert: self entity target equals: target.
self assertCollection: target incomingReferences hasSameElements: {self entity}
]
