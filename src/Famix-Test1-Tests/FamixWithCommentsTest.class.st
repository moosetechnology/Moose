Class {
	#name : #FamixWithCommentsTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
FamixWithCommentsTest >> testComments [
	| comment comment2 |
	comment := FamixTest1Comment new.
	comment2 := FamixTest1Comment new.

	self assertEmpty: c1 comments.

	self deny: comment container equals: c1.
	self deny: comment2 container equals: c1.
	c1 comments: {comment . comment2}.
	self assert: comment container equals: c1.
	self assert: comment2 container equals: c1
]

{ #category : #tests }
FamixWithCommentsTest >> testHasComments [
	| comment |
	comment := FamixTest1Comment new.

	self deny: c1 hasComments.
	c1 addComment: comment.
	self assert: c1 hasComments
]

{ #category : #tests }
FamixWithCommentsTest >> testPrivateAddComment [
	| comment |
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 addComment: comment.
	self assertCollection: c1 comments hasSameElements: {comment}
]

{ #category : #tests }
FamixWithCommentsTest >> testRemoveComment [
	| comment |
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 addComment: comment.
	c1 removeComment: comment.
	self assertEmpty: c1 comments
]
