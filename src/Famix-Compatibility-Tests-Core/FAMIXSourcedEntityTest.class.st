"
I am an abstract test class for the tests of FAMIXSourcedEntity's subclasses
"
Class {
	#name : #FAMIXSourcedEntityTest,
	#superclass : #FAMIXEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXSourcedEntityTest class >> isAbstract [
	^ self = FAMIXSourcedEntityTest
]

{ #category : #tests }
FAMIXSourcedEntityTest >> testAddComment [
	| inst comment |
	inst := self actualClass new.
	comment := FAMIXComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	self assert: comment container equals: inst
]

{ #category : #tests }
FAMIXSourcedEntityTest >> testAddCommentFromString [
	| inst |
	inst := self actualClass new.
	inst addComment: 'This is a test'.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne content equals: 'This is a test'
]

{ #category : #tests }
FAMIXSourcedEntityTest >> testAddCommentRaiseErrorOnWrongObject [
	self should: [ self actualClass new addComment: FAMIXSourceAnchor new ] raise: Error
]

{ #category : #tests }
FAMIXSourcedEntityTest >> testRemoveComment [
	| inst comment |
	inst := self actualClass new.
	comment := FAMIXComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	inst removeComment: comment.
	self assert: inst comments size equals: 0
]
