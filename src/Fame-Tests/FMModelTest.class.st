Class {
	#name : #FMModelTest,
	#superclass : #TestCase,
	#instVars : [
		'element',
		'model'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #testing }
FMModelTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #running }
FMModelTest >> actualClass [
	^ FMModel
]

{ #category : #running }
FMModelTest >> setUp [
	super setUp.
	model := self actualClass new.
	element := FM3Object instance
]

{ #category : #tests }
FMModelTest >> testAdd [
	self assertEmpty: model.
	model add: element.
	self assert: model size equals: 1
]

{ #category : #tests }
FMModelTest >> testRemove [
	model add: element.
	self denyEmpty: model.
	model remove: element.
	self assertEmpty: model
]

{ #category : #tests }
FMModelTest >> testSilentRemove [
	self shouldnt: [ model remove: nil ] raise: Exception.
	self assertEmpty: model
]
