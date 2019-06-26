Trait {
	#name : #TFamixTWithFileIncludesTest,
	#instVars : [
		'fileinclude1',
		'fileinclude2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithFileIncludesTest >> testWithFileIncludes [
fileinclude1:= MooseEntity new copyWithTalent: FamixTFileInclude.
fileinclude2:= MooseEntity new copyWithTalent: FamixTFileInclude.
self entity addIncomingIncludeRelation: fileinclude1.
self entity addIncomingIncludeRelation: fileinclude2.
self assert: (self entity incomingIncludeRelations notEmpty).
	self assertCollection: self entity incomingIncludeRelations hasSameElements: { fileinclude1. fileinclude2 }.
self assert: fileinclude1 target equals: entity
]

{ #category : #tests }
TFamixTWithFileIncludesTest >> testWithoutFileIncludes [
			self assert: (self entity incomingIncludeRelations isEmpty)
]
