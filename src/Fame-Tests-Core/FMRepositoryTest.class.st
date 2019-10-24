Class {
	#name : #FMRepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		'metamodel',
		'element'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMRepositoryTest >> setUp [
	super setUp.
	metamodel := FMMetaModel new.
	element := FM3Object instance
]

{ #category : #running }
FMRepositoryTest >> testAdd [
	self assertEmpty: metamodel.
	metamodel add: element.
	self assert: metamodel size equals: 1
]

{ #category : #running }
FMRepositoryTest >> testRemove [
	metamodel add: element.
	self denyEmpty: metamodel.
	metamodel remove: element.
	self assertEmpty: metamodel
]

{ #category : #running }
FMRepositoryTest >> testSilentRemove [
	self shouldnt: [ metamodel remove: nil ] raise: Exception.
	self assertEmpty: metamodel
]
