Class {
	#name : #FMRepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		't'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMRepositoryTest >> setUp [
	super setUp.
	t := FMTower new
]

{ #category : #running }
FMRepositoryTest >> testAdd [
	t metamodel add: t metaMetamodel packages anyOne.
	self assert: t metamodel size equals: 1
]

{ #category : #running }
FMRepositoryTest >> testDeepAdd [
	t metamodel deepAdd: t metaMetamodel packages anyOne.	"= a root element."
	self assert: t metamodel size equals: t metaMetamodel size
]

{ #category : #running }
FMRepositoryTest >> testDeepAddLeaf [
	t metamodel deepAdd: t metaMetamodel properties anyOne.	"= a leaf element."
	self assert: t metamodel size equals: t metaMetamodel size
]

{ #category : #running }
FMRepositoryTest >> testDeepRemove [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel deepRemove: t metaMetamodel packages anyOne.
	self assertEmpty: t metamodel
]

{ #category : #running }
FMRepositoryTest >> testDeepRemoveLeaf [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel deepRemove: t metaMetamodel properties anyOne.
	self assertEmpty: t metamodel
]

{ #category : #running }
FMRepositoryTest >> testRemove [
	| element |
	element := t metaMetamodel packages anyOne.
	t metamodel add: element.
	t metamodel remove: element.
	self assertEmpty: t metamodel
]

{ #category : #running }
FMRepositoryTest >> testSilentRemove [
	self shouldnt: [ t metamodel remove: nil ] raise: Exception.
	self assertEmpty: t metamodel
]
