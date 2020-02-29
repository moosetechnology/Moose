Class {
	#name : #TestTag,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'FamixTags-tests'
}

{ #category : #running }
TestTag >> setUp [
	model := MooseModel new.
	1 to: 5 do: [ :i |
		MooseEntity new mooseModel: model]
]

{ #category : #tests }
TestTag >> testCreateTags [
	self assert: model allTags size equals: 0.

	model tagNamed: 'tag1'.
	self assert: model allTags size equals: 1.
	model tagNamed: 'tag2'.
	self assert: model allTags size equals: 2.
	model tagNamed: 'tag1'.
	self assert: model allTags size equals: 2.

]

{ #category : #tests }
TestTag >> testRemoveTag [
	| entity tag1 tag2 |
	entity := model entities first.
	tag1 := model tagNamed: 'tag1'.
	tag2 := model tagNamed: 'tag2'.

	entity addTag: tag1.
	entity addTag: tag2.
	
	self assert: entity allTags size equals: 2.
	self assert: tag1 entities size equals: 1.
	self assert: tag2 entities size equals: 1.

	entity removeTag: tag1.
	self assert: entity allTags size equals: 1.
	self assert: tag1 entities size equals: 0.
	self assert: tag2 entities size equals: 1.
	
]

{ #category : #tests }
TestTag >> testResetModelTags [
	| entity1 entity2 |
	entity1 := model entities first.
	entity2 := model entities second.

	entity1 addTag: (model tagNamed: 'tag1').
	entity2 addTag: (model tagNamed: 'tag2').

	self assert: model allTags size equals: 2.
	self assert: entity1 allTags size equals: 1.
	self assert: entity2 allTags size equals: 1.

	model resetTags.
	self assert: model allTags size equals: 0.
	self assert: entity1 allTags size equals: 0.
	self assert: entity2 allTags size equals: 0.
	
]

{ #category : #tests }
TestTag >> testResetTags [
	| entity1 entity2 tag |
	entity1 := model entities first.
	entity2 := model entities second.
	tag := model tagNamed: 'tag'.

	entity1 addTag: tag.
	entity2 addTag: tag.

	self assert: entity1 allTags size equals: 1.
	self assert: entity2 allTags size equals: 1.
	self assert: tag entities size equals: 2.

	tag reset.
	self assert: entity1 allTags size equals: 0.
	self assert: entity2 allTags size equals: 0.
	self assert: tag entities size equals: 0.
	
]

{ #category : #tests }
TestTag >> testTagEntity [
	| entity tag |
	entity := model entities first.
	tag := model tagNamed: 'tag1'.
	
	self assert: entity allTags size equals: 0.
	self assert: tag entities size equals: 0.

	tag addEntity: entity.
	self assert: entity allTags size equals: 1.
	self assert: tag entities size equals: 1.

	tag addEntity: entity.
	self assert: entity allTags size equals: 1.
	self assert: tag entities size equals: 1.

]
