Class {
	#name : #MooseEntityWithTest1ModelTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
MooseEntityWithTest1ModelTest >> testIsContainerEntity [
	self assert: c1 isContainerEntity.
	self deny: a1 isContainerEntity
]

{ #category : #tests }
MooseEntityWithTest1ModelTest >> testIsRoot [
	self assert: c1 isRoot.
	self deny: m1 isRoot
]
