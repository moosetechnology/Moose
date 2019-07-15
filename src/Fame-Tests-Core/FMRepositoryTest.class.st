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
	t metamodel size should = 1
]

{ #category : #running }
FMRepositoryTest >> testCompositeAdd [
	t metamodel compositeAdd: t metaMetamodel packages anyOne.
	t metamodel size should = t metaMetamodel size
]

{ #category : #running }
FMRepositoryTest >> testCompositeAddLeaf [
	t metamodel compositeAdd: t metaMetamodel properties anyOne.	"Properties are leaves."
	t metamodel size should = 1
]

{ #category : #running }
FMRepositoryTest >> testCompositeRemove [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel compositeRemove: t metaMetamodel packages anyOne.	"= a root element."
	t metamodel isEmpty should beTrue
]

{ #category : #running }
FMRepositoryTest >> testCompositeRemoveLeaf [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel compositeRemove: t metaMetamodel properties anyOne.	"= a root element."
	t metamodel size should = (t metaMetamodel size - 1)
]

{ #category : #running }
FMRepositoryTest >> testDeepAdd [
	t metamodel deepAdd: t metaMetamodel packages anyOne.	"= a root element."
	t metamodel size should = t metaMetamodel size
]

{ #category : #running }
FMRepositoryTest >> testDeepAddLeaf [
	t metamodel deepAdd: t metaMetamodel properties anyOne.	"= a leaf element."
	t metamodel size should = t metaMetamodel size
]

{ #category : #running }
FMRepositoryTest >> testDeepRemove [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel deepRemove: t metaMetamodel packages anyOne.
	t metamodel isEmpty should beTrue
]

{ #category : #running }
FMRepositoryTest >> testDeepRemoveLeaf [
	t metamodel addAll: t metaMetamodel elements.
	t metamodel deepRemove: t metaMetamodel properties anyOne.
	t metamodel isEmpty should beTrue
]

{ #category : #running }
FMRepositoryTest >> testRemove [
	| element |
	element := t metaMetamodel packages anyOne.
	t metamodel add: element.
	t metamodel remove: element.
	t metamodel isEmpty should beTrue
]

{ #category : #running }
FMRepositoryTest >> testSilentRemove [
	self shouldnt: [ t metamodel remove: nil ] raise: Exception.
	t metamodel isEmpty should beTrue
]
