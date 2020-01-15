Class {
	#name : #MooseModelRootTests,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'model',
		'modelClass',
		'savedRoot'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #'building suites' }
MooseModelRootTests class >> testParameters [
	^ ParametrizedTestMatrix new
		forSelector: #modelClass
		addOptions: MooseModel allSubclasses
]

{ #category : #tests }
MooseModelRootTests >> modelClass [
	^ modelClass
]

{ #category : #tests }
MooseModelRootTests >> modelClass: aMooseModelClass [
	modelClass := aMooseModelClass
]

{ #category : #tests }
MooseModelRootTests >> setUp [
	super setUp.
	savedRoot := MooseModelRoot installedRoot.
	MooseModelRoot resetRoot
]

{ #category : #tests }
MooseModelRootTests >> tearDown [
	super tearDown.
	MooseModelRoot installRoot: savedRoot
]

{ #category : #tests }
MooseModelRootTests >> testCreate [

	model := self modelClass new.
	self deny: (MooseModel root includes: model).
	self modelClass root add: model.
	self assert: (MooseModel root includes: model).
	self assert: (self modelClass root includes: model).
	
]

{ #category : #tests }
MooseModelRootTests >> testModelRootPointsToMooseModelRootRoot [
	self assert: self modelClass root equals: MooseModelRoot root
]

{ #category : #tests }
MooseModelRootTests >> testRemove [
	model := self modelClass new.
	self modelClass root add: model.
	model remove.
	self deny: (MooseModel root includes: model).
	self deny: (self modelClass root includes: model)
]
