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
TFamixTWithCommentsTest >> testWithComments [
comment1:= MooseEntity new copyWithTalent: FamixTComment.
comment2:= MooseEntity new copyWithTalent: FamixTComment.
self entity addComment: comment1.
self entity addComment: comment2.
self assert: (self entity comments notEmpty).
	self assertCollection: self entity comments hasSameElements: { comment1. comment2 }.
self assert: comment1 container equals: entity
]

{ #category : #tests }
TFamixTWithCommentsTest >> testWithoutComments [
			self assert: (self entity comments isEmpty)
]
