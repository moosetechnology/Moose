Trait {
	#name : #TFamixTWithFileIncludesTest,
	#instVars : [
		'fileInclude1',
		'fileInclude2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithFileIncludesTest >> testIncomingIncludeRelations [
fileInclude1 := MooseEntity new copyWithTalent: FamixTFileInclude.
fileInclude1 class initializeSlots: fileInclude1.
model add: fileInclude1.
fileInclude2 := MooseEntity new copyWithTalent: FamixTFileInclude.
fileInclude2 class initializeSlots: fileInclude2.
model add: fileInclude2.
self entity addIncomingIncludeRelation: fileInclude1.
self entity addIncomingIncludeRelation: fileInclude2.
self assert: (self entity incomingIncludeRelations notEmpty).
self assertCollection: self entity incomingIncludeRelations hasSameElements: {  fileInclude1. fileInclude2 }.
self assert: fileInclude1 target equals: self entity
]

{ #category : #tests }
TFamixTWithFileIncludesTest >> testOutgoingIncludeRelations [
fileInclude1 := MooseEntity new copyWithTalent: FamixTFileInclude.
fileInclude1 class initializeSlots: fileInclude1.
model add: fileInclude1.
fileInclude2 := MooseEntity new copyWithTalent: FamixTFileInclude.
fileInclude2 class initializeSlots: fileInclude2.
model add: fileInclude2.
self entity addOutgoingIncludeRelation: fileInclude1.
self entity addOutgoingIncludeRelation: fileInclude2.
self assert: (self entity outgoingIncludeRelations notEmpty).
self assertCollection: self entity outgoingIncludeRelations hasSameElements: {  fileInclude1. fileInclude2 }.
self assert: fileInclude1 source equals: self entity
]
