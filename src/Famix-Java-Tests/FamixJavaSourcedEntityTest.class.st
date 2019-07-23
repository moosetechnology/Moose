"
I am an abstract test class for the tests of FAMIXSourcedEntity's subclasses
"
Class {
	#name : #FamixJavaSourcedEntityTest,
	#superclass : #FamixJavaEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #testing }
FamixJavaSourcedEntityTest class >> isAbstract [
	^ self = FamixJavaSourcedEntityTest
]

{ #category : #tests }
FamixJavaSourcedEntityTest >> testAddComment [
	| inst comment |
	inst := self actualClass new.
	comment := FamixJavaComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	self assert: comment container equals: inst
]

{ #category : #tests }
FamixJavaSourcedEntityTest >> testAddCommentFromString [
	| inst |
	self skip: 'A generated test replace this one'.
	inst := self actualClass new.
	inst addComment: 'This is a test'.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne content equals: 'This is a test'
]

{ #category : #tests }
FamixJavaSourcedEntityTest >> testAddCommentRaiseErrorOnWrongObject [
	self should: [ self actualClass new addComment: FamixJavaSourceAnchor new ] raise: Error
]

{ #category : #tests }
FamixJavaSourcedEntityTest >> testRemoveComment [
	| inst comment |
	inst := self actualClass new.
	comment := FamixJavaComment content: 'This is a test'.
	inst addComment: comment.
	self assert: inst comments size equals: 1.
	self assert: inst comments anyOne equals: comment.
	inst removeComment: comment.
	self assert: inst comments size equals: 0
]
