Trait {
	#name : #TFamixTAssociationTest,
	#instVars : [
		'next',
		'previous'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAssociationTest >> testNext [
next := MooseEntity new copyWithTalent: FamixTAssociation. 
next class initializeSlots: next.
model add: next.
self entity next: next. 
self assert: (self entity next notNil).
self assert: self entity next equals: next.
self assert: next previous equals: self entity
]

{ #category : #tests }
TFamixTAssociationTest >> testPrevious [
previous := MooseEntity new copyWithTalent: FamixTAssociation. 
previous class initializeSlots: previous.
model add: previous.
self entity previous: previous. 
self assert: (self entity previous notNil).
self assert: self entity previous equals: previous.
self assert: previous next equals: self entity
]
