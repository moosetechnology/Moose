"
I am an abstract test class for the tests of FamixStSourcedEntity's subclasses
"
Class {
	#name : #FamixStSourcedEntityTest,
	#superclass : #FamixStEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #'as yet unclassified' }
FamixStSourcedEntityTest >> actualClass [ 
		^ FamixStSourcedEntity
]

{ #category : #tests }
FamixStSourcedEntityTest >> testAddComment [
	| inst comment |
	inst := self actualClass new.
	comment := FamixStComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	self assert: comment container equals: inst
]

{ #category : #tests }
FamixStSourcedEntityTest >> testAddCommentFromString [
	| inst |
	inst := self actualClass new.
	inst addComment: (FamixStComment new content: 'This is a test'; yourself).
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne content equals: 'This is a test'
]

{ #category : #tests }
FamixStSourcedEntityTest >> testAddCommentRaiseErrorOnWrongObject [
	self should: [ self actualClass new addComment: FamixStSourceAnchor new ] raise: Error
]

{ #category : #tests }
FamixStSourcedEntityTest >> testRemoveComment [
	| inst comment |
	inst := self actualClass new.
	comment := FamixStComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	inst removeComment: comment.
	self assert: inst comments size equals: 0
]
