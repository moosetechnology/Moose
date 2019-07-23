Trait {
	#name : #TFamixTWithCommentsTest,
	#instVars : [
		'comment1',
		'comment2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithCommentsTest >> testComments [
comment1 := MooseEntity new copyWithTalent: FamixTComment.
comment1 class initializeSlots: comment1.
model add: comment1.
comment2 := MooseEntity new copyWithTalent: FamixTComment.
comment2 class initializeSlots: comment2.
model add: comment2.
self entity addComment: comment1.
self entity addComment: comment2.
self assert: (self entity comments notEmpty).
self assertCollection: self entity comments hasSameElements: {  comment1. comment2 }.
self assert: comment1 container equals: self entity
]
